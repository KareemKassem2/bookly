import 'package:bookly/core/models/best_seller_assets.dart';
import 'package:bookly/widgets/book_actions_button.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/models/cart_model.dart'; // Assuming you have a CartModel

class BookActions extends StatelessWidget {
  final BestSellerAssets book;
  final VoidCallback onBuyNowPressed; // Add the callback

  const BookActions({
    super.key,
    required this.book,
    required this.onBuyNowPressed, // Initialize the callback
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: BookActionButton(
              text: 'Add to Cart',
              backgroundColor: Colors.white,
              textColor: const Color(0xFF000000),
              onPressed: () {
                // Add the book to the cart first
                CartModel.addToCart(book);
                // Show the SnackBar
                onBuyNowPressed(); // This triggers the SnackBar
              },
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),
            ),
          ),
          Expanded(
            child: BookActionButton(
              text: 'Free Preview',
              backgroundColor: Colors.orange,
              textColor: Colors.white,
              onPressed: () {},
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
