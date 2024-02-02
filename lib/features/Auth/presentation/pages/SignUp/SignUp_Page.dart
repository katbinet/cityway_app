import 'package:city_way/core/util/snackbar_message.dart';
import 'package:city_way/features/Auth/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:city_way/features/Auth/presentation/pages/SignUp/Confirm_Page.dart';
import 'package:city_way/features/Auth/presentation/widgets/SignUpWidgets/FormSignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
  
    Widget _buildBody(){
      return SingleChildScrollView(
        child: Stack(
          children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: BlocConsumer<SignupBloc, SignupState>(
                listener: (context, State){
                  if(State is SuccessState){
                    SnackBarMessage().showSuccessSnackBar(message: State.message, context: context);
                    Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => ConfirmPage()),
                    (route) => false);
                  }
                  else if (State is ErrorState){
                    SnackBarMessage().showErrorSnackBar(message: State.message, context: context);
                  }
                },
                builder: (context, State){
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