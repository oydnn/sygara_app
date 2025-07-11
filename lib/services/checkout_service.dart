import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/models/Checkout_model.dart';
import 'package:sygara_app/models/DetailOrderModel.dart';

class CheckoutService {

  // function menampilkan data pesanan (checkout)

  Future<List<CheckoutModel>> listCheckoutBaru(String userId) async {
    // siapkan variabel untuk menampung list datanya
    List<CheckoutModel> listCheckoutNew = [];


    
    try {
      // buat variabel untuk request ke web service (API)
      var response = await http.get(Uri.parse(Config().urlListCheckoutBaru + userId));

      if(response.statusCode == 200){
        var responseBody = json.decode(response.body);

        // buat variabel untuk menampung data dari response body yang ingin diambel isinya
        List listCheckoutBaruResponse = responseBody['data'];

        listCheckoutBaruResponse.forEach((data){
          listCheckoutNew.add(CheckoutModel.fromJson(data));
        });
      } else {
        listCheckoutNew = [];
      }

    } catch (e) {
      print(e);
    }
    return listCheckoutNew;
  }
// --------------------------------------

// function menampilkan data pesanan (checkout)

  Future<List<CheckoutModel>> listCheckoutProses(String userId) async {
    // siapkan variabel untuk menampung list datanya
    List<CheckoutModel> listCheckoutProse = [];


    
    try {
      // buat variabel untuk request ke web service (API)
      var response = await http.get(Uri.parse(Config().urlListCheckoutProses + userId));

      if(response.statusCode == 200){
        var responseBody = json.decode(response.body);

        // buat variabel untuk menampung data dari response body yang ingin diambel isinya
        List listCheckoutProsesResponse = responseBody['data'];

        listCheckoutProsesResponse.forEach((data){
          listCheckoutProse.add(CheckoutModel.fromJson(data));
        });
      } else {
        listCheckoutProse = [];
      }

    } catch (e) {
      print(e);
    }
    return listCheckoutProse;
  }

  // ------------------------------------------------------------

  // function menampilkan data pesanan (checkout)

  Future<List<CheckoutModel>> listCheckoutSelesai(String userId) async {
    // siapkan variabel untuk menampung list datanya
    List<CheckoutModel> listCheckoutSelesa = [];


    
    try {
      // buat variabel untuk request ke web service (API)
      var response = await http.get(Uri.parse(Config().urlListCheckoutSelesai + userId));

      if(response.statusCode == 200){
        var responseBody = json.decode(response.body);

        // buat variabel untuk menampung data dari response body yang ingin diambel isinya
        List listCheckoutSelesaiResponse = responseBody['data'];

        listCheckoutSelesaiResponse.forEach((data){
          listCheckoutSelesa.add(CheckoutModel.fromJson(data));
        });
      } else {
        listCheckoutSelesa = [];
      }

    } catch (e) {
      print(e);
    }
    return listCheckoutSelesa;
  }

  // menampilkan detail pemesanan
  Future<Map<String,dynamic>> detailOrder(String userId, String idPemesanan) async {
    final response = await http.get(Uri.parse('${Config.urlAPI}/checkout-detail?user_id=$userId&id_pemesanan=$idPemesanan'));

    if(response.statusCode == 200){
      final responseBody = json.decode(response.body);
      // ambil json detail
      final detail = DetailOrderModel.fromJson(responseBody['detail']);
      // ambil json data untuk item-itemnya
      final List<Items> products = (responseBody['data'] as List).map((item) => Items.fromJson(item)).toList();

      return {
        'detail' : detail,
        'products' : products
      };
    } else {
      throw Exception('Gagal memuat data');
    }
  }
}