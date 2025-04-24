import 'package:flutter/material.dart';
import 'package:cashflow_app/page/pembayaranpage.dart'; // Import PembayaranPage

class PesananPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  PesananPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    // Calculate total amount by summing price * quantity for each item in the cart
    double totalAmount = 0;
    cartItems.forEach((item) {
      totalAmount +=
          item['price'] *
          item['quantity']; // Total amount = price * quantity for each item
    });

    return Scaffold(
      appBar: AppBar(title: Text('Pesanan Saya'), backgroundColor: Colors.teal),
      body: DefaultTabController(
        length: 3, // Length of the tabs
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Upcoming'),
                Tab(text: 'Completed'),
                Tab(text: 'Cancelled'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Upcoming Tab
                  ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      var item = cartItems[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16),
                          leading: Image.asset(
                            item['image'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(item['name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                  Text(item['rating'].toString()),
                                ],
                              ),
                              Text('Rp. ${item['price']}'),
                              Text('x${item['quantity']}'),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Add cancel order functionality here
                                },
                                child: Text('Batalkan'),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Add functionality for proceeding to order
                                },
                                child: Text('Pesan'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // Completed Tab
                  Center(child: Text("No completed orders yet.")),
                  // Cancelled Tab
                  Center(child: Text("No cancelled orders yet.")),
                ],
              ),
            ),
            // Button to proceed to payment
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to PembayaranPage and pass cartItems and totalAmount
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => PembayaranPage(
                            cartItems: cartItems, // Pass cartItems
                            totalAmount: totalAmount, // Pass totalAmount
                          ),
                    ),
                  );
                },
                child: Text('Lanjutkan Pembayaran'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
