import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/btnInfiniteWidth.dart';
import 'package:city_way/core/util/enum.dart';
import 'package:city_way/features/Auth/domain/entities/user.dart' as CityUser;
import 'package:city_way/features/Auth/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:city_way/features/Auth/presentation/pages/SignUp/SignUp_Page.dart';
import 'package:city_way/features/Auth/presentation/widgets/Text_Form_Field_Widget.dart';
import 'package:city_way/features/Auth/presentation/widgets/circle_logo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormSignIn extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FormSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void signIn() async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }

      final isValid = _formKey.currentState!.validate();

      if (isValid) {
        final user = CityUser.User(
          email: _emailController.text,
          password: _passwordController.text,
        );

        BlocProvider.of<SignupBloc>(context).add(SignUpEvent(user: user));
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Positioned(child: CricleLogoWidget(text: 'Sign in')),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
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
                const Text("Forgot password? ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Btn(
                        onPressed: signIn,
                        text: 'Sign in',
                        color: AppColorManger.mainAppColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Dont’t have an account?'),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'sign up',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColorManger.secondaryAppColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Btn(
                          onPressed: QuickRequest,
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
    );
  }
}

void QuickRequest() {}
