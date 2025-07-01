import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNav_Bar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNav_Bar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: const [
          Icon(Icons.home),
          // Icon(Icons.manage_search_rounded),
          Icon(Icons.bookmark_add_outlined),
          Icon(Icons.person_3),
        ],
        index: selectedIndex,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: onTap,
      ),
    );
  }
}
