import 'package:cocaian/elements/cartitem.dart';
import 'package:cocaian/models/cart.dart';
import 'package:cocaian/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        int cartSize = value.getuserCart().length;

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
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
            backgroundColor: Colors.black,
            title: Image.asset(
              'images/BUSHMAN_PICTURES/COCOAIAN1.png',
              width: 190,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mon Panier",
                  style: GoogleFonts.robotoMono(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.getuserCart().length,
                    itemBuilder: (context, index) {
                      product Product = value.getuserCart()[index];
                      return CartItem(Product: Product);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
