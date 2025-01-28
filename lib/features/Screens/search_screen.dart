import 'package:bookly/core/models/best_seller_assets.dart';
import 'package:bookly/widgets/best_seller_section.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1534),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for books',
            hintStyle: TextStyle(
              color: Colors.grey[400],
            ),
            border: InputBorder.none,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            BestSellerSection(
              books: books,
              title: '  Search Results',
            )
          ],
        ),
      ),
    );
  }
}
