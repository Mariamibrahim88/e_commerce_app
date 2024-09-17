import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/appBar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_app/presentation/auth/pages/selection_gender_and_age_view.dart';
import 'package:e_commerce_app/presentation/auth/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signupText(context),
              const SizedBox(height: 32),
              _emailField(context, 'Enter First Name', _firstNameCon),
              const SizedBox(height: 10),
              _emailField(context, 'Enter Last Name', _lastNameCon),
              const SizedBox(height: 10),
              _emailField(context, 'Enter Email Address', _emailCon),
              const SizedBox(height: 10),
              _emailField(context, 'Enter Password', _passwordCon),
              const SizedBox(height: 15),
              _continueButton(context),
              const SizedBox(height: 15),
              _douhaveaccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return const Text(
      'Create Account',
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _emailField(BuildContext context, final String text,
      TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
        onPressed: () {
          AppNavigator.push(
              context,
              SelectionView(
                  userCreationReq: UserCreationReq(
                      firstName: _firstNameCon.text,
                      lastName: _lastNameCon.text,
                      email: _emailCon.text,
                      password: _passwordCon.text)));
        },
        title: 'Continue');
  }

  Widget _douhaveaccount(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
          text: 'Do you have an account? ',
        ),
        TextSpan(
          text: 'Sign In',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SignInView());
            },
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
