import 'package:e_commerce_app/common/bloc/products/product_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (value.isEmpty) {
          context.read<ProductDisplayCubit>().initialDisplay();
        } else {
          context.read<ProductDisplayCubit>().displayProducts(params: value);
        }
      },
      enabled: enabled,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: 'Search for products',
        prefixIcon: const Icon(Icons.search),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
