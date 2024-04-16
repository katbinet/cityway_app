import 'package:city_way/core/util/snackbar_message.dart';
import 'package:city_way/features/Auth/presentation/bloc/signin_bloc/signin_bloc.dart';
import 'package:city_way/features/Auth/presentation/widgets/form_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//! done Size...

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
      child: Stack(
        children: [
          BlocConsumer<SigninBloc, SigninState>(listener: (context, state) {
            if (state is SuccessState) {
              SnackBarMessage()
                  .showSuccessSnackBar(message: state.message, context: context);
            } else if (state is ErrorState) {
              SnackBarMessage()
                  .showErrorSnackBar(message: state.message, context: context);
            }
          }, builder: (context, state) {
            //if(State is LoadingState){
            //print("loading");
            //return LoadingWidget();
            // }
            return FormSignIn();
          }),
      ]),
    );
  }
}
