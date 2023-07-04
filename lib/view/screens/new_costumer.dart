import 'package:final_proje/controller/new_customer_controller.dart';
import 'package:final_proje/view/widgets/new_costumer/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewCostumer extends StatelessWidget {
  const NewCostumer({super.key});

  @override
  Widget build(BuildContext context) {
    NewCustomerController controller = Get.put(NewCustomerController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'YENİ MUŞTERİ',
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
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/images/starts.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  icon: Icons.person_add,
                  hinttext: 'Yeni Muşteri',
                  labeltext: 'Yeni Muşteri',
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
                    controller.saveData();
                  },
                  child: Container(
                    width: 190,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: const Center(
                      child: Text("Muşteri Ekle"),
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
