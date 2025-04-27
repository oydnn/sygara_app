import 'package:flutter/material.dart';
import 'package:sygara_app/screens/Home/home_screen.dart';
import 'package:sygara_app/themes/themes.dart';

class SuccesPage extends StatelessWidget {
  const SuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/img-sukses.png',
              width: 177,
              height: 177,
            ),
          ),
          SizedBox(height: 33),
          Text(
            'Hore! Pesanan Telah \nTerkonfirmasi & Segera Diantar!',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 22),
          Container(
            width: 372,
            height: 120,
            decoration: BoxDecoration(
              color: mintGreenColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(height: 18),
                Text(
                  '*Informasi Pembayaran',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'Siapkan Uang pas sesuai dengan harga total \nproduk yang telah dibeli',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 22),
          SizedBox(
            width: 372,
            height: 45,
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Cek Pesanan',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
