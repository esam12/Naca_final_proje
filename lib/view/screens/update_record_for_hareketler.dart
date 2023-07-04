import 'package:final_proje/controller/new_customer_controller.dart';
import 'package:final_proje/controller/yenihareket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/new_costumer/textfiled.dart';

class UpdateRecordForHareketler extends StatefulWidget {
  final Map<dynamic, dynamic> student;
  const UpdateRecordForHareketler({Key? key, required this.student}) : super(key: key);

  @override
  State<UpdateRecordForHareketler> createState() => _UpdateRecordForHareketlerState();
}

class _UpdateRecordForHareketlerState extends State<UpdateRecordForHareketler> {
  YeniHareketController controller = Get.put(YeniHareketController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.musteri_adi.text = widget.student["musteri_adi"];
    controller.hareket_turu.text = widget.student["hareket_turu"];
    controller.urun_adi.text = widget.student["urun_adi"];
    controller.hareket_miktari.text = widget.student["hareket_miktari"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Hareket Düzenle',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
          child: Form(
            key: controller.fromstate,
            child: Column(
              children: [
                CustomTextField(
                  icon: Icons.person_add,
                  hinttext: 'Muşteri Adi',
                  labeltext: 'Muşteri Afi',
                  mycontroller: controller.musteri_adi,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.person_search_sharp,
                  hinttext: 'Hareket Turu',
                  labeltext: 'Hareket Turu',
                  mycontroller: controller.hareket_turu,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.phone,
                  hinttext: 'Urun Adı',
                  labeltext: 'Urun Adı',
                  mycontroller: controller.urun_adi,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.email,
                  hinttext: 'Hareket Miktari',
                  labeltext: 'Hareket Miktari',
                  mycontroller: controller.hareket_miktari,
                ),
                
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    controller.updateData(widget.student["key"]);
                  },
                  child: Container(
                    width: 190,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: const Center(
                      child: Text("Muşteri Düzenle"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
