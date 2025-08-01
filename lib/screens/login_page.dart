import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sygara_app/controllers/auth_controller.dart';
import 'package:sygara_app/screens/Home/home_screen.dart';
import 'package:sygara_app/screens/Profil/reset_password_page.dart';
import 'package:sygara_app/screens/bottom_nav_bar.dart';
import 'package:sygara_app/screens/register_page.dart';
import 'package:sygara_app/themes/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  // panggil AuthController
  final authC = Get.put(AuthController());

  // membuat key validation untuk form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 10),
            //logo
            Center(child: Image.asset('assets/logo.png')),
            SizedBox(height: 120),
            Text(
              'Masuk',
              style: titleTextStyle.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Masuk ke akun terdaftar untuk lanjut',
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
            //title
            SizedBox(height: 30),

            //buat form
            Form(
              key: _formKey,
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            //form email
            Text('Email', style: titleTextStyle),
            SizedBox(height: 10),
            TextFormField(
              // untuk setting validasi inputan, misal : saat kosong, dsb
              validator: (value) {
                if(value!.isEmpty){
                  return 'Email harus diisi!';
                }
                return null;
              },
              // parameter controller untuk memberikan nama/id dari sebuah TextFormField
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
            //form password
            Text('Password', style: titleTextStyle),
            SizedBox(height: 8),
            TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Password harus diisi!';
                }
                return null;
              },
              // parameter controller untuk memberikan nama/id dari sebuah TextFormField
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
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Lupa Password?',
                    style: primaryTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 42),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
                    // panggil function validation form
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                    }
                    authC.login();
                  },
                  child: 
                  authC.loading == true
                  ? CircularProgressIndicator(color: whiteColor,)
                  :Text('Masuk', style: whiteTextStyle),
                  
                  
                ),
              ),
            ),

                ],
            )
            ),

            SizedBox(height: 142),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum punya akun?',
                  style: blackTextStyle.copyWith(fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    ' Daftar',
                    style: TextStyle(color: primaryColor, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
