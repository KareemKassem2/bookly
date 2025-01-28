// lib/widgets/custom_book_card.dart

import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String bookAsset; // Add a field to hold the book asset

  const BookCard({
    super.key,
    required this.bookAsset, // Require the book asset in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            bookAsset, // Use the passed book asset
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
