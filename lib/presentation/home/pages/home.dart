import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/presentation/home/widgets/categories.dart';
import 'package:e_commerce_app/presentation/home/widgets/header.dart';
import 'package:e_commerce_app/presentation/home/widgets/new_in_products.dart';
import 'package:e_commerce_app/presentation/home/widgets/search_field.dart';
import 'package:e_commerce_app/presentation/home/widgets/top_selling_products.dart';
import 'package:e_commerce_app/presentation/search/pages/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      AppNavigator.push(context, const Search());
                    },
                    child: const SearchField(
                      enabled: false,
                    )),
                const SizedBox(
                  height: 30,
                ),
                const Categories(),
                const SizedBox(
                  height: 18,
                ),
                const TopSellingProducts(),
                const SizedBox(
                  height: 18,
                ),
                const NewInProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
