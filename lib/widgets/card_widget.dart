import 'package:flutter/material.dart';
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/models/Cart_model.dart';
import 'package:sygara_app/themes/themes.dart';

class CardWidget extends StatefulWidget {
  // final String imageUrl;
  // final String nama;
  // final String totalHarga;

  // panggil CartModel
  final CartModel dataKeranjang;

  const CardWidget({
    super.key, required this.dataKeranjang,

    // required this.imageUrl,
    // required this.nama,
    // required this.totalHarga,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {


  int quantity = 1;
  int jumlahPerItem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jumlahPerItem = widget.dataKeranjang.jumlah!;
  }


  void increment() {
    if (jumlahPerItem < 10) {
      setState(() {
        jumlahPerItem++;
      });
    }
  }

  void decrement() {
    if (jumlahPerItem > 1) {
      setState(() {
        jumlahPerItem--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: 372,
      // height: 155,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: secondaryColor, width: 0.6),
      ),
      child: Row(
        children: [
          // Image.asset(widget.imageUrl, width: 176, height: 155),
          Image.network(widget.dataKeranjang.gambar.toString(), width: 176, height: 155),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.dataKeranjang.namaProduct.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Berat/Kg :',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: decrement,
                      icon: Image.asset('assets/icon/ic-minus.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      jumlahPerItem.toString(),
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: increment,
                      icon: Image.asset('assets/icon/ic-plus.png'),
                    ),
                  ),
                ],
              ),
              Text(
                'Harga :',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                Config.convertToIdr(widget.dataKeranjang.hargaSatuan, 0) + ' x ' + jumlahPerItem.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                Config.convertToIdr(widget.dataKeranjang.totalharga, 0),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
