import 'package:flutter/material.dart';
import 'package:sygara_app/themes/themes.dart';
import 'package:sygara_app/widgets/checkout_widget.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String metodePengiriman = '-- Pilih Satu --';
  String metodeBayar = 'COD';

  final pilihan = [
    '-- Pilih Satu --',
    'Reguler | Rp 10.000',
    'Express | Rp 20.000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: titleTextStyle),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/icon/ic-arrow-back.png',
            width: 40,
            height: 40,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: secondaryColor, width: 1.6),
                  ),
                  child: Column(
                    children: [
                      CheckoutWidget(
                        imageUrl: 'assets/img-bayam.png',
                        nama: 'Bayam (1kg)',
                        harga: 'Rp 15.000',
                      ),
                      CheckoutWidget(
                        imageUrl: 'assets/img-tomat.png',
                        nama: 'Tomat (1kg)',
                        harga: 'Rp 10.000',
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Informasi Pengiriman',
                  style: titleTextStyle.copyWith(fontSize: 24),
                ),
                SizedBox(height: 16),
                Text('Nama Pembeli', style: titleTextStyle),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 16,
                      top: 13,
                      bottom: 13,
                    ),
                    filled: true,
                    fillColor: lightGrayColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: mediumGrayColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: mediumGrayColor),
                    ),
                    hintText: 'Ahmad Fulan',
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                SizedBox(height: 13),
                Text('Nomor Telepon', style: titleTextStyle),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 16,
                      top: 13,
                      bottom: 13,
                    ),
                    filled: true,
                    fillColor: lightGrayColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: mediumGrayColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: mediumGrayColor),
                    ),
                    hintText: '628123829382932',
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                SizedBox(height: 13),
                Text('ALamat Lengkap', style: titleTextStyle),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  maxLines: 4,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 16,
                      top: 13,
                      bottom: 13,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: secondaryColor, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: secondaryColor, width: 1),
                    ),
                    hintText: 'cth. jalan jendral sudirman, disamping gang...',
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                SizedBox(height: 13),
                Text('Pilih Metode Pengiriman', style: titleTextStyle),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  icon: Image.asset(
                    "assets/icon/ic-arrow.png",
                    width: 16,
                    height: 16,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 16,
                      top: 13,
                      bottom: 13,
                      right: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: secondaryColor, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: secondaryColor, width: 1),
                    ),
                  ),
                  value: metodePengiriman,
                  items:
                      pilihan.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      metodePengiriman = newValue!;
                    });
                  },
                ),
                SizedBox(height: 13),
                Text('Pilih Metode Pembayaran', style: titleTextStyle),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  icon: Image.asset(
                    "assets/icon/ic-arrow.png",
                    width: 16,
                    height: 16,
                  ),
                  decoration: InputDecoration(
                    fillColor: lightGrayColor,
                    filled: true,
                    contentPadding: EdgeInsets.only(
                      left: 16,
                      top: 13,
                      bottom: 13,
                      right: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: mediumGrayColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: mediumGrayColor),
                    ),
                  ),
                  value: metodeBayar,
                  items:
                      <String>['COD'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: secondaryTextStyle),
                        );
                      }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      metodeBayar = newValue!;
                    });
                  },
                ),
                SizedBox(height: 5),
                Text(
                  '*Saat ini pembayaran hanya via COD',
                  style: primaryTextStyle.copyWith(fontSize: 16),
                ),
                SizedBox(height: 30),
                Text(
                  'Ringkasan Belanja',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 17),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Berat Total : ',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '2Kg',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Ongkos Kirim : ',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Rp 10.000',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Harga Total : ',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Rp 35.000',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Metode Bayar : ',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'COD (Cash On Delivery)',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: blackColor.withAlpha((0.15 * 255).toInt()),
              offset: Offset(0, -8),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Harga Total',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Rp 35.000',
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                width: 176,
                height: 45,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Beli',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
