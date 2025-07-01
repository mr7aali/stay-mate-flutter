import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name = 'Mountain Lodge';
  final String location = 'Aspen, Colorado';
  final String feature = 'Ski-in/ski-out access';
  final String price = '250/night';

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.blueAccent),
                SizedBox(width: 4),
                Text('Location', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Text(location),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.info_outline, color: Colors.green),
                SizedBox(width: 4),
                Text('Feature', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Text(feature),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.attach_money, color: Colors.orange),
                SizedBox(width: 4),
                Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Text(price),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
