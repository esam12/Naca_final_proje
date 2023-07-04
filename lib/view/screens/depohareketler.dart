import 'package:final_proje/core/constant/constant.dart';
import 'package:final_proje/view/widgets/home/customeappbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepoHareketler extends StatefulWidget {
  const DepoHareketler({super.key});

  @override
  State<DepoHareketler> createState() => _DepoHareketlerState();
}

class _DepoHareketlerState extends State<DepoHareketler> {
  Query dbRef = FirebaseDatabase.instance.ref().child('newCustomer');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('newCustomer');
  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 155,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Musteri Adi : ${student['name']}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Musteri Tipi : ${student['customer_type']}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Phone No : ${student['phone']}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateRecord(studentKey: student['key'])));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(student['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(DepoHareketlerControllerImp());
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomAppBar(
                titleappbar: 'Search',
                onPressedFavorite: () {},
                onChanged: (val) {},
                mycontroller: TextEditingController()),
            Expanded(
              child: Container(
                height: double.infinity,
                child: FirebaseAnimatedList(
                  query: dbRef,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    var student = snapshot.value as Map;
                    student['key'] = snapshot.key;

                    return listItem(student: student);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
