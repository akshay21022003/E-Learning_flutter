import 'package:e_learning/ui/cart/cart_screen.dart';
import 'package:e_learning/ui/homepage/home_screen.dart';
import 'package:e_learning/ui/mycourse/my_course_screen.dart';
import 'package:e_learning/ui/wishlist/wishlist_screen.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class FloatingBottomNavigation extends StatefulWidget {
  @override
  _FloatingBottomNavigationState createState() =>
      _FloatingBottomNavigationState();
}
class _FloatingBottomNavigationState extends State<FloatingBottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    MyCourseScreen(),
    WishlistScreen(),
    CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedBackgroundColor: Theme.of(context).colorScheme.inversePrimary,
        unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: (int val) {
          setState(() {
            _currentIndex = val;
          });
        },
        currentIndex: _currentIndex,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.play_circle_fill_rounded, title: 'My Courses'),
          FloatingNavbarItem(icon: Icons.favorite, title: 'Wishlist'),
          FloatingNavbarItem(icon: Icons.shopping_cart, title: 'Cart'),
        ],
      ),
    );
  }
}