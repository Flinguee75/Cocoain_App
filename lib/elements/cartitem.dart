import 'package:cocaian/models/cart.dart';
import 'package:cocaian/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  product Product;
  CartItem({super.key, required this.Product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart(product) {
    Provider.of<Cart>(context, listen: false).deleteItemFromCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        int cartSize = cart.getuserCart().length;
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          padding: const EdgeInsets.all(5),
          child: ListTile(
            leading: Image.asset(widget.Product.imagePath),
            title: Text(widget.Product.name),
            subtitle: Text(widget.Product.price),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {});
                removeItemFromCart(widget.Product);
              },
            ),
          ),
        );
      },
    );
  }
}
