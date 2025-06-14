// import http
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http; 
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/models/Product_model.dart';
class ProductService {
  // function request data (mengambil data product) ke api
  static Future<List<ProductModel>> getProductRekomendasi() async{
    // buat variabel untuk menampung data list productnya
    List<ProductModel> listProduct = [];

    // request ke API
    try {
      // buat variabel untuk request ke API
      var response = await http.get(Uri.parse(Config().urlProductRekomendasi));
      // jika statuscode = 200, maka ambil datanya
      if (response.statusCode == 200) {
        // ambil isi body dari json yang didapatkan
        var responseBody = json.decode(response.body);

        // buat variabel untuk menampung isi dari response body
        // sesuaikan key yang akan diambil => 'data'
        List listProductRekomendasi = responseBody['data'];

        // isikan variabel listProduct yang tadinya kosong dengan isian yang didapatkan dari json, ada pada variabel listProductRekomendasi
        listProductRekomendasi.forEach((data){
          // panggil variabel listProduct dan add isinya
        listProduct.add(ProductModel.fromJson(data));
        });
        } else {
          listProduct = [];
        }
    } catch (e) {
      print(e);
    }
    return listProduct;
  }

  static Future<List<ProductModel>> getProductBuah() async{
    // buat variabel untuk menampung data list productnya
    List<ProductModel> listProduct = [];

    // request ke API
    try {
      // buat variabel untuk request ke API
      var response = await http.get(Uri.parse(Config().urlProductBuah));
      // jika statuscode = 200, maka ambil datanya
      if (response.statusCode == 200) {
        // ambil isi body dari json yang didapatkan
        var responseBody = json.decode(response.body);

        // buat variabel untuk menampung isi dari response body
        // sesuaikan key yang akan diambil => 'data'
        List listProductBuah = responseBody['data'];

        // isikan variabel listProduct yang tadinya kosong dengan isian yang didapatkan dari json, ada pada variabel listProductRekomendasi
        listProductBuah.forEach((data){
          // panggil variabel listProduct dan add isinya
        listProduct.add(ProductModel.fromJson(data));
        });
        } else {
          listProduct = [];
        }
    } catch (e) {
      print(e);
    }
    return listProduct;
  }

  static Future<List<ProductModel>> getProductSayur() async{
    // buat variabel untuk menampung data list productnya
    List<ProductModel> listProduct = [];

    // request ke API
    try {
      // buat variabel untuk request ke API
      var response = await http.get(Uri.parse(Config().urlProductSayur));
      // jika statuscode = 200, maka ambil datanya
      if (response.statusCode == 200) {
        // ambil isi body dari json yang didapatkan
        var responseBody = json.decode(response.body);

        // buat variabel untuk menampung isi dari response body
        // sesuaikan key yang akan diambil => 'data'
        List listProductSayur = responseBody['data'];

        // isikan variabel listProduct yang tadinya kosong dengan isian yang didapatkan dari json, ada pada variabel listProductRekomendasi
        listProductSayur.forEach((data){
          // panggil variabel listProduct dan add isinya
        listProduct.add(ProductModel.fromJson(data));
        });
        } else {
          listProduct = [];
        }
    } catch (e) {
      print(e);
    }
    return listProduct;
  }
}