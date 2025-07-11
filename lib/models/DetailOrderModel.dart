import 'package:sygara_app/config/config.dart';

class DetailOrderModel {
  int? id;
  Null? keranjangId;
  String? kodeTransaksi;
  int? userId;
  String? nama;
  String? nohp;
  String? kotaKecamatan;
  String? alamat;
  String? catatan;
  String? jenisPembayaran;
  String? jenisPengiriman;
  int? ongkir;
  int? grandTotal;
  String? status;
  Null? buktibayar;
  String? createdAt;
  String? updatedAt;

  DetailOrderModel(
      {this.id,
      this.keranjangId,
      this.kodeTransaksi,
      this.userId,
      this.nama,
      this.nohp,
      this.kotaKecamatan,
      this.alamat,
      this.catatan,
      this.jenisPembayaran,
      this.jenisPengiriman,
      this.ongkir,
      this.grandTotal,
      this.status,
      this.buktibayar,
      this.createdAt,
      this.updatedAt});

  DetailOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    keranjangId = json['keranjang_id'];
    kodeTransaksi = json['kode_transaksi'];
    userId = json['user_id'];
    nama = json['nama'];
    nohp = json['nohp'];
    kotaKecamatan = json['kota_kecamatan'];
    alamat = json['alamat'];
    catatan = json['catatan'];
    jenisPembayaran = json['jenis_pembayaran'];
    jenisPengiriman = json['jenis_pengiriman'];
    ongkir = json['ongkir'];
    grandTotal = json['grand_total'];
    status = json['status'];
    buktibayar = json['buktibayar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['keranjang_id'] = this.keranjangId;
    data['kode_transaksi'] = this.kodeTransaksi;
    data['user_id'] = this.userId;
    data['nama'] = this.nama;
    data['nohp'] = this.nohp;
    data['kota_kecamatan'] = this.kotaKecamatan;
    data['alamat'] = this.alamat;
    data['catatan'] = this.catatan;
    data['jenis_pembayaran'] = this.jenisPembayaran;
    data['jenis_pengiriman'] = this.jenisPengiriman;
    data['ongkir'] = this.ongkir;
    data['grand_total'] = this.grandTotal;
    data['status'] = this.status;
    data['buktibayar'] = this.buktibayar;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class Items {
  int? id;
  int? userId;
  int? productId;
  int? checkoutId;
  int? jumlah;
  int? totalharga;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? namaProduct;
  String? gambar;
  int? hargaSatuan;
  String? merkProduct;

  Items(
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

  Items.fromJson(Map<String, dynamic> json) {
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
