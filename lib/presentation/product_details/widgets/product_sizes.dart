import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SelectedSize extends StatelessWidget {
  const SelectedSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.secondBackground),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Size',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
            Row(
              children: [
                Text('S',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
