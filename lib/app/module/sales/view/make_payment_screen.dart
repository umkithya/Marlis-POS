import 'package:flutter/material.dart';
import 'package:malispos/app/core/utils/helper/app_helper.dart';

class MakePaymentScreen extends StatelessWidget {
  const MakePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.primaryColor,
        title: const Text("Make Payment"),
      ),
      body: const Text("helo"),
    );
  }
}
