import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malispos/gen/assets.gen.dart';

import '../../../core/utils/helper/render_size.dart';
import '../../../core/values/app_colors.dart';
import '../../product/widget/product_card.dart';

class CustomCardSale extends StatelessWidget {
  final String? imagePath, nameProduct, price;
  final int? num;
  final ProductStockType? type;
  final Function? ontapIncrea, ontapDecrea, ontapDelete;
  CustomCardSale(
      {super.key,
      this.imagePath,
      this.nameProduct,
      this.type,
      this.price,
      this.ontapDecrea,
      this.ontapDelete,
      this.ontapIncrea,
      this.num = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameProduct ?? '',
                          style:
                              Theme.of(context).primaryTextTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          '\$$price',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.images.saleImage.unavailable,
                              height: 15,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              type == ProductStockType.outofstock
                                  ? "Unavailable"
                                  : "Available",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headlineSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: type == ProductStockType.outofstock
                                          ? AppColors.statusOrange
                                          : Colors.green),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, blurRadius: 0.1),
                    ],
                    // border: Border.all(color: Colors.grey, width: 0.1),
                  ),
                  child: Row(children: [
                    GestureDetector(
                      onTap: () => ontapDecrea,
                      child: SvgPicture.asset(
                          Assets.images.saleImage.decreaseicon,
                          color: num! > 0
                              ? Theme.of(context).primaryColor
                              : AppColors.colorTextGrey),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(num.toString()),
                    ),
                    GestureDetector(
                        onTap: () => ontapIncrea,
                        child: SvgPicture.asset(
                          Assets.images.saleImage.increaseicon,
                          color: num! <= 99
                              ? Theme.of(context).primaryColor
                              : AppColors.colorTextGrey,
                        ))
                  ]),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: SvgPicture.asset(Assets.images.saleImage.deleteIcon),
        )
      ],
    );
  }
}
