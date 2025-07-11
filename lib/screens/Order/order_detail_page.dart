import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sp_util/sp_util.dart';
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/models/DetailOrderModel.dart';
import 'package:sygara_app/services/checkout_service.dart';
import 'package:sygara_app/themes/themes.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key, required this.idPemesanan});

  final String idPemesanan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Pemesanan',
          style: blackTextStyle.copyWith(fontSize: 16),
        ),
      ),
      body: FutureBuilder(
        future: CheckoutService().detailOrder(SpUtil.getInt('idUser').toString(),
          idPemesanan,
        ),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          } else if(snapshot.hasError){
            return Center(child: Text('Error : ${snapshot.error}'),);
          }

          // siapkan variabel untuk menampung data Detail dan data products yang dibuat di service
          final detail = snapshot.data!['detail'] as DetailOrderModel;
          final products = snapshot.data!['products'] as List<Items>;

          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text('Kode Transaksi ${detail.kodeTransaksi}'),
              Text('Nama : ${detail.nama}'),
              Text('Alamat : ${detail.alamat}'),
              Text('Ongkir : ' + Config.convertToIdr(detail.ongkir, 0)),
              Text('Total : ' + Config.convertToIdr(detail.grandTotal, 0)),
              SizedBox(height: 16,),
              // menampilkan list item yang dibeli
              Text('Produk :'),
              ...products.map((product) {
                return
                Card(
                  child: ListTile(
                    leading: Image.network(product.gambar.toString(), width: 50, height: 50, fit: BoxFit.cover,),
                    title: Text(product.namaProduct.toString()),
                    subtitle: Text('${product.jumlah} x' + Config.convertToIdr(product.hargaSatuan, 0)),
                    trailing: Text('' + Config.convertToIdr(product.totalharga, 0)),
                  ),
                );
              })
            ],
          );
        },
      ),
    );
  }
}
