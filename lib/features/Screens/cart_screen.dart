import 'package:bookly/core/constants.dart';
import 'package:bookly/core/models/cart_model.dart'; // Import your CartModel
import 'package:bookly/core/models/best_seller_assets.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<BestSellerAssets> cartItems = CartModel.getCartItems(); // Get cart items

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index); // Update the local cart items
      CartModel.removeFromCart(index); // Call CartModel to remove item
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: cartItems.isEmpty
            ? const Center(
                child: Text('Your cart is empty'),
              )
            : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final book = cartItems[index];
                  return ListTile(
                    leading: Image.asset(book.imageUrl),
                    title: Text(book.title),
                    subtitle: Text('by ${book.authorName}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('\$${book.price}'),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => _removeItem(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 50.0,
          child: ElevatedButton(
            onPressed: cartItems.isEmpty
                ? null
                : () {
                    // Submit the order
                    CartModel.submitOrder();
                    setState(() {
                      cartItems
                          .clear(); // Clear the cart after order submission
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Order submitted successfully'),
                      ),
                    );
                  },
            child: const Text('Submit Order'),
          ),
        ),
      ),
    );
  }
}
