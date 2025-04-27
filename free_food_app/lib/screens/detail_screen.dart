import 'package:flutter/material.dart';
import 'confirm_screen.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, String> details;

  DetailScreen({required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(details['business']!)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(details['item']!, style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text("Available: ${details['quantity']}"),
            Text("Pickup before: ${details['pickup']}"),
            Text("📍 Address: ${details['address']}"),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Claim This Item"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ConfirmScreen(details: details),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
