import 'package:flutter/material.dart';
import 'package:sygara_app/themes/themes.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _obscurePassword = true;

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
        title: Text(
          'Reset Password',
          style: greyTextStyle.copyWith(
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(height: 17),
            //
            Text('Masukkan Password Lama', style: titleTextStyle),
            SizedBox(height: 10),
            TextFormField(
              obscureText: _obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),
                hintText: '***********',
                hintStyle: secondaryTextStyle,
              ),
            ),
            SizedBox(height: 13),
            //
            Text('Buat Password Baru', style: titleTextStyle),
            SizedBox(height: 8),
            TextFormField(
              obscureText: _obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),
                hintText: '***********',
                hintStyle: secondaryTextStyle,
              ),
            ),
            SizedBox(height: 13),
            //
            Text('Konfirmasi Password', style: titleTextStyle),
            SizedBox(height: 8),
            TextFormField(
              obscureText: _obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),
                hintText: '***********',
                hintStyle: secondaryTextStyle,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: (){},
          child: Text('Simpan Perubahan', style: whiteTextStyle),
        ),
      ),
    );
  }
}
