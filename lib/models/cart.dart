import 'package:cocaian/models/product.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<product> productShop = [
    product(
        name: "FocusPrggro",
        description:
            "Découvrez la puissance de FocusPro, le supplément révolutionnaire conçu pour booster votre concentration. ",
        price: "10.000",
        imagePath: "images/BUSHMAN_PICTURES/splash_screen_image.png"),
    product(
        name: "FocusPrro",
        description:
            "Découvrez la puissance de FocusPro, le supplément révolutionnaire conçu pour booster votre concentration. ",
        price: "10.000",
        imagePath: "images/BUSHMAN_PICTURES/splash_screen_image.png"),
    product(
        name: "FocusPrrrrro",
        description:
            "Découvrez la puissance de FocusPro, le supplément révolutionnaire conçu pour booster votre concentration. ",
        price: "10.000",
        imagePath: "images/BUSHMAN_PICTURES/splash_screen_image.png")
  ];

  List<product> userCart = [];

  List<product> getProductList() {
    return productShop;
  }

  List<product> getuserCart() {
    return userCart;
  }

  void addItemToCart(product Product) {
    userCart.add(Product);
    notifyListeners();
  }

  void deleteItemFromCart(product Product) {
    userCart.remove(Product);
    print("Delete");
    notifyListeners();
  }
}
