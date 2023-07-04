import 'package:final_proje/controller/depocontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/new_costumer/textfiled.dart';

class DepoUpdateData extends StatefulWidget {
  final Map<dynamic, dynamic> student;
  const DepoUpdateData({Key? key, required this.student}) : super(key: key);

  @override
  State<DepoUpdateData> createState() => _DepoUpdateDataState();
}

class _DepoUpdateDataState extends State<DepoUpdateData> {
  DepoHareketEkleController controller = Get.put(DepoHareketEkleController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.urun_adi.text = widget.student["urun_adi"];
    controller.urun_miktari.text = widget.student["urun_miktari"];
    controller.kac_kilo.text = widget.student["kac_kilo"];
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Depo Hareketi Düzenle',
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
                  hinttext: 'Urun Adi',
                  labeltext: 'Urun Adi',
                  mycontroller: controller.urun_adi,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.person_search_sharp,
                  hinttext: 'Urun Miktari',
                  labeltext: 'Urun Miktari',
                  mycontroller: controller.urun_miktari,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.phone,
                  hinttext: 'Kac Kilo',
                  labeltext: 'Kac Kilo',
                  mycontroller: controller.kac_kilo,
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
                      child: Text("Depo Hareketi Düzenle"),
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
