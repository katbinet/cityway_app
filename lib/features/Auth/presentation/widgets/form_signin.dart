import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/resource/font_manger.dart';
import 'package:city_way/core/resource/size_manger.dart';
import 'package:city_way/core/theme/app_theme.dart';
import 'package:city_way/core/util/btn_infinite_width.dart';
import 'package:city_way/core/util/enum.dart';
import 'package:city_way/features/Auth/presentation/widgets/Text_Form_Field_Widget.dart';
import 'package:city_way/features/Auth/presentation/widgets/circle_logo_widget.dart';
import 'package:flutter/material.dart';

//! done all style & size & padding

class FormSignIn extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FormSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    /*void signIn() async {
      try {
        //UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        // Navigate to the home screen
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/homePage');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          // Handle the error here
        }
      }
    }
    */
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CricleLogoWidget(text: 'Sign in'),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: AppHeightManger.h3,
            ),
            Padding(
              padding: const EdgeInsets.all(AppPaddingManger.p12),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormFieldWidget(
                      controller: _emailController,
                      name: 'E-mail',
                      icon: Icons.person,
                      type: FieldType.text,
                    ),
                    TextFormFieldWidget(
                      controller: _passwordController,
                      name: 'password',
                      icon: Icons.lock,
                      type: FieldType.password,
                    ),
                    Text("Forgot password? ",
                        style: appTextTheme.headlineMedium),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPaddingManger.p50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Btn(
                            onPressed: () {
                              Navigator.pushNamed(context, '/homeLayout');
                            },
                            text: 'Sign in',
                            color: AppColorManger.mainAppColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: AppPaddingManger.p30,
                                bottom: AppPaddingManger.p30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dont’t have an account?',
                                  style: TextStyle(
                                    fontWeight: FontWeightManger.semiBoldWeight,
                                    fontSize: FontSizeManger.fs18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/signup');
                                  },
                                  child: Text(
                                    'sign up',
                                    style: TextStyle(
                                      fontSize: FontSizeManger.fs18,
                                      color: AppColorManger.secondaryAppColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: AppPaddingManger.p30,
                                right: AppPaddingManger.p30),
                            child: Btn(
                              onPressed: () {
                                //Navigator.pushNamed(context, '/homeLayout');
                                //Navigator.pushNamed(context, '/categories');
                                Navigator.pushNamed(context, '/categories');
                              },
                              text: 'Quick request',
                              color: AppColorManger.secondaryAppColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
