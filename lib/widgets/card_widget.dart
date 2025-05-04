import 'package:flutter/material.dart';
import 'package:sygara_app/themes/themes.dart';

class CardWidget extends StatefulWidget {
  final String imageUrl;
  final String nama;
  final String totalHarga;
  const CardWidget({
    super.key,
    required this.imageUrl,
    required this.nama,
    required this.totalHarga,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
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
    return Container(
      width: 372,
      height: 155,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: secondaryColor, width: 0.6),
      ),
      child: Row(
        children: [
          Image.asset(widget.imageUrl, width: 176, height: 155),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.nama,
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
                      quantity.toString(),
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
                widget.totalHarga,
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
