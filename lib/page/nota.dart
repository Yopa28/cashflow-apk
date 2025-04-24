import 'package:flutter/material.dart';

class NotaPage extends StatelessWidget {
  final String itemName = 'Burger'; // Nama item yang dipilih
  final double amount = 100000; // Jumlah harga item
  final double tax = 10000; // Pajak 10%
  final double total = 110000; // Total setelah pajak
  final String bookingDate = 'April 28, 2022 10:00 AM';
  final String paymentDate = 'April 28, 2022';
  final String userName = 'Yopa G';
  final String userPhone = '+62 85159280402';
  final String transactionId = '#IRM28949494G455';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-Receipt'), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Image
            Row(
              children: [
                Image.asset(
                  'assets/burger.png', // Ganti dengan path gambar yang sesuai
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'x1',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Rp.${amount.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
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

            // Amount, Tax, and Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Amount'),
                Text('Rp.${amount.toStringAsFixed(2)}'),
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

            // User Information
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Name'), Text(userName)],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Phone Number'), Text(userPhone)],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Transaction ID'), Text(transactionId)],
            ),
            SizedBox(height: 32),

            // Print E-Receipt Button
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Logic for printing the e-receipt or handling the e-receipt action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Print E-Receipt',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
