import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_card.dart';

class Hotel {
  final String name;
  final String location;
  final int price;
  final String imageUrl;
  final List<String> amenities;
  final int stars;
  Hotel({
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.amenities,
    required this.stars,
  });
}

class HomeContentPage extends StatefulWidget {
  const HomeContentPage({super.key});

  @override
  State<HomeContentPage> createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage> {
  final List<Hotel> allHotels = [
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

    ...List.generate(
      45,
      (i) => Hotel(
        name: 'Hotel ${i + 6}',
        location:
            [
              'New York, New York',
              'Miami, Florida',
              'Chicago, Illinois',
              'Austin, Texas',
              'Seattle, Washington',
              'Portland, Oregon',
              'Las Vegas, Nevada',
              'Orlando, Florida',
              'San Diego, California',
              'Boston, Massachusetts',
              'Dallas, Texas',
              'San Francisco, California',
              'Houston, Texas',
              'Phoenix, Arizona',
              'Philadelphia, Pennsylvania',
              'Atlanta, Georgia',
              'Nashville, Tennessee',
              'Salt Lake City, Utah',
              'Minneapolis, Minnesota',
              'Charlotte, North Carolina',
            ][i % 20],
        price: 60 + (i * 10) % 450,
        imageUrl:
            [
              'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
              'https://images.unsplash.com/photo-1464983953574-0892a716854b',
              'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429',
              'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd',
              'https://cdn.pixabay.com/photo/2015/04/23/22/00/new-year-background-736885_1280.jpg',
            ][i % 5],
        amenities:
            [
              ['WiFi', 'Parking'],
              ['WiFi', 'Breakfast', 'Pool'],
              ['WiFi', 'Parking', 'AC', 'TV'],
              ['WiFi', 'Breakfast', 'Pool', 'Parking', 'Spa', 'AC', 'TV'],
              ['WiFi', 'Pool', 'Spa'],
              ['WiFi', 'Breakfast', 'AC'],
              ['WiFi', 'Parking', 'TV'],
              ['WiFi', 'Breakfast', 'Pool', 'Parking', 'AC', 'TV'],
            ][i % 8],
        stars: 2 + (i % 4),
      ),
    ),
  ];

  String searchText = '';
  String filterLocation = '';
  RangeValues priceRange = const RangeValues(50, 500);
  List<String> selectedAmenities = [];
  int? selectedStars;

  List<Hotel> get filteredHotels {
    return allHotels.where((hotel) {
      final matchesSearch = hotel.name.toLowerCase().contains(
        searchText.toLowerCase(),
      );
      final matchesLocation =
          filterLocation.isEmpty ||
          hotel.location.toLowerCase().contains(filterLocation.toLowerCase());
      final matchesPrice =
          hotel.price >= priceRange.start && hotel.price <= priceRange.end;
      final matchesAmenities =
          selectedAmenities.isEmpty ||
          selectedAmenities.every((a) => hotel.amenities.contains(a));
      final matchesStars =
          selectedStars == null || hotel.stars == selectedStars;
      return matchesSearch &&
          matchesLocation &&
          matchesPrice &&
          matchesAmenities &&
          matchesStars;
    }).toList();
  }

  void openFilterModal() {
    String tempLocation = filterLocation;
    RangeValues tempPrice = priceRange;
    List<String> tempAmenities = List.from(selectedAmenities);
    int? tempStars = selectedStars;
    final amenitiesList = [
      'WiFi',
      'Breakfast',
      'Pool',
      'Parking',
      'Spa',
      'AC',
      'TV',
    ];
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder:
              (context, setModalState) => Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Filter Options',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                filterLocation = '';
                                priceRange = const RangeValues(0, 500);
                                selectedAmenities.clear();
                                selectedStars = null;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('Reset Filters'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Location',
                          prefixIcon: Icon(Icons.location_on_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: TextEditingController.fromValue(
                          TextEditingValue(text: tempLocation),
                        ),
                        onChanged:
                            (val) => setModalState(() => tempLocation = val),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Price Range',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      RangeSlider(
                        min: 50,
                        max: 500,
                        divisions: 9,
                        labels: RangeLabels(
                          '\$${tempPrice.start.toInt()}',
                          '\$${tempPrice.end.toInt()}',
                        ),
                        values: tempPrice,
                        onChanged: (values) {
                          setModalState(() {
                            tempPrice = values;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Min: \$${tempPrice.start.toInt()}'),
                          Text('Max: \$${tempPrice.end.toInt()}'),
                        ],
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Amenities',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Wrap(
                        spacing: 10,
                        children:
                            amenitiesList
                                .map(
                                  (amenity) => FilterChip(
                                    label: Text(amenity),
                                    selected: tempAmenities.contains(amenity),
                                    onSelected:
                                        (selected) => setModalState(() {
                                          if (selected) {
                                            tempAmenities.add(amenity);
                                          } else {
                                            tempAmenities.remove(amenity);
                                          }
                                        }),
                                  ),
                                )
                                .toList(),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Star Rating',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (i) => IconButton(
                            icon: Icon(
                              Icons.star,
                              color:
                                  (tempStars != null && tempStars! > i)
                                      ? Colors.amber
                                      : Colors.grey[400],
                            ),
                            onPressed:
                                () => setModalState(() => tempStars = i + 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              filterLocation = tempLocation;
                              priceRange = tempPrice;
                              selectedAmenities = List.from(tempAmenities);
                              selectedStars = tempStars;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('Apply Filters'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        );
      },
    );
  }

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
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search hotels...',
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                    ),
                    onChanged: (val) => setState(() => searchText = val),
                  ),
                ),
                const SizedBox(width: 10),
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: openFilterModal,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.filter_list, color: Colors.blue[700]),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:
                    filteredHotels.isEmpty
                        ? const Center(child: Text('No hotels found.'))
                        : ListView.builder(
                          itemCount: filteredHotels.length,
                          itemBuilder: (context, index) {
                            final hotel = filteredHotels[index];
                            return CustomCard(hotel: hotel);
                          },
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
