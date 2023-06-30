import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/core/utils/helper/app_helper.dart';

import '../model/sale_model.dart';
import '../widget/add_customer_block.dart';
import '../widget/comfirm_payment_card.dart';

class MakePaymentScreen extends StatelessWidget {
  const MakePaymentScreen({super.key, this.listProduct});
  final List<CartModel>? listProduct;
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AddCustomerBlock(
            ontapPrint: () {},
            id: '#INV001',
            ontapAddCustomer: () {},
            ontapmore: () {},
            listProduct: listProduct,
          ),
          const ConfirmPaymentCard()
        ],
      ),
    );
  }
}
