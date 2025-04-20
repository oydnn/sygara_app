import 'package:flutter/material.dart';
import 'package:sygara_app/themes/themes.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 45,
          width: 294,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: mediumGrayColor),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'cari apa? (cth. bayam, apel, etc.)',
                hintStyle: TextStyle(
                  color: mediumGrayColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 26),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icon/ic-notif.png', width: 45, height: 45),
        ),
      ],
    );
  }
}
