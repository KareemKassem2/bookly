import 'package:bookly/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/models/best_seller_assets.dart';
import 'package:bookly/features/Screens/book_details_screen.dart';
import 'package:bookly/features/Screens/explore_screen.dart';
import 'package:bookly/features/Screens/login.dart';
import 'package:bookly/features/Screens/search_screen.dart';
import 'package:bookly/features/Screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

/// Abstract Router Class
abstract class AppRouter {
  static const khome = '/home';
  static const kBookDetailsScreen = '/book-details';
  static const kSearch = '/search';
  static const kLogin = '/login';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: khome,
        builder: (context, state) => const ExploreScreen(),
      ),
      GoRoute(
        path: kBookDetailsScreen,
        builder: (context, state) {
          if (state.extra is! BestSellerAssets) {
            return const Scaffold(
              body: Center(child: Text('Book data not found!')),
            );
          }
          final book = state.extra as BestSellerAssets;
          return BookDetailsScreen(book: book);
        },
      ),
      GoRoute(
        path: kSearch,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => LoginScreen(
          onLogIn: (credentials) {
            // Implement your login logic here.
            debugPrint(
                'User: ${credentials.username}, Password: ${credentials.password}');
          },
        ),
      ),
      GoRoute(
        path: kHomePage,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );

  static var kHomePage = '/homePage';
}
