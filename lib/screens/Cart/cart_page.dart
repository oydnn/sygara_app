import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:sygara_app/config/config.dart';
import 'package:sygara_app/models/Cart_model.dart';
import 'package:sygara_app/screens/checkout_page.dart';
import 'package:sygara_app/services/cart_service.dart';
import 'package:sygara_app/themes/themes.dart';
import 'package:sygara_app/widgets/card_widget.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
    futureData = fetchData(); // isikan variabel futureData yang tadinya kosong dengan hasil return function fetchData()
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text('Keranjang', style: greyTextStyle),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 25, left: 20, right: 20),
        child: 

        FutureBuilder<List<CartModel>>(future: CartService().listCart(), 
        builder: (context, snapshot){
          
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: primaryColor,),);
          } else if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "Keranjang Kosong,\n Yuk Pesen Sekarang!",
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
              );
            }
           else if(snapshot.hasData){
            return ListView(
          children: [
            ...snapshot.data!.map((keranjang){
              return CardWidget(dataKeranjang: keranjang);
            })
          ],
        );
          }


          return Container();
        }
        )
        
        
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sub Total',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ), 
                  FutureBuilder<Map<String, dynamic>>(future: futureData, 
                  builder:(context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(),);
                    } else if (snapshot.hasData) {
                      final data = snapshot.data!; // buat variabel untuk menampung hasil dari snapshot
                      return Text(
                    Config.convertToIdr(data['grandtotal'], 0),
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                    }
                    return Container();
                  } ),
                  
                ],
              ),
              Container(
                width: 176,
                height: 45,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder<Map<String, dynamic>>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(color: whiteColor),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data!;
                      if (data["grandtotal"] == 0) {
                        return Center(
                          child: InkWell(
                            onTap: () {
                              null;
                            },
                            child: Text(
                              'Keranjang Kosong',
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckoutPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Beli',
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }
                    }
                    return Container();
                  },
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
