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
