import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/appBar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_app/presentation/auth/pages/enter_password.dart';
import 'package:e_commerce_app/presentation/auth/pages/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final TextEditingController _emailCon = TextEditingController();
  //final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            const SizedBox(height: 32),
            _emailField(context, _emailCon),
            const SizedBox(height: 20),
            _continueButton(context),
            const SizedBox(height: 15),
            _createAccountText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text(
      'Sign In',
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _emailField(BuildContext context, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
        onPressed: () {
          AppNavigator.pushReplacement(
              context,
              EnterPasswordView(
                user: UserSigninReq(
                  email: _emailCon.text,
                ),
              ));
        },
        title: 'Continue');
  }

  Widget _createAccountText(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
          text: 'Don\'t have an account? ',
        ),
        TextSpan(
          text: 'Create Account',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SignUpView());
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
