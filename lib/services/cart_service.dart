import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/models/Cart_model.dart';

class CartService {

  // buat variabel untuk menampung data userId yang login
  int? userId = SpUtil.getInt('idUser');

  // buat fungsi menampilkan data keranjang 
  Future<List<CartModel>> listCart() async {

    // siapkan variabel untuk menyimpan list keranjang
    List<CartModel> listKeranjang = [];

    try {
      var response = await http.get(Uri.parse(Config().urlCartList + userId.toString()));

      if(response.statusCode == 200){
        var responseBody = json.decode(response.body);

        // buat variabel untuk menampung data dari response body yang ingin diambel isinya
        List listCartResponse = responseBody['data'];

        listCartResponse.forEach((data) {
          // isikan variabel listKeranjangnya yang tadinya kosong dengan data hasil pengambilan output json List listCartResponse = responseBody['data']; yang sudah dilooping dengan fungsi listCartResponse.forEach
          listKeranjang.add(CartModel.fromJson(data));
        });
      } else {
        listKeranjang = [];
      }
    } catch (e) {
      print(e);
    }

    return listKeranjang;

  }

}