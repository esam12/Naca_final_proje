import 'package:final_proje/controller/new_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/new_costumer/textfiled.dart';

class UpdateRecord extends StatefulWidget {
  final Map<dynamic, dynamic> student;
  const UpdateRecord({Key? key, required this.student}) : super(key: key);

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  NewCustomerController controller = Get.put(NewCustomerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.newCustomer.text = widget.student["name"];
    controller.customerType.text = widget.student["customer_type"];
    controller.phonNo.text = widget.student["phone"];
    controller.email.text = widget.student["email"];
    controller.password.text = widget.student["password"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MUŞTERİ Düzenle',
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
                  hinttext: 'Muşteri',
                  labeltext: 'Muşteri',
                  mycontroller: controller.newCustomer,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.person_search_sharp,
                  hinttext: 'Muşteri Tipi',
                  labeltext: 'Muşteri tipi',
                  mycontroller: controller.customerType,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.phone,
                  hinttext: 'Telefon Numarası',
                  labeltext: 'Telefon Numarası',
                  mycontroller: controller.phonNo,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.email,
                  hinttext: 'e-post',
                  labeltext: 'E-Posta',
                  mycontroller: controller.email,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.place,
                  hinttext: 'Şehir',
                  labeltext: 'Şehir',
                  mycontroller: controller.password,
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
