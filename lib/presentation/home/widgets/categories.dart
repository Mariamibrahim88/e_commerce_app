import 'package:e_commerce_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:e_commerce_app/common/bloc/categories/categories_display_state.dart';
import 'package:e_commerce_app/common/helper/images/image_display.dart';
import 'package:e_commerce_app/domain/category/entity/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesDisplayLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoriesDisplayLoaded) {
            return Column(
              children: [
                _seeAll(),
                const SizedBox(
                  height: 20,
                ),
                _categories(state.categories),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
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
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Text('Category $index'),
              ),
              const SizedBox(height: 5),
              Text(categories[index].title),
            ],
          );
        },
      ),
    );
  }

  Widget _seeAll() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Categories',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          'See All',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
