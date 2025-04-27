import 'package:flutter/material.dart';

class ConfirmScreen extends StatelessWidget {
  final Map<String, String> details;

  ConfirmScreen({required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirmed!")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.check_circle, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text("Claimed: ${details['item']} at ${details['business']}"),
            Text("Pickup before: ${details['pickup']}"),
            Text("📍 ${details['address']}"),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Done"),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
