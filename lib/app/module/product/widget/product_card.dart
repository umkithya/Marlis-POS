import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/values/app_colors.dart';

class CustomProductCard extends StatelessWidget {
  final String? imagePath, nameProduct;
  final ProductStockType? type;
  final int? buy, sell;
  const CustomProductCard(
      {super.key,
      this.imagePath,
      this.nameProduct,
      this.type,
      this.buy,
      this.sell});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  width: 55,
                  height: 55,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColors.colorlightGrey,
                      borderRadius: BorderRadius.circular(25)),
                  child: Image.asset(imagePath ?? '')),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        nameProduct ?? '',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headlineLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9, vertical: 6),
                          decoration: BoxDecoration(
                              color: type == ProductStockType.low
                                  ? AppColors.colorLightOrange
                                  : type == ProductStockType.outofstock
                                      ? AppColors.colorLightRed
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            type == ProductStockType.low
                                ? "Low Stock"
                                : type == ProductStockType.outofstock
                                    ? "Out of Stock"
                                    : "",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.colorRed),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 129,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.images.productSvg.upicon,
                              height: 9,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(buy.toString())
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.images.productSvg.downicon,
                              height: 9,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(buy.toString())
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.colorUnselect,
          )
        ],
      ),
    );
  }
}

enum ProductStockType { low, outofstock }
