import 'dart:async';

import 'package:cocaian/models/cart.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class MyBottomNavBar extends StatefulWidget {
  final Function(int) onTabChange;
  final int cart_size;

  const MyBottomNavBar(
      {super.key, required this.onTabChange, required this.cart_size});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        int cartSize = cart.getuserCart().length;

        return CurvedNavigationBar(
          height: 55,
          onTap: (value) => widget.onTabChange(value),
          backgroundColor: Colors.black,
          color: const Color.fromARGB(255, 146, 141, 65),
          animationDuration: const Duration(milliseconds: 300),
          items: [
            const Icon(
              Icons.home,
              color: Colors.white,
            ),
            const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 25,
            ),
            Image.asset(
              'images/BUSHMAN_PICTURES/splash_screen_image.png',
              height: 50,
            ),
            const Icon(
              Icons.person,
              color: Colors.white,
              size: 25,
            ),
          ],
        );
      },
    );
  }
}
