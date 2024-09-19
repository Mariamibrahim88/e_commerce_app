import 'package:e_commerce_app/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_app/common/bloc/button/button_state.dart';
import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/appBar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/button/reactive_button.dart';
import 'package:e_commerce_app/domain/auth/use_cases/reset_email.dart';
import 'package:e_commerce_app/presentation/auth/pages/send_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => ButtonCubit(),
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonLoadFailure) {
              var snackbar = SnackBar(
                content: Text(
                  state.message,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            } else if (state is ButtonLoaded) {
              AppNavigator.push(context, const SendEmailView());
              var snackbar = const SnackBar(
                content: Text(
                  'Signin successfully',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _forgotpassText(context),
                const SizedBox(height: 32),
                _emailField(context),
                const SizedBox(height: 20),
                _continueButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotpassText(BuildContext context) {
    return const Text(
      'Forgot Password',
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Enter Email Address',
      ),
    );
  }

  Widget _continueButton() {
    return Builder(builder: (context) {
      return ReactiveButton(
          onPressed: () {
            context
                .read<ButtonCubit>()
                .execute(useCase: ResetEmailUseCase(), params: _emailCon.text);
            // AppNavigator.push(context, const SendEmailView());
          },
          title: 'Continue');
    });
  }
}
