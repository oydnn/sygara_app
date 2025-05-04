import 'package:flutter/material.dart';
import 'package:sygara_app/themes/themes.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Image.asset('assets/img-banner.png'),
          Positioned(
            top: 22,
            left: 17,
            child: Column(
              children: [
                Text(
                  'Produk Segar \nuntuk Keluarga!',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 133,
                  height: 30,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Belanja Sekarang!',
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
