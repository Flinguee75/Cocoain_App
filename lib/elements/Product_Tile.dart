import 'package:cocaian/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatelessWidget {
  product Product;
  void Function()? onTap;

  ProductTile({
    super.key,
    required this.Product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      margin: const EdgeInsets.only(left: 25),
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 209, 207, 166),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            child: Container(
              margin: const EdgeInsets.all(12),
              child: Image.asset(Product.imagePath),
            ),
          ),
          Text(
            Product.description,
            style: GoogleFonts.robotoMono(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Product.name,
                      style: GoogleFonts.robotoMono(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${Product.price} FCFA ",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 109, 108, 108),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 146, 141, 65),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
