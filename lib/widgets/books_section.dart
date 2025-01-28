import 'package:bookly/core/models/book_assets.dart';
import 'package:bookly/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BookSection extends StatelessWidget {
  final double height;
  final double viewportFraction;
  final bool enlargeCenterPage;

  const BookSection({
    super.key,
    this.height = 250, // Default height
    this.viewportFraction = 0.6, // Default viewport fraction
    this.enlargeCenterPage = true,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      // The number of items in the carousel is based on the length of the books list
      itemCount: BookAssets.books.length,
      // This function is responsible for building each item in the carousel
      itemBuilder: (context, index, realIndex) {
        // Return a CustomBookCard widget with the corresponding book asset
        return BookCard(
          bookAsset: BookAssets.books[index],
        );
      },
      //=============> Configuration options for the carousel
      options: CarouselOptions(
        height: height, // Sets the height of the carousel
        enableInfiniteScroll: true, // Allows infinite scrolling in a loop
        enlargeCenterPage:
            enlargeCenterPage, // Enlarges the item in the center for a 3D effect
        viewportFraction:
            viewportFraction, // Sets the fraction of the viewport each item occupies
      ),
    );
  }
}
