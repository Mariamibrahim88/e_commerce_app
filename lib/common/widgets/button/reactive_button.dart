import 'package:e_commerce_app/common/bloc/button/button_cubit.dart';
import 'package:e_commerce_app/common/bloc/button/button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReactiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final double? height;
  final Widget? content;

  const ReactiveButton(
      {required this.onPressed,
      this.title,
      this.height,
      super.key,
      this.content});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(builder: (context, state) {
      if (state is ButtonLoading) {
        return _loadingbutton(context);
      }
      return _initial(context);
    });
  }

  Widget _loadingbutton(BuildContext context) {
    return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 50),
        ),
        child: Container(
            height: height ?? 50,
            alignment: Alignment.center,
            child: const CircularProgressIndicator()));
  }

  Widget _initial(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 50),
        ),
        child: content ??
            Text(
              title ?? ' ',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w400),
            ));
  }
}
