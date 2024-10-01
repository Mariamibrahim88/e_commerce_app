import 'package:e_commerce_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:e_commerce_app/common/bloc/categories/categories_display_state.dart';
import 'package:e_commerce_app/common/helper/images/image_display.dart';
import 'package:e_commerce_app/common/widgets/appBar/app_bar.dart';
import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/domain/category/entity/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: BlocProvider(
        create: (context) => CategoriesDisplayCubit()..displayCategories(),
        child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
            builder: (context, state) {
          if (state is CategoriesDisplayLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoriesDisplayLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BasicAppbar(),
                const SizedBox(
                  height: 20,
                ),
                _title(),
                _categories(state.categories),
              ],
            );
          }
          return const SizedBox();
        }),
      ),
    ));
  }

  Widget _title() {
    return const Text(
      'Shop by Categories',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: categories.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                // width: 100,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                        image: DecorationImage(
                          image: NetworkImage(
                              ImageDisplayHelper.generateCategoryImageUrl(
                                  categories[index].image)),
                          fit: BoxFit.fill,
                        ),
                      ),
                      // child: Text('Category $index'),
                    ),
                    const SizedBox(width: 5),
                    Text(categories[index].title),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
