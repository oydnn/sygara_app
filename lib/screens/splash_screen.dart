import 'package:flutter/material.dart';
import 'package:sygara_app/themes/themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset('assets/logo-putih.png'),
            ),
          ),
          
          Padding(padding: EdgeInsets.only(bottom:40),
          child: Text(
            'Copyright © Reserved  2025', 
            style: whiteTextStyle.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}