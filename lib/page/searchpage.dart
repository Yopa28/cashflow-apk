import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pencarian'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Results
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: 6, // Total items in search
                itemBuilder: (context, index) {
                  return _buildMenuItem(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Search Menu Item
  Widget _buildMenuItem(int index) {
    List<String> names = [
      'Burger',
      'Salad',
      'Kentang Goreng',
      'Ayam Goreng',
      'Es Teh',
      'Milo',
    ];

    List<String> descriptions = [
      'Makanan',
      'Makanan',
      'Makanan',
      'Makanan',
      'Minuman',
      'Minuman',
    ];

    List<double> ratings = [4.9, 4.7, 4.7, 4.8, 4.7, 4.7];

    List<String> images = [
      'assets/burger.png', // Burger
      'assets/salad.png', // Salad
      'assets/fries.png', // Kentang Goreng
      'assets/friedchicken.png', // Ayam Goreng
      'assets/esteh.png', // Es Teh
      'assets/milo.png', // Milo
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image display
          Image.asset(
            images[index],
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),

          // Name and Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              names[index],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              descriptions[index],
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          SizedBox(height: 4),

          // Rating and Add button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 16),
                Text(ratings[index].toString(), style: TextStyle(fontSize: 16)),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.teal),
                  onPressed: () {
                    // Handle add to cart or other actions
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
