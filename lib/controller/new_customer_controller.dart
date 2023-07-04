import 'package:final_proje/core/constant/routes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCustomerController extends GetxController {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();
  //   MyServices myServices = Get.find();

  late TextEditingController newCustomer;
  late TextEditingController customerType;
  late TextEditingController phonNo;
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPass = true;
  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  saveData() async {
    var formdata = fromstate.currentState;
    final databaseRef = FirebaseDatabase.instance.ref();
    final snapshot = await databaseRef.child('newCustomer').push().set({
      "name": newCustomer.text,
      "customer_type": customerType.text,
      "phone": phonNo.text,
      "email": email.text,
      "password": password.text,
    });
    Get.offNamed(AppRoute.home);

    if (formdata!.validate()) {}
  }
  updateData(String key) async {
    var formdata = fromstate.currentState;
    final databaseRef = FirebaseDatabase.instance.ref();
    final snapshot = await databaseRef.child('newCustomer/$key').update({
      "name": newCustomer.text,
      "customer_type": customerType.text,
      "phone": phonNo.text,
      "email": email.text,
      "password": password.text,
    });
    Get.offNamed(AppRoute.home);

    if (formdata!.validate()) {}
  }


  @override
  void onInit() {
    newCustomer = TextEditingController();
    customerType = TextEditingController();
    phonNo = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    newCustomer.dispose();
    customerType.dispose();
    phonNo.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
