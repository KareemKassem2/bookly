import 'package:bookly/core/constants.dart';
import 'package:bookly/core/models/best_seller_assets.dart';
import 'package:bookly/widgets/animation_section.dart';
import 'package:bookly/widgets/best_seller_section.dart';
import 'package:bookly/widgets/books_section.dart';
import 'package:bookly/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const CustomAppBar(),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Animated Book Section sliding from the top
                const AnimatedSection(
                  beginOffset: Offset(0.0, -1.0), // Slide from the top
                  child: BookSection(),
                ),
                const SizedBox(height: 50),
                // Animated Best Seller Section sliding from the bottom
                AnimatedSection(
                  beginOffset: const Offset(0.0, 1.0), // Slide from the bottom
                  child: BestSellerSection(
                      books: books), // Ensure 'books' is defined
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
