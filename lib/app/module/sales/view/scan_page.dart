import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/core/utils/helper/app_helper.dart';
import 'package:malispos/app/module/product/controller/product_controller.dart';
import 'package:malispos/app/module/sales/controller/sale_controller.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/values/app_colors.dart';
import '../widget/custom_button_make_payment.dart';
import '../widget/custom_card_sale.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              header(context, 2),
              scanBlock(),
              Expanded(child: cardBlock()),
              CustomButtonMakePayment(
                ontap: () {
                  final location = GoRouter.of(context).location;
                  context.push("$location/makepayment", extra: {
                    'prductlist': Get.put(SaleController()).listSellProduct
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding cardBlock() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: ProductController.instance.productListTest.length,
            separatorBuilder: (context, index) => 10.sh,
            itemBuilder: (context, index) => CustomCardSale(
                  imagePath: ProductController
                      .instance.productListTest[index].imageProduct,
                  nameProduct: ProductController
                      .instance.productListTest[index].nameProduct,
                  type: ProductController.instance.productListTest[index].type,
                  price: ProductController.instance.productListTest[index].price
                      .toString(),
                )),
      );

  Container scanBlock() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
      );

  Padding header(BuildContext context, int? cartcount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
              // advancedDrawerController.showDrawer();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox.shrink(),
          Text(
            "Scanner",
            style: context.labelLarge!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Row(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.colorRed),
                child: Text(
                  cartcount.toString(),
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SvgPicture.asset(
                Assets.images.saleImage.cart,
                height: 25,
              )
            ]),
          )
        ],
      ),
    );
  }
}
