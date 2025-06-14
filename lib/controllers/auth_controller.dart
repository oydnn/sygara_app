import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/screens/Home/home_screen.dart';
import 'package:sygara_app/screens/bottom_nav_bar.dart';
import 'package:sp_util/sp_util.dart';

class AuthController extends GetxController {
// siapkan apa saja inputan pada form, baik form login/register (email, password, nama, telepon)
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController telepon = TextEditingController();

  // buat variabel untuk menampung nilai loading
  // nilai loading ini pakai tipe data boolean true/false
  RxBool loading = false.obs;

  // buat function proses login
// tipe Future => datanya tidak langsung didapatkan (memerlukan waktu untuk loading)
Future login() async {
  // url endpoint login
  var url = Uri.parse(Config().urlLogin);

  // code proses login
  try {
    loading.value = true;
    // variabel untuk request ke API
    final response = await http.post(url,body: {
      // parameter apa saja yang dikirimkan ke web service, lihat dari postman
      'email' : email.text,
      'password' : password.text
    });

    // agar isi dari response dapat dipakai, maka kita decode dulu
    var responseDecode = json.decode(response.body);


      // jika statusCode pada response != 200, maka akan tetap di halaman login dan menampilkan pesan eror

    if(response.statusCode == 200){

      // simpan data user yang login (dapat dari output json/yg bisa dilihat di postman saat testing fungsi login)
      SpUtil.putInt('idUser', responseDecode['data']['id']);
      SpUtil.putString('userName', responseDecode['data']['name']);
      SpUtil.putString('email', responseDecode['data']['email']);
      SpUtil.putString('telepon', responseDecode['data']['telepon']);
      loading.value = false;
      // redirect ke halaman utama
      Get.off(BottomNavBar());
    } else {
      loading.value = false;
      Get.snackbar('Error', responseDecode['message'], snackPosition: SnackPosition.TOP);
    }

  } catch (e) {
    loading.value = false;
    Get.snackbar('Error', e.toString());
  }

}
// function register
Future register() async {
  // siapkan 
  var url = Uri.parse(Config().urlRegister);

  // proses register
  try {
    loading.value = true;
    final response = await http.post(url,body: {
      'name' : name.text,
      'email' : email.text,
      'password' : password.text,
      'telepon' : telepon.text
    });

    var responseDecode = json.decode(response.body);

    //handle eror validation
    Map<String, dynamic> dataError = responseDecode['data'];

    // jika status code = 200, arahkan ke halaman utama
    if(response.statusCode == 200){
      loading.value = false;
      Get.offAll(BottomNavBar());
    } else {
      loading.value = false;
      Get.snackbar('Error', responseDecode ['message'] == 'Error Validation' ? dataError.toString() : responseDecode['message'], snackPosition: SnackPosition.TOP);
    }
  }
  catch (e) {
    loading.value = false;
    Get.snackbar('Error', e.toString());
  }
}

// proses logout
}