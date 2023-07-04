import 'dart:io';
import 'package:final_proje/controller/homescreen_controller.dart';
import 'package:final_proje/core/constant/constant.dart';
import 'package:final_proje/core/constant/routes.dart';
import 'package:final_proje/view/widgets/home/custombuttonappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: ((controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoute.newCustomer);
              },
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomButtonAppBarHome(),
            body: WillPopScope(
              child: controller.listPage.elementAt(controller.currentpage),
              onWillPop: () {
                Get.defaultDialog(
                  title: "Warring",
                  titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.secondColor),
                  middleText: "Do You Want To Exit The App ?",
                  onCancel: () {},
                  cancelTextColor: AppColor.secondColor,
                  confirmTextColor: AppColor.secondColor,
                  buttonColor: AppColor.fourthColor,
                  onConfirm: () {
                    exit(0);
                  },
                );
                return Future.value(false);
              },
            ),
          )),
    );
  }
}
