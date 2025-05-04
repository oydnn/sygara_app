import 'package:flutter/material.dart';
import 'package:sygara_app/screens/Cart/cart_page.dart';
import 'package:sygara_app/screens/Home/home_screen.dart';
import 'package:sygara_app/screens/Order/empty_order_page.dart';
import 'package:sygara_app/screens/Profil/profil_page.dart';
import 'package:sygara_app/themes/themes.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  final List<Widget> screenList = [
    HomeScreen(),
    CartPage(),
    EmptyOrderPage(),
    ProfilPage(),
  ];

  void itemOnTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[selectedIndex],
      bottomNavigationBar: Container(
        height: 78,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: blackColor.withAlpha((0.15 * 255).toInt()),
              offset: Offset(0, -8),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'Beranda',
              icon: Image.asset(
                'assets/icon/ic-home.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset('assets/icon/ic-home-green.png',
              width: 20,
              height: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Keranjang',
              icon: Image.asset(
                'assets/icon/ic-cart.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset('assets/icon/ic-cart-green.png',
              width: 20,
              height: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Pesanan',
              icon: Image.asset(
                'assets/icon/ic-pesanan.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset('assets/icon/ic-pesanan-green.png', 
              width: 20,
              height: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profil',
              icon: Image.asset(
                'assets/icon/ic-profil.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset('assets/icon/ic-profil-green.png',
              width: 20,
              height: 20,
              )
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryColor,
          onTap: itemOnTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          selectedLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
