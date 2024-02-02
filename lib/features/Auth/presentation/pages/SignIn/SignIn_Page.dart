import 'package:city_way/core/util/snackbar_message.dart';
import 'package:city_way/features/Auth/presentation/bloc/signin_bloc/signin_bloc.dart';
import 'package:city_way/features/Auth/presentation/widgets/FormSignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SigninBloc, SigninState>(builder: ((context, state) {
            return FormSignIn();
          }))
          /*BlocConsumer<SigninBloc, SigninState>(listener: (context, State) {
            if (State is SuccessState) {
              SnackBarMessage()
                  .showSuccessSnackBar(message: State.message, context: context);
            } else if (State is ErrorState) {
              SnackBarMessage()
                  .showErrorSnackBar(message: State.message, context: context);
            }
          }, builder: (context, State) {
            //if(State is LoadingState){
            //print("loading");
            //return LoadingWidget();
            // }
            return FormSignIn();
          }),
          */
        )
      ]),
    );
  }
}
