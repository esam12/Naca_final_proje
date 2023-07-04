import 'package:final_proje/core/constant/routes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepoHareketEkleController extends GetxController {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  late TextEditingController urun_adi;
  late TextEditingController urun_miktari;
  late TextEditingController kac_kilo;

  saveData() async {
    var formdata = fromstate.currentState;
    final databaseRef = FirebaseDatabase.instance.ref();
    final snapshot = await databaseRef.child('yeniDepoHareket').push().set({
      "urun_adi": urun_adi.text,
      "urun_miktari": urun_miktari.text,
      "kac_kilo": kac_kilo.text,
    });
    Get.offNamed(AppRoute.home);

    //if (formdata!.validate()) {}
  }
  updateData(String key) async {
    var formdata = fromstate.currentState;
    final databaseRef = FirebaseDatabase.instance.ref();
    final snapshot = await databaseRef.child('yeniDepoHareket/$key').update({
      "urun_adi": urun_adi.text,
      "urun_miktari": urun_miktari.text,
      "kac_kilo": kac_kilo.text,
    });
    Get.offNamed(AppRoute.home);

    if (formdata!.validate()) {}
  }

  @override
  void onInit() {
    urun_adi = TextEditingController();
    urun_miktari = TextEditingController();
    kac_kilo = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    urun_adi.dispose();
    urun_miktari.dispose();
    kac_kilo.dispose();
    super.onClose();
  }
}
