import 'package:flutter/material.dart';

class CustomButtonMakePayment extends StatelessWidget {
  final Function? ontap;
  const CustomButtonMakePayment({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            ontap!();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Make Payment",
                  style: Theme.of(context).primaryTextTheme.bodyLarge!),
              Text("\$20.90",
                  style: Theme.of(context).primaryTextTheme.bodyLarge!)
            ],
          )),
    );
  }
}
