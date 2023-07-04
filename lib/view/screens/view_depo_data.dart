import 'package:final_proje/core/constant/constant.dart';
import 'package:final_proje/view/screens/depo_update_data.dart';
import 'package:final_proje/view/widgets/home/customeappbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ViewDepoData extends StatefulWidget {
  const ViewDepoData({super.key});

  @override
  State<ViewDepoData> createState() => _ViewDepoDataState();
}

class _ViewDepoDataState extends State<ViewDepoData> {
  Query dbRef = FirebaseDatabase.instance.ref().child('yeniDepoHareket');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('yeniDepoHareket');
  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 125,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Urun Adi : ${student['urun_adi']}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Urun Miktari : ${student['urun_miktari']}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Kac Kilo No : ${student['kac_kilo']}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              DepoUpdateData(student: student /*['key']*/)));
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
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Depo Hareketler'),
        centerTitle: true,
        leading: Icon(null),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
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
      ),
    );
  }
}
