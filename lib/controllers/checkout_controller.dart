import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/screens/bottom_nav_bar.dart';

class CheckoutController extends GetxController{

  // siapkan variabel untuk menampung beberapa inputan dari form Checkout
  TextEditingController namaPembeli = TextEditingController(text: SpUtil.getString('userName'));
  TextEditingController noTelp = TextEditingController(text: SpUtil.getString('telepon'));
  TextEditingController alamatLengkap = TextEditingController();
  TextEditingController kotaKecamatan = TextEditingController();
  TextEditingController catatan = TextEditingController();

  // variabel untuk loading
  RxBool isLoading = false.obs;

  // variabel untuk menyimpan userId yang login
  int? userId = SpUtil.getInt('idUser');

  // buat fungsi untuk checkout post
  Future checkoutPost(String metodePembayaran, String metodePengiriman) async {

    var url = Uri.parse(Config().urlCheckoutPost);
    
    try {
      isLoading.value = true;
      final response = await http.post(url, body: {
        'user_id' : SpUtil.getInt('idUser').toString(),
        'nama' : namaPembeli.text,
        'nohp' : noTelp.text,
        'alamat' : alamatLengkap.text,
        'kota_kecamatan' : kotaKecamatan.text,
        'catatan' : catatan.text,
        'jenis_pembayaran' : metodePembayaran,
        'jenis_pengiriman' : metodePengiriman,

      });

      var responseDecode = json.decode(response.body);

      if(response.statusCode == 200){
        isLoading.value = false;
        Get.snackbar('Success', responseDecode['message']);
        // redirect ke halaman utama
        Get.offAll(BottomNavBar());
      } else {
        isLoading.value = false;
        Get.snackbar('Failed', responseDecode['message']);
      }

    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Failed', e.toString());
    }

  }

}