import 'package:bookly/features/Screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:bookly/features/Screens/explore_screen.dart';
import 'package:bookly/features/Screens/account.dart';
import 'package:bookly/core/models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final User currentUser = User(
    firstName: 'Kareem Kassem',
    profileImageUrl:
        'assets/images/KareemKassem.jpg', // Replace with a valid image path
    role: 'Flutter Developer',
  );

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      const ExploreScreen(),
      const CartScreen(),
      AccountPage(
        onLogOut: (didLogout) {
          if (didLogout) {
            debugPrint('User logged out.');
          }
        },
        user: currentUser,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Explore',
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
                activeIcon: Icon(Icons.shopping_cart),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Account',
                activeIcon: Icon(Icons.account_circle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
