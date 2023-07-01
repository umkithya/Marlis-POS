import 'package:flutter/material.dart';
import 'package:malispos/app/core/utils/helper/app_helper.dart';

import '../../../core/values/app_colors.dart';
import 'custom_animation_animated_button_bar.dart';

customBottomSheetDiscount(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return GestureDetector(
          onPanDown: (d) {
            debugPrint('ontap here');
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    child: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    "Add discount",
                    style: Theme.of(context).primaryTextTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              10.sh,
              const Divider(
                height: 1.5,
                color: AppColors.colorTextGrey,
              ),
              AnimatedButtonBar(
                radius: 10,
                padding: const EdgeInsets.all(20.0),
                backgroundColor: const Color(0xffF5F7F9),
                foregroundColor: Colors.white,
                elevation: 5,
                borderColor: const Color(0xffF5F7F9),
                borderWidth: 2,
                innerVerticalPadding: 16,
                children: [
                  ButtonBarEntry(
                      onTap: () => print('First item tapped'),
                      child: Text("%",
                          style:
                              Theme.of(context).primaryTextTheme.labelMedium)),
                  ButtonBarEntry(
                      onTap: () => print('Second item tapped'),
                      child: Text("\$",
                          style:
                              Theme.of(context).primaryTextTheme.labelMedium)),
                  ButtonBarEntry(
                      onTap: () => print('Second item tapped'),
                      child: Text("Code",
                          style:
                              Theme.of(context).primaryTextTheme.labelMedium)),
                ],
              ),
              10.sh,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Amount"),
                    TextField(
                      decoration: InputDecoration(
                        hintText: '%',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        );
      },
      // isDismissible: false,
      enableDrag: false);
}
