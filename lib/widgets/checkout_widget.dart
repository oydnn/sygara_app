import 'package:flutter/material.dart';
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/models/Cart_model.dart';
import 'package:sygara_app/themes/themes.dart';

class CheckoutWidget extends StatelessWidget {
  // final String imageUrl;
  // final String nama;
  // final String harga;

  final CartModel dataKeranjang;

  const CheckoutWidget({
    super.key, required this.dataKeranjang,
    // required this.imageUrl,
    // required this.nama,
    // required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20, right: 17, bottom: 14),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 87,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: mediumGrayColor, width: 0.6),
            ),
            child: Image.network(dataKeranjang.gambar!),
          ),
          SizedBox(width: 19),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataKeranjang.namaProduct!,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(Config.convertToIdr(dataKeranjang.hargaSatuan, 0) + ' x ' + dataKeranjang.jumlah.toString()),
            ],
          ),
          Spacer(),
          Text(
            Config.convertToIdr(dataKeranjang.totalharga, 0),
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
