import 'package:flutter/material.dart';
import 'package:sygara_app/Data/product_data.dart';
import 'package:sygara_app/models/Product_model.dart';
import 'package:sygara_app/services/product_service.dart';
import 'package:sygara_app/themes/themes.dart';
import 'package:sygara_app/widgets/product_widget.dart';

class CategoryBuah extends StatelessWidget {
  const CategoryBuah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori Buah-Buahan', style: greyTextStyle),
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: 
        
        FutureBuilder<List<ProductModel>>(future: ProductService.getProductBuah(), 
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: primaryColor,));
          } else if(snapshot.hasData){
              // buat variabel untuk menampung data dari snapshot
              final buah = snapshot.data!;
            return GridView.builder(
          itemCount: buah.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 17,
            childAspectRatio: 176 / 209,
          ),
          itemBuilder: (context, index) {
            
            return ProductWidget(
              productModel: buah[index],
            );
          },
        );
          }

          return Container();
        }
        ),

        
      ),
    );
  }
}
