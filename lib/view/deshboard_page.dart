import 'package:flutter/material.dart';
import 'package:ui_design/services/constant_widgets.dart';
import 'package:ui_design/view/profile_page.dart';

import 'cart_page.dart';
import 'home_page.dart';
import 'menu_page.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({super.key});

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  List<Item> _cartItems = [];

  int myindex = 0;
  List<Widget> widgetList = [
    const HomePage(),
    const MenuPage(),
    CartPage(
      cartItems: [],
    ),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: myindex,
        children: widgetList,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xffE96E6E),
          onTap: (index) {
            myindex = index;
            setState(() {});
          },
          currentIndex: myindex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Color(0xffC0C0C0),
              ),
              activeIcon: Icon(
                Icons.home,
                color: Color(0xffE96E6E),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  color: Color(0xffC0C0C0),
                ),
                activeIcon: Icon(
                  Icons.favorite,
                  color: Color(0xffE96E6E),
                ),
                label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xffC0C0C0),
                ),
                activeIcon: Icon(
                  Icons.shopping_cart,
                  color: Color(0xffE96E6E),
                ),
                label: 'cart'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: Color(0xffC0C0C0),
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: Color(0xffE96E6E),
                ),
                label: 'profile'),
          ]),
      backgroundColor: const Color.fromRGBO(252, 238, 243, 1),
    );
  }
}
