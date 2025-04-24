import 'package:flutter/material.dart';

class MinumanPage extends StatelessWidget {
  final Function addToCart; // Declare addToCart as a named parameter

  // Accept addToCart function as a parameter in the constructor
  MinumanPage({required this.addToCart});

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      'Es Teh',
      'Kopi',
      'Coca Cola',
      'Fruit Tea',
      'Es Krim',
      'Milo',
    ];

    List<String> descriptions = [
      'Es Teh Manis',
      'Kopi Favorit',
      'Minuman Segar',
      'Fruit Tea',
      'Es Krim Lezat',
      'Minuman Segar Milo',
    ];

    List<double> ratings = [4.8, 4.9, 4.7, 4.8, 4.7, 4.7];

    List<String> images = [
      'assets/esteh.png',
      'assets/cofee.jpg',
      'assets/cocacola.png',
      'assets/fruittea.png',
      'assets/mcflurry.jpg',
      'assets/milo.png',
    ];

    // Harga untuk masing-masing minuman
    List<int> prices = [
      8000, // Harga untuk Es Teh
      30000, // Harga untuk Kopi
      30000, // Harga untuk Coca Cola
      8000, // Harga untuk Fruit Tea
      10000, // Harga untuk Es Krim
      15000, // Harga untuk Milo
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Minuman'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image display with custom height and width
                  Image.asset(
                    images[index],
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      names[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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

                  // Rating and price
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        Text(
                          ratings[index].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // Harga dan tombol tambah
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'Rp. ${prices[index].toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.teal),
                          onPressed: () {
                            // Add to cart when the button is pressed
                            Map<String, dynamic> item = {
                              'name': names[index],
                              'description': descriptions[index],
                              'rating': ratings[index],
                              'image': images[index],
                              'quantity': 1,
                              'price': prices[index], // Use price for the item
                            };
                            addToCart(
                              item,
                            ); // Use the addToCart function passed from DashboardPage
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
