import 'package:flutter/material.dart';
import 'package:sygara_app/screens/Cart/cart_page.dart';
import 'package:sygara_app/screens/Home/category_buah.dart';
import 'package:sygara_app/screens/Home/category_sayur.dart';
import 'package:sygara_app/screens/Home/detail_page.dart';
import 'package:sygara_app/screens/Home/home_screen.dart';
import 'package:sygara_app/screens/Home/notifikasi_page.dart';
import 'package:sygara_app/screens/Home/succes_page.dart';
import 'package:sygara_app/screens/Home/widgets/search_bar.dart';
import 'package:sygara_app/screens/Order/empty_order_page.dart';
import 'package:sygara_app/screens/Order/order_page.dart';
import 'package:sygara_app/screens/Profil/edit_profil_page.dart';
import 'package:sygara_app/screens/Profil/profil_page.dart';
import 'package:sygara_app/screens/Profil/reset_password_page.dart';
import 'package:sygara_app/screens/bottom_nav_bar.dart';
import 'package:sygara_app/screens/checkout_page.dart';
import 'package:sygara_app/screens/login_page.dart';
import 'package:sygara_app/screens/register_page.dart';
import 'package:sygara_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}
