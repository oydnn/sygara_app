import 'package:sygara_app/config/config.dart';

class CheckoutModel {
  int? id;
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
  Null? buktibayar;
  String? status;
  String? createdAt;
  String? updatedAt;
  Item? item;

  CheckoutModel(
      {this.id,
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
      this.buktibayar,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.item});

  CheckoutModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    buktibayar = json['buktibayar'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['buktibayar'] = this.buktibayar;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class Item {
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

  Item(
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

  Item.fromJson(Map<String, dynamic> json) {
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
