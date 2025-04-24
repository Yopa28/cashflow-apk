import 'package:flutter/material.dart';
import 'package:cashflow_app/page/makananpage.dart';
import 'package:cashflow_app/page/minumanpage.dart';
import 'package:cashflow_app/page/pesananpage.dart'; // Import PesananPage

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String selectedCategory = 'Rekomendasi';

  // Data keranjang yang akan menyimpan item yang dimasukkan
  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hai, Sandy Yopa Boangmanalu'),
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false, // Menghapus tombol back
        actions: [
          // Profile Icon
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to Profile page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cari menu
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari menu favoritmu',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                ),
                onChanged: (text) {
                  // Add search functionality here
                },
              ),
            ),
            SizedBox(height: 20),

            // Menu Category Tabs
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: [
                _buildCategoryButton('Rekomendasi'),
                _buildCategoryButton('Makanan'),
                _buildCategoryButton('Minuman'), // Add Minuman category button
              ],
            ),
            SizedBox(height: 20),

            // Section Title
            Text(
              'Terfavorit',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Menu Items Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildMenuItem(index);
                },
              ),
            ),
          ],
        ),
      ),

      // Keranjang di bawah layar, dengan posisi di tengah
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the PesananPage and pass the cartItems
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PesananPage(cartItems: cartItems),
            ),
          );
        },
        backgroundColor: Colors.teal.withOpacity(0.8),
        icon: Icon(Icons.shopping_cart, size: 28),
        label: Text(
          'Keranjang (${cartItems.length})',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  // Category Button
  Widget _buildCategoryButton(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategory = label;
          });

          // Perbarui bagian onPressed pada kategori Makanan dan Minuman di DashboardPage
          if (label == 'Makanan') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => MakananPage(
                      addToCart: addToCart,
                    ), // Menyertakan fungsi addToCart
              ),
            );
          }

          if (label == 'Minuman') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => MinumanPage(
                      addToCart: addToCart,
                    ), // Menyertakan fungsi addToCart
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              selectedCategory == label ? Colors.teal : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selectedCategory == label ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  // Function to add item to cart with quantity check
  void addToCart(Map<String, dynamic> item) {
    setState(() {
      // Check if item already exists in the cart
      bool itemExists = false;
      for (var cartItem in cartItems) {
        if (cartItem['name'] == item['name']) {
          cartItem['quantity'] += 1; // If item exists, increase the quantity
          itemExists = true;
          break;
        }
      }

      if (!itemExists) {
        cartItems.add(item); // If item doesn't exist, add it to the cart
      }
    });
  }

  // Menu Item
  Widget _buildMenuItem(int index) {
    List<String> names = [
      'Cheeseburger',
      'Ayam Goreng',
      'Ice Cream',
      'Ice Milo',
    ];

    List<String> descriptions = [
      'Wendy\'s Burger',
      'Ayam Goreng Crispy',
      'Es Cream Gacor',
      'Es Milo',
    ];

    List<double> ratings = [4.8, 4.8, 4.7, 4.7];

    List<String> images = [
      'assets/burger.png',
      'assets/ayam.png',
      'assets/mcflurry.jpg',
      'assets/milo.png',
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image display with custom height and width
          Image.asset(
            images[index],
            height: 120, // Custom height for the image
            width: double.infinity, // Full width
            fit: BoxFit.cover, // Ensure image covers the area
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
        ],
      ),
    );
  }
}
