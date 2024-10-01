import 'package:e_commerce_app/common/helper/images/image_display.dart';
import 'package:e_commerce_app/core/config/theme/app_colors.dart';
import 'package:e_commerce_app/domain/product/entity/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.products});

  final ProductEntity products;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 4,
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(
                  ImageDisplayHelper.generateProductImageUrl(products.images[0])
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
                      Text(products.title),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            products.discountedPrice == 0
                                ? "${products.price}\$"
                                : "${products.discountedPrice}\$",
                          ),
                          Text(
                            products.discountedPrice == 0
                                ? ''
                                : "${products.price}\$",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                    ],
                  ))))
    ]);
  }
}
