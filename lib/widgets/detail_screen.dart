import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String name = 'Mountain Lodge';
  final String location = 'Aspen, Colorado';
  final String feature = 'Ski-in/ski-out access';
  final String price = '250/night';
  final String description =
      'A luxurious retreat nestled in the heart of the Rockies, offering stunning views, cozy rooms, and top-notch amenities. Perfect for skiing enthusiasts and nature lovers.';
  final String imageUrl =
      'https://cdn.pixabay.com/photo/2015/04/23/22/00/new-year-background-736885_1280.jpg';
  final List<Map<String, dynamic>> amenities = [
    {'icon': Icons.wifi, 'label': 'Free WiFi'},
    {'icon': Icons.free_breakfast, 'label': 'Breakfast'},
    {'icon': Icons.pool, 'label': 'Pool'},
    {'icon': Icons.local_parking, 'label': 'Parking'},
    {'icon': Icons.spa, 'label': 'Spa'},
    {'icon': Icons.ac_unit, 'label': 'AC'},
    {'icon': Icons.tv, 'label': 'TV'},
  ];

  DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.attach_money, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.blueAccent),
                  SizedBox(width: 4),
                  Text(
                    'Location',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(location),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.info_outline, color: Colors.green),
                  SizedBox(width: 4),
                  Text(
                    'Feature',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(feature),
              const SizedBox(height: 18),
              Text(
                'Description',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
              const SizedBox(height: 18),
              Text(
                'Amenities',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 48,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: amenities.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 18),
                  itemBuilder:
                      (context, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            amenities[index]['icon'],
                            color: Colors.blueGrey,
                            size: 26,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            amenities[index]['label'],
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: const Text('Bookmark Added'),
                                content: const Text(
                                  'This hotel has been added to your bookmarks.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                        );
                      },
                      icon: const Icon(Icons.bookmark_add_outlined),
                      label: const Text('Add Bookmark'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: const Text('Booking Confirmed'),
                                content: const Text(
                                  'Your booking has been confirmed!',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                        );
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text('Book Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
