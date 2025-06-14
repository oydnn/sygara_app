// memodelkan json productmodel
import 'package:sygara_app/config/config.dart';

// class ProductModel {
//     int id;
//     String merkId;
//     String namaProduct;
//     String harga;
//     String gambar;
//     String spesifikasi;
//     String rating;
//     String status;
//     String rekomendasi;
//     DateTime createdAt;
//     DateTime updatedAt;
//     Merk merk;

//     ProductModel({
//         required this.id,
//         required this.merkId,
//         required this.namaProduct,
//         required this.harga,
//         required this.gambar,
//         required this.spesifikasi,
//         required this.rating,
//         required this.status,
//         required this.rekomendasi,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.merk,
//     });

//     // untuk menerima data json dari web service
//     factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         id: json["id"] ?? 0,
//         merkId: json["merk_id"] ?? "0",
//         namaProduct: json["nama_product"] ?? "-",
//         harga: json["harga"],
//         // https://syntop.airportslab.com/storage/product-images/9uNgLcbkp3W53ICBwaaS8HblOXKIuFwdUWHQ1aHJ.webp
//         gambar: Config.urlMain + 'storage/' + json["gambar"] ,
//         spesifikasi: json["spesifikasi"] ?? "-",
//         rating: json["rating"] ?? "4.5",
//         status: json["status"] ?? "1",
//         rekomendasi: json["rekomendasi"] ?? "1",
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         merk: Merk.fromJson(json["merk"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "merk_id": merkId,
//         "nama_product": namaProduct,
//         "harga": harga,
//         "gambar": gambar,
//         "spesifikasi": spesifikasi,
//         "rating": rating,
//         "status": status,
//         "rekomendasi": rekomendasi,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "merk": merk.toJson(),
//     };
// }

// class Merk {
//     int id;
//     String merkProduct;
//     String status;
//     DateTime createdAt;
//     DateTime updatedAt;

//     Merk({
//         required this.id,
//         required this.merkProduct,
//         required this.status,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory Merk.fromJson(Map<String, dynamic> json) => Merk(
//         id: json["id"],
//         merkProduct: json["merk_product"] ?? "-",
//         status: json["status"] ?? "1",
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "merk_product": merkProduct,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }


class ProductModel {
  int? id;
  int? merkId;
  String? namaProduct;
  int? harga;
  String? gambar;
  String? spesifikasi;
  Null? rating;
  String? status;
  String? rekomendasi;
  String? createdAt;
  String? updatedAt;
  Merk? merk;

// field2 bisa dipakai/dipanggil pada view yang membutuhkan (harus dihubungkan terlebih dahulu)
  ProductModel(
      {this.id,
      this.merkId,
      this.namaProduct,
      this.harga,
      this.gambar,
      this.spesifikasi,
      this.rating,
      this.status,
      this.rekomendasi,
      this.createdAt,
      this.updatedAt,
      this.merk});

// mengambil data dari json
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merkId = json['merk_id'];
    namaProduct = json['nama_product'];
    harga = json['harga'];
    // tambahkan url(path) pada field gambar untuk menampilakn gambar di halaman, tambahkan string di depan json[gambar]
    // isi dari Config.urlMain = 'https://ip
    // tapi karena untuk menampilkan gambar, harus ditambahkan path /storage, maka tambahkan setelah pemanggilan Config.urlMain
    gambar = Config.urlMain + 'storage/' + json['gambar'];
    spesifikasi = json['spesifikasi'];
    rating = json['rating'];
    status = json['status'];
    rekomendasi = json['rekomendasi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    merk = json['merk'] != null ? new Merk.fromJson(json['merk']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['merk_id'] = this.merkId;
    data['nama_product'] = this.namaProduct;
    data['harga'] = this.harga;
    data['gambar'] = this.gambar;
    data['spesifikasi'] = this.spesifikasi;
    data['rating'] = this.rating;
    data['status'] = this.status;
    data['rekomendasi'] = this.rekomendasi;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.merk != null) {
      data['merk'] = this.merk!.toJson();
    }
    return data;
  }
}

// memodelkan json merk
class Merk {
  int? id;
  String? merkProduct;
  String? status;
  String? createdAt;
  String? updatedAt;

  Merk(
      {this.id, this.merkProduct, this.status, this.createdAt, this.updatedAt});

  Merk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merkProduct = json['merk_product'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['merk_product'] = this.merkProduct;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


