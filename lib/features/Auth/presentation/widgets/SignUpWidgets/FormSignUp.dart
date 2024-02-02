import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/btnInfiniteWidth.dart';
import 'package:city_way/core/util/enum.dart';
import 'package:city_way/features/Auth/domain/entities/user.dart' as CityUser;
import 'package:city_way/features/Auth/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:city_way/features/Auth/presentation/pages/SignIn/SignIn_Page.dart';
import 'package:city_way/features/Auth/presentation/pages/SignUp/Confirm_Page.dart';
import 'package:city_way/features/Auth/presentation/widgets/Text_Form_Field_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormSignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  FormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void signUp() {
      final isValid = _formKey.currentState!.validate();

      if (isValid) {
        final user = CityUser.User(
            name: _nameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            password: _passwordController.text,
            confirmPassword: _confirmController.text);

        BlocProvider.of<SignupBloc>(context).add(SignUpEvent(user: user));
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Image.asset('assets/image/logo.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormFieldWidget(
                  controller: _nameController,
                  name: 'User Name',
                  icon: Icons.person,
                  type: FieldType.text,
                ),
                TextFormFieldWidget(
                  controller: _emailController,
                  name: 'E-mail',
                  icon: Icons.email,
                  type: FieldType.text,
                ),
                TextFormFieldWidget(
                  controller: _phoneController,
                  name: 'Phone Number',
                  icon: Icons.phone,
                  type: FieldType.number,
                ),
                TextFormFieldWidget(
                  controller: _passwordController,
                  name: 'password',
                  icon: Icons.lock,
                  type: FieldType.password,
                ),
                TextFormFieldWidget(
                  controller: _confirmController,
                  name: 'Confirm Password',
                  icon: Icons.lock,
                  type: FieldType.password,
                ),
              ],
            ),
          ),
        ),
        Btn(
          onPressed: () async {
            signUp();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmPage(),
              ),
            );
          },
          text: 'Sign up',
          color: AppColorManger.mainAppColor,
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              },
              child: const Text(
                'sign in',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColorManger.secondaryAppColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
