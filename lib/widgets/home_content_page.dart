import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_card.dart';

class HomeContentPage extends StatelessWidget {
  const HomeContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Accommodation Recommendations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) => CustomCard(index: index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
