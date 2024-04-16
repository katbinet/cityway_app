import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/resource/font_manger.dart';
import 'package:city_way/core/resource/size_manger.dart';
import 'package:city_way/core/util/btn_infinite_width.dart';
import 'package:city_way/core/util/enum.dart';
import 'package:city_way/features/Auth/presentation/widgets/Text_Form_Field_Widget.dart';
import 'package:flutter/material.dart';


//! done padding..

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
    /*void signUp() {
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
*/
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppPaddingManger.p40),
          child: Image.asset('assets/image/logo.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppPaddingManger.p60),
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
            //signUp();
            Navigator.pushNamed(context, '/confirmAccount');
          },
          text: 'Sign up',
          color: AppColorManger.mainAppColor,
        ),
        SizedBox(
          height: AppHeightManger.h3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(
                fontSize: FontSizeManger.fs18,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: Text(
                'sign in',
                style: TextStyle(
                  fontSize: FontSizeManger.fs18,
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
