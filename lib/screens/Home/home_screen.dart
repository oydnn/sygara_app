import 'package:flutter/material.dart';
import 'package:sygara_app/models/Product_model.dart';
import 'package:sygara_app/screens/Home/widgets/categories.dart';
import 'package:sygara_app/screens/Home/widgets/image_banner.dart';
import 'package:sygara_app/screens/Home/widgets/search_bar.dart';
import 'package:sygara_app/services/product_service.dart';
import 'package:sygara_app/themes/themes.dart';
import 'package:sygara_app/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 42),
          MySearchBar(),
          SizedBox(height: 21),
          Categories(),
          SizedBox(height: 17),
          ImageBanner(),
          SizedBox(height: 21),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text('Rekomendasi untuk Anda', style: titleTextStyle),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 17),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
              // gunakan widget Future Builder untuk get Data
              FutureBuilder<List<ProductModel>>(future: ProductService.getProductRekomendasi(), 
              builder: (context, snapshot){
                // jika sedang proses pengambilan data
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // maka tampilkan loading
                  return CircularProgressIndicator(
                    color: primaryColor,
                  );
                } 
                // jika proses pengambilan data telah selesai dan datanya ada
                else if(snapshot.hasData){
                  // maka tampilkan sesuai desain UI

                  return Row(
                    children: [
                      // ProductWidget(imgUrl: 'assets/img-pisang.png', nama: 'Pisang Cavendish', harga: 'Rp.15.000/kg')

                      ...snapshot.data!.map((dataProduct){

                        // siapkan variabel untuk emngambil index => pada index terentu, berikan margin
                        var index = snapshot.data!.indexOf(dataProduct);
                        return Container(
                          margin: EdgeInsets.only(left: index > 0 ? 10 : 0),
                          child:  ProductWidget(productModel: dataProduct,)
,
                        );
                        
                      })
                    ],
                  );
                }

                // default return
                return Container();
              } ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Buah Segar 🍎', style: titleTextStyle),
                Text(
                  'Lihat Lainnya',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 17),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<List<ProductModel>>(future: ProductService.getProductBuah(), 
              builder: (context, snapshot){
                // jika sedang proses pengambilan data
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // maka tampilkan loading
                  return CircularProgressIndicator(
                    color: primaryColor,
                  );
                } 
                // jika proses pengambilan data telah selesai dan datanya ada
                else if(snapshot.hasData){
                  // maka tampilkan sesuai desain UI

                  return Row(
                    children: [
                      // ProductWidget(imgUrl: 'assets/img-pisang.png', nama: 'Pisang Cavendish', harga: 'Rp.15.000/kg')

                      ...snapshot.data!.map((dataProduct){

                        // siapkan variabel untuk emngambil index => pada index terentu, berikan margin
                        var index = snapshot.data!.indexOf(dataProduct);
                        return Container(
                          margin: EdgeInsets.only(left: index > 0 ? 10 : 0),
                          child:  ProductWidget(productModel: dataProduct,)
,
                        );
                        
                      })
                    ],
                  );
                }

                // default return
                return Container();
              } ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sayuran Segar 🥕', style: titleTextStyle),
                Text(
                  'Lihat Lainnya',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 17),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<List<ProductModel>>(future: ProductService.getProductSayur(), 
              builder: (context, snapshot){
                // jika sedang proses pengambilan data
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // maka tampilkan loading
                  return CircularProgressIndicator(
                    color: primaryColor,
                  );
                } 
                // jika proses pengambilan data telah selesai dan datanya ada
                else if(snapshot.hasData){
                  // maka tampilkan sesuai desain UI

                  return Row(
                    children: [
                      // ProductWidget(imgUrl: 'assets/img-pisang.png', nama: 'Pisang Cavendish', harga: 'Rp.15.000/kg')

                      ...snapshot.data!.map((dataProduct){

                        // siapkan variabel untuk emngambil index => pada index terentu, berikan margin
                        var index = snapshot.data!.indexOf(dataProduct);
                        return Container(
                          margin: EdgeInsets.only(left: index > 0 ? 10 : 0),
                          child:  ProductWidget(productModel: dataProduct,)
,
                        );
                        
                      })
                    ],
                  );
                }

                // default return
                return Container();
              } ),
            ),
          ),
        ],
      ),
    );
  }
}
