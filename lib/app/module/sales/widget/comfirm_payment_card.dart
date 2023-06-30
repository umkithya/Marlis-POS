import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malispos/app/core/utils/helper/app_helper.dart';
import 'package:malispos/app/core/values/app_colors.dart';
import 'package:malispos/gen/assets.gen.dart';

class ConfirmPaymentCard extends StatelessWidget {
  const ConfirmPaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.3,
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
                style: context.titleMedium!.copyWith(color: AppColors.colorRed),
              ),
              SvgPicture.asset(
                Assets.images.saleImage.iconplus,
                color: Colors.red,
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
                style:
                    context.labelMedium!.copyWith(color: context.primaryColor),
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
                ),
              ),
              10.sW,
              Expanded(
                flex: 2,
                child: ButtonPayment(
                  image: Assets.images.saleImage.cash,
                  name: "Cash",
                ),
              ),
              10.sW,
              Expanded(
                child: ButtonPayment(
                  image: Assets.images.saleImage.iconplus,
                  name: "Other",
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25)),
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
    );
  }
}

class ButtonPayment extends StatelessWidget {
  const ButtonPayment({super.key, this.image, this.name});
  final String? image, name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green)),
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
    );
  }
}
