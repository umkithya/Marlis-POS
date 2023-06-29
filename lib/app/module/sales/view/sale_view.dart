import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:malispos/app/core/utils/helper/app_helper.dart';
import 'package:malispos/app/module/product/widget/product_card.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../core/values/app_colors.dart';
import '../../bottom_navigation_bar/view/bottom_navigation_bar.dart';
import '../../product/model/product_model.dart';
import '../controller/sale_controller.dart';
import '../model/sale_model.dart';

class SaleView extends GetView<SaleController> {
  const SaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: controller.obx(
          (state) => SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(context, 9),
                    searchBlock(context),
                    categoryBlock(state!.listCategory ?? []),
                    productListBlock(state.listProduct ?? [])
                  ]),
            ),
          ),
          onEmpty: const Text("data is empty"),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onError: (e) => const Text("data is error"),
        ),
      ),
    );
  }

  Widget productListBlock(List<ProductListModel> list) => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            primary: true,
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                          spreadRadius: -2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(children: [
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: AppColors.colorLightWhite,
                      ),
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.asset(
                        list[index].imageProduct!,
                        fit: BoxFit.contain,
                      ),
                    )),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(list[index].nameProduct!,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .labelMedium!),
                            const SizedBox(
                              height: 4,
                            ),
                            Text("120ml",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .labelSmall!),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        list[index].type ==
                                                ProductStockType.outofstock
                                            ? Assets
                                                .images.saleImage.unavailable
                                            : Assets.images.saleImage.available,
                                        height: 15,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      list[index].type ==
                                              ProductStockType.outofstock
                                          ? Text("Unavailable",
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .labelSmall!
                                                  .copyWith(
                                                      color: AppColors
                                                          .statusOrange))
                                          : Text("Available",
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .labelSmall!
                                                  .copyWith(
                                                      color:
                                                          AppColors.colorGreen))
                                    ],
                                  ),
                                  Text("\$${list[index].price}",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .labelLarge!)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                )),
      );

  Widget categoryBlock(List<Category> list) {
    return SizedBox(
      height: 45,
      // width: 59,
      child: ListView.builder(
          // cacheExtent: 20,
          padding: const EdgeInsets.only(left: 20, right: 17),
          shrinkWrap: true,
          itemCount: list.length + 1,
          scrollDirection: Axis.horizontal,
          // itemExtent: 50,
          itemBuilder: ((context, index) {
            if (index == 0) {
              return Container(
                margin: const EdgeInsets.only(right: 7),
                width: 59,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: Center(
                  child: Text(
                    "See All",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodySmall!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              );
            }
            return Container(
              margin: const EdgeInsets.only(right: 7),
              width: 59,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Center(
                child: SvgPicture.asset(list[index - 1].imagepath!),
              ),
            );
          })),
    );
  }

  Widget searchBlock(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        children: [
          SvgPicture.asset(Assets.images.saleImage.sort),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 13, right: 5),
                  child: SvgPicture.asset(
                    Assets.images.productSvg.search,
                  ),
                ),
                prefixIconConstraints:
                    const BoxConstraints(maxHeight: 30, minHeight: 30),
                suffixIconConstraints: const BoxConstraints(
                    maxHeight: 30, minHeight: 30, maxWidth: 150),
                suffixIcon: GestureDetector(
                  onTap: () {
                    final location = GoRouter.of(context).location;
                    context.push("$location/scansale");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SvgPicture.asset(
                      Assets.images.productSvg.scan,
                    ),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget header(BuildContext context, int cartcount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // GestureDetector(
        //   onTap: () {
        //     advancedDrawerController.showDrawer();
        //   },
        //   child: SvgPicture.asset(
        //     Assets.images.saleImage.menu,
        //     height: 35,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: SvgPicture.asset(
              Assets.images.saleImage.menu,
              height: 35,
            ),
            onPressed: () {
              advancedDrawerController.showDrawer();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Row(children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.colorRed),
                    child: Padding(
                      padding: EdgeInsets.all(
                        cartcount >= 10 ? 8 : 10,
                      ),
                      child: Text(
                        cartcount.toString(),
                        style: context.bodySmall,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Icon(
                    PhosphorIcons.shopping_cart_simple_fill,
                    color: Theme.of(context).primaryColor,
                    size: 28,
                  )
                ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
