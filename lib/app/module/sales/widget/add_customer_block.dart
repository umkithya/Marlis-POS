import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malispos/app/core/utils/helper/app_helper.dart';

import '../../../../gen/assets.gen.dart';
import '../model/sale_model.dart';

class AddCustomerBlock extends StatelessWidget {
  final Function? ontapPrint, ontapmore, ontapAddCustomer;
  final String? id;
  final List<CartModel>? listProduct;

  const AddCustomerBlock(
      {super.key,
      this.id,
      this.ontapmore,
      this.ontapPrint,
      this.ontapAddCustomer,
      this.listProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.1,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                ontapPrint!();
              },
              icon: SvgPicture.asset(Assets.images.saleImage.printer),
            ),
            Text(
              id!,
              style: context.titleLarge,
            ),
            IconButton(
              onPressed: () {
                ontapmore!();
              },
              icon: SvgPicture.asset(Assets.images.saleImage.more),
            ),
          ],
        ),
        20.sh,
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              shadowColor: context.primaryColor,
              foregroundColor: context.primaryColor,
              shape: const StadiumBorder(),
              side: const BorderSide(
                width: 1,
                color: Color(0xFF0070D6),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15)),
          onPressed: () {
            ontapAddCustomer!();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.saleImage.personadd),
              11.sW,
              Text(
                'Add Customer',
                style:
                    context.labelLarge!.copyWith(color: context.primaryColor),
              )
            ],
          ),
        ),
        25.sh,
        Container(
          // width: 375,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFFA5A5A5),
              ),
            ),
          ),
        ),
        20.sh,
        ...listProduct!
            .map(
              (e) => Container(
                color: Colors.white,
                child: Column(
                  children: [
                    7.sh,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e.productList!.nameProduct!,
                          style: context.labelLarge,
                        ),
                        Column(
                          children: [
                            Text(
                              "${e.productList!.price}\$",
                              style: context.labelLarge,
                            ),
                            Text(
                              "Qty: ${e.qty}",
                              style: context.titleMedium,
                            )
                          ],
                        )
                      ],
                    ),
                    15.sh,
                    const Divider(
                      height: 0.1,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            )
            .toList()
      ]),
    );
  }
}
