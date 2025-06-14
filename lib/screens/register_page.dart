import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sygara_app/controllers/auth_controller.dart';
import 'package:sygara_app/screens/bottom_nav_bar.dart';
import 'package:sygara_app/screens/login_page.dart';
import 'package:sygara_app/themes/themes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  //panggil authcontroller
  final authC = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();

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

            Form(
              key: _formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //form nama lengkap
            Text('Nama Lengkap', style: titleTextStyle),
            SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Nama harus diisi!';
                }
                return null;
              },
              controller: authC.name,
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
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
              validator: (value) {
                if(value!.isEmpty){
                  return 'Nomor telepon harus diisi!';
                }
                return null;
              },
              controller: authC.telepon,
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
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
              validator: (value) {
                if(value!.isEmpty){
                  return 'Email harus diisi!';
                }
                return null;
              },
              controller: authC.email,
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
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
              validator: (value) {
                if(value!.isEmpty){
                  return 'Password harus diisi!';
                }
                return null;
              },
              controller: authC.password,
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
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
              validator: (value) {
                if(value!.isEmpty){
                  return 'Password harus diisi!';
                }
                return null;
              },
              controller: authC.password,
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: secondaryColor, width: 1.5),
                ),
                focusedErrorBorder: OutlineInputBorder(
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
                    _obscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            //button daftar
            SizedBox(
              height: 45,
              width: double.infinity,
              child: Obx(
                () => SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.push(context,
                      // MaterialPageRoute(builder: (context) => LoginPage()));
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                      }
                      authC.register();
                    },
                    child: authC.loading == true ? CircularProgressIndicator(color: whiteColor,) : Text('Daftar', style: whiteTextStyle),
                  ),
                ),
              ),
            ),
              ],
            )),

            
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah punya akun?',
                  style: blackTextStyle.copyWith(fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    ' Masuk',
                    style: TextStyle(color: primaryColor, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '*Informasi pengguna untuk keperluan pengiriman \n'
              'dan promosi terkait produk',
              style: secondaryTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
