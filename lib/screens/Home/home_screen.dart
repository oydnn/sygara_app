import 'package:flutter/material.dart';
import 'package:sygara_app/screens/Home/widgets/categories.dart';
import 'package:sygara_app/screens/Home/widgets/image_banner.dart';
import 'package:sygara_app/screens/Home/widgets/search_bar.dart';
import 'package:sygara_app/themes/themes.dart';
import 'package:sygara_app/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 42),
          MySearchBar(),
          SizedBox(height: 21),
          Categories(),
          SizedBox(height: 17),
          ImageBanner(),
          SizedBox(height: 21),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text('Rekomendasi untuk Anda', style: titleTextStyle),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 17),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductWidget(
                    imgUrl: 'assets/img-pisang.png',
                    nama: 'Pisang Cavendish',
                    harga: 'Rp. 15.000/kg',
                  ),
                  SizedBox(width: 20),
                  ProductWidget(
                    imgUrl: 'assets/img-bayam.png',
                    nama: 'Bayam',
                    harga: 'Rp. 15.000/kg',
                  ),
                  SizedBox(width: 20),
                  ProductWidget(
                    imgUrl: 'assets/img-tomat.png',
                    nama: 'Tomat',
                    harga: 'Rp. 15.000/kg',
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Buah Segar 🍎', style: titleTextStyle),
                Text(
                  'Lihat Lainnya',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 17),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductWidget(
                    imgUrl: 'assets/img-apel.png',
                    nama: 'Apel Fuji',
                    harga: 'Rp. 25.000/kg',
                  ),
                  SizedBox(width: 20),
                  ProductWidget(
                    imgUrl: 'assets/img-semangka.png',
                    nama: 'Semangka',
                    harga: 'Rp. 15.000/kg',
                  ),
                  SizedBox(width: 20),
                  ProductWidget(
                    imgUrl: 'assets/img-jeruk.png',
                    nama: 'Jeruk Sunkist',
                    harga: 'Rp. 10.000/kg',
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sayuran Segar 🥕', style: titleTextStyle),
                Text(
                  'Lihat Lainnya',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 17),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductWidget(
                    imgUrl: 'assets/img-wortel.png',
                    nama: 'Wortel',
                    harga: 'Rp. 15.000/kg',
                  ),
                  SizedBox(width: 20),
                  ProductWidget(
                    imgUrl: 'assets/img-brokoli.png',
                    nama: 'Brokoli',
                    harga: 'Rp. 25.000/kg',
                  ),
                  SizedBox(width: 20),
                  ProductWidget(
                    imgUrl: 'assets/img-bayam.png',
                    nama: 'Bayam',
                    harga: 'Rp. 15.000/kg',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
