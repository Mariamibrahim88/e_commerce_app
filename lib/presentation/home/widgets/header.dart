import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _profileImage(context),
          _gender(context),
          _card(context),
        ],
      ),
    );
  }

  Widget _profileImage(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }

  Widget _gender(BuildContext context) {
    return Container(
      height: 40,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.secondBackground),
    );
  }

  Widget _card(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset('assets/vectors/Frame 32.png'),
    );
  }
}
