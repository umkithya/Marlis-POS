import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/core/utils/helper/app_helper.dart';
import 'package:malispos/app/module/sales/controller/sale_controller.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/values/app_colors.dart';
import '../model/sale_model.dart';
import '../widget/custom_aleart_dailog.dart';
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
            child: GetBuilder(
          init: SaleController(),
          builder: (_) => Column(
            children: [
              header(context, 2),
              scanBlock(),
              Expanded(
                  child: cardBlock(SaleController.instance.listSellProduct)),
              CustomButtonMakePayment(
                isdisableButton:
                    SaleController.instance.listSellProduct.isEmpty,
                ontap: () {
                  print(
                      "lengt ${SaleController.instance.listSellProduct.length}");
                  final location = GoRouter.of(context).location;
                  context.push("$location/makepayment", extra: {
                    'prductlist': Get.put(SaleController()).listSellProduct
                  });
                },
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget cardBlock(List<CartModel> cardlist) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: cardlist.length,
            separatorBuilder: (context, index) => 10.sh,
            itemBuilder: (context, index) => CustomCardSale(
                  ontapDecrea: () {
                    debugPrint("qty decrea ${cardlist[index].qty}");
                    cardlist[index].qty = cardlist[index].qty! - 1;
                    if (cardlist[index].qty == 0) {
                      cardlist.remove(cardlist[index]);
                    }
                    SaleController.instance.update();
                  },
                  ontapDelete: () {
                    customShowAboutDialog(
                        context,
                        "Are you sure you want to remove this ${cardlist[index].productList!.nameProduct}",
                        "", () {
                      //yes button
                      cardlist.remove(cardlist[index]);
                      SaleController.instance.update();

                      Navigator.pop(context);
                    }, () {
                      //No button
                      Navigator.pop(context);
                    });
                  },
                  ontapIncrea: () {
                    cardlist[index].qty = cardlist[index].qty! + 1;
                    SaleController.instance.update();
                  },
                  num: cardlist[index].qty,
                  imagePath: cardlist[index].productList!.imageProduct,
                  nameProduct: cardlist[index].productList!.nameProduct,
                  type: cardlist[index].productList!.type,
                  price: cardlist[index].productList!.price.toString(),
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
