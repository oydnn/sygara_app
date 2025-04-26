import 'package:flutter/material.dart';
import 'package:sygara_app/screens/Home/detail_page.dart';
import 'package:sygara_app/themes/themes.dart';

class ProductWidget extends StatelessWidget {
  //buat bariabel untuk menampung nilai default
  final String imgUrl;
  final String nama;
  final String harga;
  const ProductWidget({
    super.key,
    required this.imgUrl,
    required this.nama,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
      },
      child: Container(
        width: 176,
        height: 209,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: secondaryColor, width: 1.6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imgUrl),
            Text(
              nama,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              harga,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
