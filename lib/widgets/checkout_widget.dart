import 'package:flutter/material.dart';
import 'package:sygara_app/themes/themes.dart';

class CheckoutWidget extends StatelessWidget {
  final String imageUrl;
  final String nama;
  final String harga;

  const CheckoutWidget({
    super.key,
    required this.imageUrl,
    required this.nama,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 20,
        right: 17
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 87,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: mediumGrayColor, width: 0.6),
            ),
            child: Image.asset(imageUrl),
          ),
          SizedBox(width: 19,),
          Text(nama,
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
          ),
          Spacer(),
          Text(harga, style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
          ),
          
        ],
      ),
    );
  }
}
