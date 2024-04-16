import 'package:city_way/core/injection/injection_container.dart';
import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/theme/theme_cubit/theme_cubit.dart';
import 'package:city_way/features/Auth/domain/entities/user.dart';
import 'package:city_way/features/Auth/presentation/bloc/signin_bloc/signin_bloc.dart';
import 'package:city_way/features/Auth/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:city_way/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:city_way/core/injection/injection_container.dart' as di;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static final myAppKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //!provider
      //SignUp & signIn & Theme
      providers: [
        BlocProvider<SignupBloc>(
          create: (_) => di.sl<SignupBloc>()
            ..add(const SignUpEvent(user: User(email: '', password: ''))),
        ),
        BlocProvider<SigninBloc>(
          create: (_) => di.sl<SigninBloc>()
            ..add(const SignInEvent(user: User(email: '', password: ''))),
        ),
        BlocProvider<ThemeCubit>.value(value: themeCubit),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ResponsiveSizer(
            builder: (context, orientation, screenType) {
              return MaterialApp(
                title: 'cityWay',
                navigatorKey: MyApp.myAppKey,
                themeMode: state.isLightMode ? ThemeMode.light : ThemeMode.dark,
                //theme:lightTheme(),
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: AppColorManger.mainAppColor),
                  useMaterial3: true,
                ),

                onGenerateRoute: appRouter.onGenerateRoute,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
