import 'package:flutter/material.dart';
import 'bookingdone.dart'; // Import halaman BookingDone.dart
import 'dashboard_page.dart'; // Import DashboardPage untuk navigasi kembali

class PembayaranPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final double totalAmount;

  PembayaranPage({required this.cartItems, required this.totalAmount});

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  // Variable to store the selected payment method
  String? selectedPaymentMethod = 'Cash'; // Default payment method is Cash
  bool saveCard = false; // To store the 'Save Card' checkbox state

  // Controller for card inputs
  final cardHolderNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Calculate total tax
    double tax = widget.totalAmount * 0.1; // Example 10% tax
    double total = widget.totalAmount + tax;

    // Format date (for Booking and Payment dates)
    String bookingDate = "April 28, 2022 10:00 AM";
    String paymentDate = "April 28, 2022";

    return Scaffold(
      appBar: AppBar(
        title: Text('Review Summary'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ringkasan Pesanan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  widget.cartItems.map((item) {
                    return Row(
                      children: [
                        // Item Image
                        Image.asset(
                          item['image'],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16),
                        // Item Details
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'x${item['quantity']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Rp.${item['price']}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    );
                  }).toList(),
            ),
            SizedBox(height: 16),

            // Booking Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Booking Date'), Text(bookingDate)],
            ),
            SizedBox(height: 8),

            // Payment Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Payment'), Text(paymentDate)],
            ),
            SizedBox(height: 16),

            // Amount, Tax and Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Amount'),
                Text('Rp.${widget.totalAmount.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax (10%)'),
                Text('Rp.${tax.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Total'), Text('Rp.${total.toStringAsFixed(2)}')],
            ),
            SizedBox(height: 32),

            // Payment method selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.money, color: Colors.teal),
                    Text(selectedPaymentMethod ?? 'Cash'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),

            // Button to change payment method
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Allow users to change payment method (toggle between options)
                      if (selectedPaymentMethod == 'Cash') {
                        selectedPaymentMethod = 'Credit & Debit Card';
                      } else if (selectedPaymentMethod ==
                          'Credit & Debit Card') {
                        selectedPaymentMethod = 'Debit Card';
                      } else {
                        selectedPaymentMethod = 'Cash';
                      }
                    });
                  },
                  child: Text('Change', style: TextStyle(color: Colors.teal)),
                ),
              ],
            ),
            SizedBox(height: 32),

            // If Credit & Debit Card is selected, show the form to add a card
            if (selectedPaymentMethod == 'Credit & Debit Card' ||
                selectedPaymentMethod == 'Debit Card') ...[
              TextField(
                controller: cardHolderNameController,
                decoration: InputDecoration(
                  labelText: 'Card Holder Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: cvvController,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: saveCard,
                    onChanged: (value) {
                      setState(() {
                        saveCard = value!;
                      });
                    },
                  ),
                  Text('Save Card'),
                ],
              ),
              SizedBox(height: 32),
            ],

            // Continue Button placed at the bottom center with full width
            Center(
              child: SizedBox(
                width: double.infinity, // Make the button full-width
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to BookingDonePage after payment or card addition
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                BookingDonePage(), // Navigate to BookingDonePage
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    selectedPaymentMethod == 'Credit & Debit Card'
                        ? 'Continue with Card'
                        : 'Continue',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
