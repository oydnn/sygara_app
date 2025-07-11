import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sp_util/sp_util.dart';
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/controllers/checkout_controller.dart';
import 'package:sygara_app/models/Cart_model.dart';
import 'package:sygara_app/screens/Home/succes_page.dart';
import 'package:sygara_app/services/cart_service.dart';
import 'package:sygara_app/themes/themes.dart';
import 'package:sygara_app/widgets/checkout_widget.dart';
import 'package:http/http.dart' as http;

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String metodePengiriman = 'J&T';
  String metodeBayar = 'COD';

  final pilihan = ['J&T', 'JNE', 'Sicepat'];

  // panggil checkout_controller
  final checkoutC = Get.put(CheckoutController());

  // buat variabel untuk menampung data userId yang login
  int? userId = SpUtil.getInt('idUser');

  // siapkan variabel untuk menyimpan detail keranjang dari response json
  late Future<Map<String, dynamic>> futureData;

  // ambil data untuk menampilkan detailnya
  Future<Map<String, dynamic>> fetchData() async {
    // ganti URL ini dengan API endpoint kamu
    final response = await http.get(
      Uri.parse(Config().urlCartList + userId.toString()), // ambil variabel urlCartList yang sudah dibuat di class
    );

    if (response.statusCode == 200) {
      // jika statusCode == 200 (succes), maka ambil isian body response jsonnya
      var responseBody = json.decode(response.body);
      
      return responseBody;
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = fetchData();
  }

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
                  child: 

                  FutureBuilder<List<CartModel>>(future: CartService().listCart(), 
                  builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(color: primaryColor,),
                      );
                    } else if(snapshot.hasData){
                      return Column(
                    children: [
                      ...snapshot.data!.map((dataKeranjang){
                        return CheckoutWidget(dataKeranjang: dataKeranjang);
                      }),
                      SizedBox(height: 16),
                    ],
                  );
                    } return Container();
                  })

                  
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
                  controller: checkoutC.namaPembeli,
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
                  controller: checkoutC.noTelp,
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
                  controller: checkoutC.alamatLengkap,
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
                SizedBox(height: 10),
                TextFormField(
                  controller: checkoutC.kotaKecamatan,
                  keyboardType: TextInputType.text,
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
                    hintText: 'Kota Anda',
                    hintStyle: secondaryTextStyle,
                  ),
                ),
                SizedBox(height: 13),
                Text('Catatan', style: titleTextStyle),
                SizedBox(height: 10),
                TextFormField(
                  controller: checkoutC.catatan,
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
                    hintText: 'isi jika ada catatan',
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

                FutureBuilder<Map<String, dynamic>>(future: fetchData(), 
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(color: primaryColor,),
                    );
                  } else if (snapshot.hasData){
                    final data = snapshot.data!; // buat variabel untuk menampung hasil dari snapshot.data

                    int totalHarga = data['grandtotal'] + 10000;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total Item : ',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: data['jumlahBarang'].toString() + ' item',
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
                        text: Config.convertToIdr(data['grandtotal'], 0),
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
                        text: 'Harga Total (+ Ongkir) : ',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: Config.convertToIdr(totalHarga, 0),
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
                    );
                  } return Container();
                }),

                
                
                
                
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

                  FutureBuilder<Map<String,dynamic>>(future: fetchData(), 
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(color: primaryColor,),);
                    } else if (snapshot.hasData) {
                      final data = snapshot.data!;

                      int totalHarga = data['grandtotal'] + 10000;


                      return Text(
                    Config.convertToIdr(totalHarga, 0),
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                    } return Container();
                  }
                  )
                  
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
                  child: InkWell(
                    onTap: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return AlertDialog(
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       title: Center(
                      //         child: Text(
                      //           'Proses pesanan sekarang?',
                      //           style: titleTextStyle,
                      //         ),
                      //       ),
                      //       content: Row(
                      //         children: [
                      //           ElevatedButton(
                      //             onPressed: () {
                      //               Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                   builder: (context) => SuccesPage(),
                      //                 ),
                      //               );
                      //             },
                      //             style: ElevatedButton.styleFrom(
                      //               backgroundColor: primaryColor,
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(10),
                      //               ),
                      //             ),
                      //             child: Text(
                      //               'Ya Proses',
                      //               style: whiteTextStyle,
                      //             ),
                      //           ),
                      //           SizedBox(width: 11),
                      //           OutlinedButton(
                      //             onPressed: () {
                      //               Navigator.pop(context);
                      //             },
                      //             style: OutlinedButton.styleFrom(
                      //               side: BorderSide(color: brightRedColor),
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(10),
                      //               ),
                      //             ),
                      //             child: Text(
                      //               'Batalkan',
                      //               style: TextStyle(
                      //                 color: brightRedColor,
                      //                 fontSize: 16,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );

                      // panggil function checkoutPost
                      checkoutC.checkoutPost(metodeBayar, metodePengiriman);
                    },
                    child: Obx(
                      () => checkoutC.isLoading == true ? CircularProgressIndicator(color: primaryColor,) :  Text(
                        'Beli',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
