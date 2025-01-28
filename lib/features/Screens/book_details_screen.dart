import 'package:bookly/core/models/best_seller_assets.dart';
import 'package:bookly/features/Screens/cart_screen.dart';
import 'package:bookly/widgets/book_actions.dart';
import 'package:bookly/widgets/books_section.dart';
import 'package:flutter/material.dart';
import 'package:bookly/widgets/floating_snack_bar.dart'; // Import the FloatingSnackBar class

class BookDetailsScreen extends StatefulWidget {
  final BestSellerAssets book;

  const BookDetailsScreen({super.key, required this.book});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                // Navigate to the CartScreen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Book Cover Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    widget.book.imageUrl,
                    fit: BoxFit.cover,
                    height: 250.0,
                  ),
                ),
                const SizedBox(height: 16.0),

                // Book Title
                Text(
                  widget.book.title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8.0),

                // Author Name
                Text(
                  widget.book.authorName,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Rating
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16.0,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      widget.book.rate,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      '(${widget.book.reviewCount})',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 25.0),

                    // Price
                    Text(
                      '\$${widget.book.price}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 37.0),

                // Book Actions (Buy Now, Free Preview buttons)
                BookActions(
                  book: widget.book,
                  onBuyNowPressed: () {
                    // Show the floating SnackBar when Buy Now is pressed
                    FloatingSnackBar.show(
                      context,
                      'Added ${widget.book.title} to the cart!',
                    );
                  },
                ),

                const SizedBox(height: 37.0),

                // You may also like Section
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You may also like',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                // Books Section (Carousel)
                const BookSection(
                  height: 200.0,
                  viewportFraction: 0.5,
                  enlargeCenterPage: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
