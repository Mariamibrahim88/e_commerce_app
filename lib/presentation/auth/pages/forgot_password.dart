import 'package:e_commerce_app/common/widgets/appBar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _forgotpassText(context),
            const SizedBox(height: 32),
            _emailField(context),
            const SizedBox(height: 20),
            _continueButton(context),
          ],
        ),
      ),
    );
  }
}

Widget _forgotpassText(BuildContext context) {
  return const Text(
    'Forgot Password',
    style: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
  );
}

Widget _emailField(BuildContext context) {
  return const TextField(
    decoration: InputDecoration(
      hintText: 'Enter Email Address',
    ),
  );
}

Widget _continueButton(BuildContext context) {
  return BasicAppButton(onPressed: () {}, title: 'Continue');
}
