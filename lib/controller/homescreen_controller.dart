import 'package:final_proje/view/screens/settings.dart';
import 'package:final_proje/view/screens/view_depo_data.dart';
import 'package:final_proje/view/screens/yeni_hareket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screens/home_page.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const HomePage(),
    const ViewDepoData(),
    const YeniHareket(),
    const Settings()
  ];

  List bottomappbar = [
    {"title": "Home", "icon": Icons.group},
    {"title": "Depo", "icon": Icons.storage},
    {"title": "Profile", "icon": Icons.sticky_note_2_outlined},
    {"title": "Settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
