import 'package:cocaian/elements/Product_Tile.dart';
import 'package:cocaian/models/cart.dart';
import 'package:cocaian/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addProductToCart(product Product) {
    Provider.of<Cart>(context, listen: false).addItemToCart(Product);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Le Produit à bien été ajoutée"),
        content: Text("Découvrez le dans votre panier"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "images/MAGAZIN/recolte.png",
          fit: BoxFit.fitHeight,
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 50.0,
            sigmaY: 50.0,
          ),
          blendMode: BlendMode.modulate,
          child: Container(
            color: Colors.transparent,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 25,
                ),
                child: Text(
                  "Produits",
                  style: GoogleFonts.robotoMono(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    product Product = product(
                        name: "FocusPro",
                        description:
                            "Découvrez la puissance de FocusPro, le supplément révolutionnaire conçu pour booster votre concentration. ",
                        price: "10.000",
                        imagePath:
                            "images/BUSHMAN_PICTURES/splash_screen_image.png");
                    return ProductTile(
                      Product: Product,
                      onTap: () => addProductToCart(Product),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
