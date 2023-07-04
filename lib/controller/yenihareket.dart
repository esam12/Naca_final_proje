import 'package:final_proje/core/constant/routes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YeniHareketController extends GetxController {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();
  //   MyServices myServices = Get.find();

  late TextEditingController hareket_turu;
  late TextEditingController musteri_adi;
  late TextEditingController urun_adi;
  late TextEditingController urun_miktari;
  late TextEditingController urun_fiyati;
  late TextEditingController hareket_aciklamasi;
  late TextEditingController hareket_tarihi;
  late TextEditingController hareket_miktari;
  bool isShowPass = true;
  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  saveData() async {
    var formdata = fromstate.currentState;
    final databaseRef = FirebaseDatabase.instance.ref();
    final snapshot = await databaseRef.child('yeniHareket').push().set({
      "hareket_turu": hareket_turu.text,
      "musteri_adi": musteri_adi.text,
      "urun_adi": urun_adi.text,
      "urun_miktari": urun_miktari.text,
      "urun_fiyati": urun_fiyati.text,
      "hareket_aciklamasi": hareket_aciklamasi.text,
      "hareket_tarihi": hareket_tarihi.text,
      "hareket_miktari": hareket_miktari.text,
    });
    Get.offNamed(AppRoute.home);

    //if (formdata!.validate()) {}
  }

   updateData(String key) async {
    var formdata = fromstate.currentState;
    final databaseRef = FirebaseDatabase.instance.ref();
    final snapshot = await databaseRef.child('yeniHareket/$key').update({
      "musteri_adi": musteri_adi.text,
      "hareket_turu": hareket_turu.text,
      "urun_adi": urun_adi.text,
      "hareket_miktari": hareket_miktari.text,
    });
    Get.offNamed(AppRoute.home);

    if (formdata!.validate()) {}
  }

  @override
  void onInit() {
    hareket_turu = TextEditingController();
    musteri_adi = TextEditingController();
    urun_adi = TextEditingController();
    urun_miktari = TextEditingController();
    urun_fiyati = TextEditingController();
    hareket_aciklamasi = TextEditingController();
    hareket_tarihi = TextEditingController();
    hareket_miktari = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    hareket_turu.dispose();
    musteri_adi.dispose();
    urun_adi.dispose();
    urun_miktari.dispose();
    urun_fiyati.dispose();
    hareket_aciklamasi.dispose();
    hareket_tarihi.dispose();
    hareket_miktari.dispose();
    super.dispose();
  }
}
