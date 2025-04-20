import 'package:flutter/material.dart';
import 'package:sygara_app/themes/themes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 10),
            //Logo
            Center(child: Image.asset('assets/logo.png')),
            SizedBox(height: 15),
            //title
            Text(
              'Daftar',
              style: titleTextStyle.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Buat akun untuk mulai belanja',
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
            //title
            SizedBox(height: 30),
            //form nama lengkap
            Text('Nama Lengkap', style: titleTextStyle),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),
                hintText: 'cth. Ahmad Fulan',
                hintStyle: secondaryTextStyle,
              ),
            ),
            SizedBox(height: 10),
            //form no telp
            Text('Nomor Telepon', style: titleTextStyle),
            SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),
                hintText: 'cth. 628xxxxxxxxx',
                hintStyle: secondaryTextStyle,
              ),
            ),
            SizedBox(height: 10),
            //form email
            Text('Email', style: titleTextStyle),
            SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),
                hintText: 'cth. example@email.com',
                hintStyle: secondaryTextStyle,
              ),
            ),
            SizedBox(height: 10),
            //form buatpassword
            Text('Buat Password', style: titleTextStyle),
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
                hintText: '********',
                hintStyle: secondaryTextStyle,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            //form konfirmasi password
            Text('Confirm Password', style: titleTextStyle),
            SizedBox(height: 8),
            TextFormField(
              obscureText: _obscureConfirmPassword,
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
                hintText: '********',
                hintStyle: secondaryTextStyle,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  icon: Icon(
                    _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            //button daftar
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onPressed: (){}, 
              child: Text('Daftar', style: whiteTextStyle,)
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sudah punya akun?', style: blackTextStyle.copyWith(fontSize: 16),),
                  Text(' Masuk', style: TextStyle(
                    color: primaryColor,
                    fontSize: 16
                  ),)
                ],
              ),
              SizedBox(height: 10,),
              Text('*Informasi pengguna untuk keperluan pengiriman \n'
              'dan promosi terkait produk', style: secondaryTextStyle.copyWith(
                fontSize: 16,
              ),)
          ],
        ),
      ),
    );
  }
}