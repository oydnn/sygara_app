import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sygara_app/screens/Home/notifikasi_page.dart';
import 'package:sygara_app/screens/search_page.dart';
import 'package:sygara_app/themes/themes.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {

    // siapkan variabel untuk menampung data inputan di form pencarian
    TextEditingController keyword = TextEditingController();

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
              controller: keyword,
              onSubmitted: (value) {
                if(value.isNotEmpty){
                  Get.to(SearchPage(keywordYgditerima: value,));
                }
              },
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotifikasiPage()),
            );
          },
          icon: Image.asset('assets/icon/ic-notif.png', width: 45, height: 45),
        ),
      ],
    );
  }
}
