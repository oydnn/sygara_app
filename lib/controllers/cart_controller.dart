import 'dart:convert';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/themes/themes.dart';

class CartController extends GetxController {
  int? idUser = SpUtil.getInt('idUser');

  // membuat fungsi input keranjang
  Future postCart(String productId, String jumlah) async {
    // siapkan variabel untuk menampung url API
    var urlPostCart = Uri.parse(Config().urlCartPost);

    try {
      // kirimkan data ke API (seperti di postman)
      final response = await http.post(
        urlPostCart,
        body: {
          'product_id': productId,
          'user_id':
              SpUtil.getInt('idUser')
                  .toString(), // karena json dikirimkan mintanya bertipe String, maka variabel idUSer yang tadinya bertipe int, kita konvert toString()
          'jumlah': jumlah,
        },
      );

      // biar isi dari output response json (seperti di postman) bisa diambel, maka harus didecode
      // ambil response body nya
      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          responseDecode['message'],
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primaryColor,
          colorText: whiteColor,
        );
      } else{
        Get.snackbar(
          'Failed',
          responseDecode['message'],
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: redColor,
          colorText: whiteColor
        );
      }
    } catch (e) {
      Get.snackbar(
          'Failed',
          e.toString(),
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: redColor,
          colorText: whiteColor
          );
    }
  }
}
