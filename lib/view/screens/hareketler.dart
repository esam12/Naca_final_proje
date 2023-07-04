import 'package:final_proje/core/constant/constant.dart';
import 'package:final_proje/view/screens/update_record_for_hareketler.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HareketlerScreen extends StatefulWidget {
  const HareketlerScreen({super.key});

  @override
  State<HareketlerScreen> createState() => _HareketlerScreenState();
}

class _HareketlerScreenState extends State<HareketlerScreen> {
  Query dbRef = FirebaseDatabase.instance.ref().child('yeniHareket');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('yeniHareket');
  Widget listItem({required Map hareket}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hareket['musteri_adi'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            hareket['hareket_turu'],
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            hareket['urun_adi'],
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            hareket['hareket_miktari'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(hareket['key']).remove();
                },
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UpdateRecordForHareketler(
                                student: hareket /*['key']*/),
                          ),
                        );
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
                    SizedBox(
                      width: 8,
                    ),
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
        centerTitle: true,
        title: const Text(
          'HAREKETLER',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 250,
                  child: FirebaseAnimatedList(
                    query: dbRef,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      var hareket = snapshot.value as Map;
                      hareket['key'] = snapshot.key;
                      return listItem(hareket: hareket);
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
