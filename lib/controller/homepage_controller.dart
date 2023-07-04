
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomePageController extends SearchMixController {
  initialData();
  getData();
}

class HomePageControllerImp extends HomePageController {
 
  @override
  initialData() {
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
  
  }
  
  @override
  geToItems(List categories, int selectedCat, String categoryid) {
    throw UnimplementedError();
  }



}

class SearchMixController extends GetxController {
  TextEditingController? search;


  bool isSearch = false;


  checkSearch(val) {
    if (val == "") {
      //statusrequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
   
  }
}
