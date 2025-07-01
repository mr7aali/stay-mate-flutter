import 'package:flutter/material.dart';
// import 'package:flutter_app/widgets/custom_card.dart';
import '../widgets/home_content_page.dart';
import '../widgets/bookmark_hotel_card.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  List<Hotel> bookmarkedHotels = [
    Hotel(
      name: 'Mountain Lodge',
      location: 'Aspen, Colorado',
      price: 250,
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/23/22/00/new-year-background-736885_1280.jpg',
      amenities: ['WiFi', 'Breakfast', 'Pool', 'Parking', 'Spa', 'AC', 'TV'],
      stars: 5,
    ),
    Hotel(
      name: 'City Center Inn',
      location: 'Denver, Colorado',
      price: 120,
      imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
      amenities: ['WiFi', 'Parking', 'AC', 'TV'],
      stars: 3,
    ),
    Hotel(
      name: 'Beachside Resort',
      location: 'Santa Monica, California',
      price: 320,
      imageUrl: 'https://images.unsplash.com/photo-1464983953574-0892a716854b',
      amenities: ['WiFi', 'Breakfast', 'Pool', 'Parking', 'AC', 'TV'],
      stars: 4,
    ),
    Hotel(
      name: 'Budget Stay',
      location: 'Boulder, Colorado',
      price: 80,
      imageUrl: 'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429',
      amenities: ['WiFi', 'Parking', 'TV'],
      stars: 2,
    ),
    Hotel(
      name: 'Luxury Palace',
      location: 'Beverly Hills, California',
      price: 500,
      imageUrl: 'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd',
      amenities: ['WiFi', 'Breakfast', 'Pool', 'Parking', 'Spa', 'AC', 'TV'],
      stars: 5,
    ),
    Hotel(
      name: 'Urban Escape',
      location: 'New York, New York',
      price: 210,
      imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
      amenities: ['WiFi', 'Breakfast', 'AC'],
      stars: 4,
    ),
    Hotel(
      name: 'Desert Oasis',
      location: 'Phoenix, Arizona',
      price: 180,
      imageUrl: 'https://images.unsplash.com/photo-1464983953574-0892a716854b',
      amenities: ['WiFi', 'Pool', 'Spa'],
      stars: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarked Hotels'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            bookmarkedHotels.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/hotel_not_found.png',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'No bookmarks yet!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Start adding hotels to your bookmarks.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
                : ListView.builder(
                  itemCount: bookmarkedHotels.length,
                  itemBuilder: (context, index) {
                    final hotel = bookmarkedHotels[index];
                    return Dismissible(
                      key: ValueKey(hotel.name),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          bookmarkedHotels.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          height: 90,
                          width: double.infinity,
                          child: BookmarkHotelCard(hotel: hotel),
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
