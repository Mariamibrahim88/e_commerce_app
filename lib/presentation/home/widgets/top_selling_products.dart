import 'package:e_commerce_app/common/helper/images/image_display.dart';
import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:e_commerce_app/presentation/home/bloc/top_selling_display_cubit.dart';
import 'package:e_commerce_app/presentation/home/bloc/top_selling_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellingProducts extends StatelessWidget {
  const TopSellingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TopSellingDisplayCubit()..displayTopSellingProducts(),
      child: BlocBuilder<TopSellingDisplayCubit, TopSellingDisplayState>(
        builder: (context, state) {
          if (state is TopSellingDisplayLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopSellingDisplayLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(),
                const SizedBox(
                  height: 15,
                ),
                _products(state.products),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

Widget _title() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Top Selling',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        'See All',
        style: TextStyle(fontSize: 18),
      ),
    ],
  );
}

Widget _products(List<ProductEntity> products) {
  return SizedBox(
    height: 300,
    child: ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(width: 15),
      itemCount: products.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                        ImageDisplayHelper.generateProductImageUrl(
                            products[index].images[0])
                        // 'https://firebasestorage.googleapis.com/v0/b/e-commerce-app-cb443.appspot.com/o/categories%2Fimages%2Fhoodie.jpg?alt=media&token=f0df5a15-add0-40f5-bdc8-0a7b9c53d808'
                        ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 200,
                // height: 20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: AppColors.secondBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(products[index].title),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            products[index].discountedPrice == 0
                                ? "${products[index].price}\$"
                                : "${products[index].discountedPrice}\$",
                          ),
                          Text(
                            products[index].discountedPrice == 0
                                ? ''
                                : "${products[index].price}\$",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
