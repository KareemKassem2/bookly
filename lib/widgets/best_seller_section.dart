import 'package:bookly/core/models/best_seller_assets.dart';
import 'package:flutter/material.dart';
import 'best_seller_card.dart'; // Import the BestSellerCard widget

class BestSellerSection extends StatelessWidget {
  final List<BestSellerAssets> books;
  final String title;

  const BestSellerSection(
      {super.key, required this.books, this.title = 'Best Sellers'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 720) {
                return Column(
                  children: books
                      .map((book) => _buildGridItem(context, book))
                      .toList(),
                );
              } else {
                return _buildGridView(
                    2); // Adjust the number of columns as needed
              }
            },
          ),
        ],
      ),
    );
  }

  GridView _buildGridView(int columns) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3, // Adjusted aspect ratio for better fit
        crossAxisCount: columns,
      ),
      itemBuilder: (context, index) => _buildGridItem(context, books[index]),
      itemCount: books.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildGridItem(BuildContext context, BestSellerAssets book) {
    return BestSellerCard(book: book);
  }
}
