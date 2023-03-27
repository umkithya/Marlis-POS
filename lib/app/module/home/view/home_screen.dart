import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malispos/app/module/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: controller.state == DataState.onLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.itemList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    height: 100,
                    child: Center(
                      child: Text(
                        "TITLE: ${controller.itemList[index].title}",
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
