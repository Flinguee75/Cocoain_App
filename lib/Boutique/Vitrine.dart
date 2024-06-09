import 'dart:async';

import 'package:cocaian/Boutique/cart_page.dart';
import 'package:cocaian/Boutique/shop_page.dart';
import 'package:cocaian/elements/MyBottomNavBar.dart';
import 'package:cocaian/elements/drawer.dart';
import 'package:cocaian/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selected_index = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  final done = Completer<void>();
  @override
  void initState() {
    super.initState();
    // Initialize cart size
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        int cartSize = cart.getuserCart().length;
        return Scaffold(
          backgroundColor: Colors.black,
          drawer: MyDrawer(
            onuserfunction: () {},
            logoutfunction: () {},
          ),
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            actions: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                child: badges.Badge(
                  showBadge: cartSize != 0,
                  badgeContent: Text(
                    '$cartSize',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  badgeAnimation: const badges.BadgeAnimation.rotation(
                    animationDuration: Duration(milliseconds: 500),
                  ),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const CartPage(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white.withOpacity(0),
            shadowColor: const Color(0xFFEDECF2),
            title: Image.asset(
              'images/BUSHMAN_PICTURES/COCOAIAN1.png',
              width: 190,
            ),
          ),
          body: Consumer<Cart>(
            builder: (context, cart, child) {
              return _pages[_selected_index];
            },
          ),
          bottomNavigationBar: MyBottomNavBar(
              onTabChange: (index) => navigateBottomBar(index),
              cart_size: Provider.of<Cart>(context, listen: false)
                  .getuserCart()
                  .length),
        )
            .animate(onComplete: (_) => done.complete())
            .fadeIn(duration: 400.ms)
            .then()
            .fadeIn();
      },
    );
  }
}
