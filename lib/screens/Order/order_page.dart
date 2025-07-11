import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sp_util/sp_util.dart';
import 'package:sygara_app/models/Checkout_model.dart';
import 'package:sygara_app/screens/Order/order_detail_page.dart';
import 'package:sygara_app/services/checkout_service.dart';
import 'package:sygara_app/themes/themes.dart';
import 'package:sygara_app/widgets/order_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {

    int? userId = SpUtil.getInt('idUser');

    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 51, left: 20),
            child: Text('Pesanan Anda', style: greyTextStyle),
          ),

          // pesanan status baru
          Container(
            margin: EdgeInsets.only(top: 36, left: 20),
            child: Text(
              'Baru',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          FutureBuilder<List<CheckoutModel>>(future: CheckoutService().listCheckoutBaru(userId.toString()), 
          builder: (context, snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(color: primaryColor,),
              );
            }  else if(snapshot.data!.isEmpty){
              return Center(
                child: Image.asset('assets/img-empty.png', height: 160, width: 160,),
              );
            } else if (snapshot.hasData){
              return Column(
            children: [
              ...snapshot.data!.map((dataBaru){
                return InkWell(
                  onTap: () {
                    Get.to(OrderDetailPage(idPemesanan: dataBaru.id.toString()));
                  },
                  child: OrderWidget(
                    dataCheckout: dataBaru,
                              status: 'Baru',
                            
                            ),
                );
              })
            ],
          );
            }

            return Container();
          }),

          

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


          FutureBuilder<List<CheckoutModel>>(future: CheckoutService().listCheckoutProses(userId.toString()), 
          builder: (context, snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(color: primaryColor,),
              );
            } else if(snapshot.data!.isEmpty){
              return Center(
                child: Image.asset('assets/img-empty.png', height: 160, width: 160,),
              );
            } else if (snapshot.hasData){
              return Column(
            children: [
              ...snapshot.data!.map((dataProses){
                return InkWell(
                  onTap: () {
                    Get.to(OrderDetailPage(idPemesanan: dataProses.id.toString()));
                  },
                  child: OrderWidget(
                    dataCheckout: dataProses,
                              status: 'Diproses',
                            
                            ),
                );
              })
            ],
          );
            }

            return Container();
          }),
          Column(
            children: [
          //     OrderWidget(
          //   tanggal: '04/05/2025',
          //   items: 'Bayam (1kg), Tomat (1kg)',
          //   totalHarga: 'Rp.35.000',
          //   status: 'Diproses',
          // ),
            ],
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


          FutureBuilder<List<CheckoutModel>>(future: CheckoutService().listCheckoutSelesai(userId.toString()), 
          builder: (context, snapshot){

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(color: primaryColor,),
              );
            } else if(snapshot.data!.isEmpty){
              return Center(
                child: Image.asset('assets/img-empty.png', height: 160, width: 160,),
              );
            } else if (snapshot.hasData){
              return Column(
            children: [
              ...snapshot.data!.map((dataSelesai){
                return InkWell(
                  onTap: () {
                    Get.to(OrderDetailPage(idPemesanan: dataSelesai.id.toString()));
                  },
                  child: OrderWidget(
                    dataCheckout: dataSelesai,
                              status: 'Selesai',
                            
                            ),
                );
              })
            ],
          );
            }

            return Container();
          }),


          // OrderWidget(
          //   tanggal: '14/02/2025',
          //   items: 'Apel Fuji (2kg), Wortel (1kg), Jeruk (1kg), Semangka (1kg)',
          //   totalHarga: 'Rp.75.000',
          //   status: 'Selesai',
          // ),
        ],
      ),
    );
  }
}
