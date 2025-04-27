import 'package:flutter/material.dart';
import 'package:sygara_app/themes/themes.dart';

class EmptyOrderPage extends StatelessWidget {
  const EmptyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img-empty.jpg'),
          SizedBox(height: 40,),
          Text('Belum ada pesanan...', style: greyTextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w500
          ),
          ),
          
        ],
      ),
    );
  }
}