import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/presentation/auth/pages/sign_in.dart';
import 'package:flutter/material.dart';

class SendEmailView extends StatelessWidget {
  const SendEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/vectors/image 4.png',
            ),
            const SizedBox(height: 20),
            _sendEmailText(context),
            const SizedBox(height: 20),
            _returnToLogin(context),
          ],
        ),
      ),
    );
  }

  Widget _sendEmailText(BuildContext context) {
    return const Text(
      textAlign: TextAlign.center,
      'We sent you an email to reset your password.',
      style: TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _returnToLogin(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, SignInView());
      },
      width: 200,
      title: 'Return to Login',
    );
  }
}
