import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/core/config/assets/app_vectors.dart';
import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/domain/auth/entity/user.dart';
import 'package:e_commerce_app/presentation/cart/pages/cart.dart';
import 'package:e_commerce_app/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:e_commerce_app/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoDisplayLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserInfoDisplayLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(context, state.user),
                _gender(context, state.user),
                _card(context),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _profileImage(BuildContext context, UserEntity user) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: user.image.isEmpty
              ? const AssetImage(AppVectors.profile)
              : NetworkImage(user.image),
        ),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }

  Widget _gender(BuildContext context, UserEntity user) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.secondBackground),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const CartPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset('assets/vectors/Frame 32.png'),
      ),
    );
  }
}
