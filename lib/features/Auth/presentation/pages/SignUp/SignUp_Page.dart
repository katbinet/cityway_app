import 'package:city_way/core/util/snackbar_message.dart';
import 'package:city_way/features/Auth/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:city_way/features/Auth/presentation/widgets/signup_widgets/form_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//! done Padding...

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.all(10),
            child: BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is SuccessState) {
                  SnackBarMessage().showSuccessSnackBar(
                      message: state.message, context: context);
                  Navigator.pushNamed(context, '/confirmAccount');
                  } else if (state is ErrorState) {
                  SnackBarMessage().showErrorSnackBar(
                      message: state.message, context: context);
                }
              },
              builder: (context, state) {
                //if(State is LoadingState){
                //print("loading");
                //return LoadingWidget();
                // }
                return FormSignUp();
              },
            ),
          ),
        ],
      ),
    );
  }
}
