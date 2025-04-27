import 'package:flutter/material.dart';
import '../widgets/food_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> dummyData = [
    {
      "business": "Joe’s Bakery",
      "item": "Pastries 🍩",
      "quantity": "5",
      "pickup": "9 PM",
      "address": "123 Main Street"
    },
    {
      "business": "Pizza Palace",
      "item": "Pizza slices 🍕",
      "quantity": "3",
      "pickup": "10 PM",
      "address": "45 Pizza Ave"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Free Food Near You'),
      ),
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (ctx, i) {
          return FoodCard(
            business: dummyData[i]['business']!,
            item: dummyData[i]['item']!,
            quantity: dummyData[i]['quantity']!,
            pickup: dummyData[i]['pickup']!,
            address: dummyData[i]['address']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(details: dummyData[i]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
