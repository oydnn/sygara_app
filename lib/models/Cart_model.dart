import 'package:sygara_app/config/config.dart';

class CartModel {
  int? id;
  int? userId;
  int? productId;
  Null? checkoutId;
  int? jumlah;
  int? totalharga;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? namaProduct;
  String? gambar;
  int? hargaSatuan;
  String? merkProduct;

  CartModel(
      {this.id,
      this.userId,
      this.productId,
      this.checkoutId,
      this.jumlah,
      this.totalharga,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.namaProduct,
      this.gambar,
      this.hargaSatuan,
      this.merkProduct});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    checkoutId = json['checkout_id'];
    jumlah = json['jumlah'];
    totalharga = json['totalharga'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    namaProduct = json['nama_product'];
    gambar = Config.urlMain + 'storage/' + json['gambar'];
    hargaSatuan = json['harga_satuan'];
    merkProduct = json['merk_product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['checkout_id'] = this.checkoutId;
    data['jumlah'] = this.jumlah;
    data['totalharga'] = this.totalharga;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['nama_product'] = this.namaProduct;
    data['gambar'] = this.gambar;
    data['harga_satuan'] = this.hargaSatuan;
    data['merk_product'] = this.merkProduct;
    return data;
  }
}
