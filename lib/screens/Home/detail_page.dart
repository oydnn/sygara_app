import 'package:flutter/material.dart';
import 'package:sygara_app/themes/themes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  void increment() {
    if (quantity < 10) {
      setState(() {
        quantity++;
      });
    }
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/icon/ic-arrow-back.png',
            width: 40,
            height: 40,
          ),
        ),
        title: Text('Detail Produk', style: greyTextStyle),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/img-bayam.png',)),
              SizedBox(height: 11),
              Text(
                'Bayam',
                style: titleTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Kategori : Sayur Mayur',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Deskripsi',
                style: titleTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Nikmati sayur bayam segar langsung dari kebun dengan \nrasa yang segar.',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Harga/Kg',
                style: titleTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Rp. 15.000',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 19),
              Text(
                'Mau beli berapa Kg?',
                style: titleTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  IconButton(
                    onPressed: decrement,
                    icon: Image.asset('assets/icon/ic-minus.png'),
                  ),
                  SizedBox(width: 8),
                  Text(
                    quantity.toString(),
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    onPressed: increment,
                    icon: Image.asset('assets/icon/ic-plus.png'),
                  ),
                  SizedBox(width: 16),
                  Text(
                    '*Maksimal pembelian 10Kg',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 75,
        width: 412,
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Harga', style: whiteTextStyle,),
                Text('Rp. 15.000', style: whiteTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),)
              ],
            ),
            InkWell(
              onTap: (){
                showDialog(
                  context: context, 
                  builder: (BuildContext context){
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.only(left:16, right: 25),
                      content: SizedBox(
                        height: 65,
                        width: 372,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: primaryColor,
                              size: 23,
                            ),
                            SizedBox(width: 5,),
                            Text('Produk berhasil ditambah ke keranjang!', style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),)
                          ],
                        ),
                      ),
                    );
                  },
                  );
              },
              child: Container(
                width: 176,
                height: 45,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
              
                ),
                child: Center(
                  child: Text('+Keranjang', style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
