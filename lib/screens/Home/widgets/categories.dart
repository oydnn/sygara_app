import 'package:flutter/material.dart';
import 'package:sygara_app/screens/Home/category_buah.dart';
import 'package:sygara_app/screens/Home/category_sayur.dart';
import 'package:sygara_app/themes/themes.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)
            => CategoryBuah()));
          },
          child: Container(
            width: 176,
            height: 96,
            decoration: BoxDecoration(
              color: paleGreenColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('BUAH - \nBUAHAN', 
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20, fontWeight: FontWeight.w700
                ),
                ),
                Image.asset('assets/img-category-buah.png',
                width: 52,
                height: 52,
                ),
              ],
            ),
            ),
          ),
        ),
        

        //eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)
            => CategorySayur()));
          },
          child: Container(
            width: 176,
            height: 96,
            decoration: BoxDecoration(
              color: paleGreenColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SAYUR - \nMAYUR', 
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20, fontWeight: FontWeight.w700
                ),
                ),
                Image.asset('assets/img-category-sayur.png',
                width: 52,
                height: 52,
                ),
              ],
            ),
            ),
          ),
        ),
      ],
    );
  }
}