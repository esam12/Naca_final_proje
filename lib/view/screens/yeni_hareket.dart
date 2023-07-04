import 'package:final_proje/controller/yenihareket.dart';
import 'package:final_proje/view/widgets/yeni_hareket/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YeniHareket extends StatelessWidget {
  const YeniHareket({super.key});

  @override
  Widget build(BuildContext context) {
    YeniHareketController controller = Get.put(YeniHareketController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yeni Hareket',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              children: [
                CustomTextFieldYeniHareket(
                  hinttext: 'hareket turu',
                  labeltext: 'Hareket Turu',
                  mycontroller: controller.hareket_turu,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldYeniHareket(
                  hinttext: 'musteri adi',
                  labeltext: 'Musteri Adi',
                  mycontroller: controller.musteri_adi,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldYeniHareket(
                  hinttext: 'urun adi',
                  labeltext: 'Urun Adi',
                  mycontroller: controller.urun_adi,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldYeniHareket(
                  hinttext: 'urun miktari',
                  labeltext: 'Urun Miktari',
                  mycontroller: controller.urun_miktari,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldYeniHareket(
                  hinttext: 'urun fiyati',
                  labeltext: 'Urun Fiyati',
                  mycontroller: controller.urun_fiyati,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldYeniHareket(
                  hinttext: 'hareket aciklamasi',
                  labeltext: 'Hareket Aciklamasi',
                  mycontroller: controller.hareket_aciklamasi,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldYeniHareket(
                  hinttext: 'hareket tarihi',
                  labeltext: 'Hareket Tarihi',
                  mycontroller: controller.hareket_tarihi,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldYeniHareket(
                  hinttext: 'hareket miktari',
                  labeltext: 'Hareket Miktari',
                  mycontroller: controller.hareket_miktari,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0, top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.saveData();
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.blue),
                          ),
                          child: const Center(
                            child: Text("Hareket Ekle"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: const Center(
                          child: Text("Ihracat Hareketi"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
