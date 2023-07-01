import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:malispos/app/core/utils/helper/app_helper.dart';
import 'package:malispos/app/core/values/app_colors.dart';
import 'package:malispos/app/module/sales/widget/custom_bottomsheet_discount.dart';
import 'package:malispos/gen/assets.gen.dart';

import '../controller/sale_controller.dart';

class ConfirmPaymentCard extends StatelessWidget {
  const ConfirmPaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SaleController(),
        builder: (_) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.7,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total discount",
                        style: context.titleMedium!
                            .copyWith(color: AppColors.colorRed),
                      ),
                      GestureDetector(
                        onTap: () {
                          customBottomSheetDiscount(context);
                        },
                        child: SvgPicture.asset(
                          Assets.images.saleImage.iconplus,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  10.sh,
                  const Divider(
                    height: 0.1,
                    color: Colors.grey,
                  ),
                  10.sh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: context.labelMedium!,
                      ),
                      Text(
                        "20.90\$",
                        style: context.labelMedium!,
                      ),
                    ],
                  ),
                  20.sh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax(0%)",
                        style: context.labelMedium!
                            .copyWith(color: context.primaryColor),
                      ),
                      SvgPicture.asset(Assets.images.saleImage.iconplus,
                          color: context.primaryColor),
                    ],
                  ),
                  20.sh,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: context.labelMedium!,
                      ),
                      Text(
                        "20.90\$",
                        style: context.labelMedium!,
                      ),
                    ],
                  ),
                  20.sh,
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ButtonPayment(
                          image: Assets.images.saleImage.cash,
                          name: "Pay with ABA",
                          ontap: () {
                            SaleController.instance.selectPayment.value =
                                "Pay with ABA";
                            SaleController.instance.update();
                          },
                          isSelect: "Pay with ABA" ==
                              SaleController.instance.selectPayment.value,
                        ),
                      ),
                      10.sW,
                      Expanded(
                        flex: 2,
                        child: ButtonPayment(
                          image: Assets.images.saleImage.cash,
                          name: "Cash",
                          ontap: () {
                            SaleController.instance.selectPayment.value =
                                "Cash";
                            SaleController.instance.update();
                          },
                          isSelect: "Cash" ==
                              SaleController.instance.selectPayment.value,
                        ),
                      ),
                      10.sW,
                      Expanded(
                        child: ButtonPayment(
                          image: Assets.images.saleImage.iconplus,
                          name: "Other",
                          ontap: () {
                            SaleController.instance.selectPayment.value =
                                "Other";
                            SaleController.instance.update();
                            debugPrint(
                                " SaleController.instance.selectPayment.value  ${SaleController.instance.selectPayment.value} ");
                          },
                          isSelect: "Other" ==
                              SaleController.instance.selectPayment.value,
                        ),
                      ),
                    ],
                  ),
                  15.sh,
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: context.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 25)),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Comfirm Payment",
                            style: context.bodyLarge,
                          ),
                          Text(
                            "\$20.00",
                            style: context.bodyLarge,
                          ),
                        ],
                      ))
                ],
              ),
            ));
  }
}

class ButtonPayment extends StatelessWidget {
  const ButtonPayment(
      {super.key, this.image, this.name, this.isSelect, this.ontap});
  final String? image, name;
  final Function? ontap;
  final bool? isSelect;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap!();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: !isSelect!
                    ? AppColors.colorDevider
                    : AppColors.colorGreen)),
        child: Column(
          children: [
            SvgPicture.asset(
              image ?? "",
              height: 25,
              color: Colors.black,
            ),
            5.sh,
            Text(
              name ?? "",
              style: context.labelMedium,
            )
          ],
        ),
      ),
    );
  }
}
