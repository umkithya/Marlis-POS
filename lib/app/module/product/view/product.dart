import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:malispos/app/core/values/app_colors.dart';
import 'package:malispos/app/module/product/model/product_model.dart';
import 'package:malispos/gen/assets.gen.dart';

import '../../../core/utils/helper/format.dart';
import '../widget/product_card.dart';
import '../controller/product_controller.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductController.instance.obx(
        (state) => SafeArea(
              child: Scaffold(
                  body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    const Header(),
                    ProductAndStock(
                      numberofStock: state!.stockInhand,
                      percentOfStock: 20,
                      numberOfProduct: state.totalProduct,
                      percentOfProduct: 30,
                    ),
                    productListBlock(context, state)
                  ],
                ),
              )),
            ),
        onEmpty: const Text("data is empty"),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (e) => const Text("data is error"));
  }

  Expanded productListBlock(BuildContext context, ProductsModel state) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product List',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset(Assets.images.saleSvg.filter)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.listProduct!.length,
                itemBuilder: (context, index) => CustomProductCard(
                      imagePath: state.listProduct![index].imageProduct,
                      nameProduct: state.listProduct![index].nameProduct,
                      type: state.listProduct![index].type,
                      buy: state.listProduct![index].buy ?? 0,
                      sell: state.listProduct![index].sell ?? 0,
                    )),
          )
        ],
      ),
    );
  }
}

class ProductAndStock extends StatelessWidget {
  final int? numberOfProduct, percentOfProduct, numberofStock, percentOfStock;

  const ProductAndStock(
      {super.key,
      this.numberOfProduct,
      this.numberofStock,
      this.percentOfProduct,
      this.percentOfStock});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customCardManageProduct(context, 'Total Product',
              numberOfProduct ?? 0, percentOfProduct ?? 0, 'product'),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: customCardManageProduct(context, 'Stock in Hand',
                numberofStock ?? 0, percentOfStock ?? 0, 'stock'),
          ),
        ],
      ),
    );
  }

  Column customCardManageProduct(BuildContext context, String title,
      int? number, int? percent, String type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .primaryTextTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          FormatConvert.formatCurrencyInt(number!),
          style: Theme.of(context)
              .primaryTextTheme
              .headlineLarge!
              .copyWith(fontSize: 28),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: type == 'stock'
                  ? AppColors.appBlue.withOpacity(0.2)
                  : AppColors.colorGreen.withOpacity(0.2)),
          child: Row(children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: type == 'stock'
                      ? AppColors.appBlue
                      : AppColors.colorGreen,
                  borderRadius: BorderRadius.circular(8)),
              child: SvgPicture.asset(Assets.images.saleSvg.uparrow,
                  color: AppColors.pageBackground),
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              "+$percent%",
              style: Theme.of(context).primaryTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: type == 'stock'
                        ? AppColors.appBlue
                        : AppColors.colorGreen,
                  ),
            )
          ]),
        )
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Products",
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Row(
          children: [
            SvgPicture.asset(Assets.images.saleSvg.scan),
            const SizedBox(
              width: 25,
            ),
            SvgPicture.asset(Assets.images.saleSvg.search)
          ],
        ),
      ],
    );
  }
}
