import 'package:final_proje/core/constant/routes.dart';
import 'package:final_proje/main.dart';
import 'package:final_proje/view/screens/depo_hareket_ekle.dart';
import 'package:final_proje/view/screens/hareketler.dart';
import 'package:final_proje/view/screens/home_screen.dart';
import 'package:final_proje/view/screens/login_screen.dart';
import 'package:final_proje/view/screens/new_costumer.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const SplashScreen()),
  GetPage(name: AppRoute.login, page: () => const LoginScreen()),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.newCustomer, page: () => const NewCostumer()),
  GetPage(name: AppRoute.yenihareket, page: () => const HareketlerScreen()),
  GetPage(name: AppRoute.depoyenihareket, page: () => const DepoHareketEkle()),
];
