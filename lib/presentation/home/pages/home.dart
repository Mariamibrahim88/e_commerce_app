import 'package:e_commerce_app/presentation/home/widgets/categories.dart';
import 'package:e_commerce_app/presentation/home/widgets/header.dart';
import 'package:e_commerce_app/presentation/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                SizedBox(
                  height: 30,
                ),
                SearchField(),
                SizedBox(
                  height: 30,
                ),
                Categories(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
