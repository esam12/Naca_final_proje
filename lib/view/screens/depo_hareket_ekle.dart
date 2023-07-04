import 'package:final_proje/controller/depocontroller.dart';
import 'package:final_proje/view/widgets/yeni_hareket/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepoHareketEkle extends GetView<DepoHareketEkle> {
  const DepoHareketEkle({super.key});

  @override
  Widget build(BuildContext context) {
    DepoHareketEkleController controller = Get.put(DepoHareketEkleController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Depoya Yeni Hareket Ekle',
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
                  hinttext: 'Urun Adi',
                  labeltext: 'Urun Adi',
                  mycontroller: controller.urun_adi,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldYeniHareket(
                  hinttext: 'Urun Miktari',
                  labeltext: 'Urun Miktari',
                  mycontroller: controller.urun_miktari,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldYeniHareket(
                  hinttext: 'Kac Kilo',
                  labeltext: 'Kac Kilo',
                  mycontroller: controller.kac_kilo,
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
                            child: Text("Depo Hareket Ekle"),
                          ),
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
