import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/core/utils/helper/app_helper.dart';

import '../../../../gen/assets.gen.dart';

class MakePaymentScreen extends StatelessWidget {
  const MakePaymentScreen({super.key, this.listProduct});
  final List<Category>? listProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.backgoundColor,
        title: Text(
          "Make Payment",
          style: context.labelLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: context.primaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          AddCustomerBlock(
            ontapPrint: () {},
            id: '#INV001',
            ontapAddCustomer: () {},
            ontapmore: () {},
            listProduct: const [],
          )
        ],
      ),
    );
  }
}

class AddCustomerBlock extends StatelessWidget {
  final Function? ontapPrint, ontapmore, ontapAddCustomer;
  final String? id;
  final List? listProduct;

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
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                width: 0.5,
                color: Color(0xFF0070D6),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20)),
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
        ...listProduct!.map((e) => Container()).toList()
      ]),
    );
  }
}
