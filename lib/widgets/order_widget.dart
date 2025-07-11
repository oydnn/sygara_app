import 'package:flutter/material.dart';
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/models/Checkout_model.dart';
import 'package:sygara_app/themes/themes.dart';

class OrderWidget extends StatelessWidget {
  // final String tanggal, items, totalHarga, status;

  final String status;
  final CheckoutModel dataCheckout;

  const OrderWidget({
    super.key, 
    required this.dataCheckout, required this.status,

    // required this.tanggal,
    // required this.items,
    // required this.totalHarga,
    // required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: secondaryColor, width: 1.16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Belanja',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            dataCheckout.createdAt.toString(),
            style: greyTextStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 15),
          Divider(color: mediumGrayColor, thickness: 2),
          SizedBox(height: 16),
          Row(
            children: [
              // Image.asset('assets/img-order.png', width: 51, height: 51),
              Image.network(dataCheckout.item!.gambar.toString(), width: 51, height: 51),
              SizedBox(width: 37),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Item:',
                      style: greyTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      dataCheckout.item!.namaProduct.toString(),
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Total belanja:',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    Config.convertToIdr(dataCheckout.grandTotal, 0),
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: 133,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    //logika untuk border
                    color: status == 'Diproses' ? yellowColor : status == 'Baru' ? blueColor : primaryColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    //logika untuk teks
                    status,
                    style:
                        status == 'Diproses'
                            ? yellowTextStyle : status == 'Baru' ? blueTextStyle
                            : primaryTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
