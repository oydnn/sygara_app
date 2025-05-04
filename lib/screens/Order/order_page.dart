import 'package:flutter/material.dart';
import 'package:sygara_app/themes/themes.dart';
import 'package:sygara_app/widgets/order_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 51, left: 20),
            child: Text('Pesanan Anda', style: greyTextStyle),
          ),
          Container(
            margin: EdgeInsets.only(top: 36, left: 20),
            child: Text(
              'Dalam Proses',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          OrderWidget(
            tanggal: '04/05/2025',
            items: 'Bayam (1kg), Tomat (1kg)',
            totalHarga: 'Rp.35.000',
            status: 'Diproses',
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 20),
            child: Text(
              'Riwayat Pemesanan',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          OrderWidget(
            tanggal: '14/02/2025',
            items: 'Apel Fuji (2kg), Wortel (1kg), Jeruk (1kg), Semangka (1kg)',
            totalHarga: 'Rp.75.000',
            status: 'Selesai',
          ),
        ],
      ),
    );
  }
}
