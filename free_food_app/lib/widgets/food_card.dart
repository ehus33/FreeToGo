import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String business, item, quantity, pickup, address;
  final VoidCallback onTap;

  FoodCard({
    required this.business,
    required this.item,
    required this.quantity,
    required this.pickup,
    required this.address,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(child: Text(item[0])),
        title: Text("$business - $item"),
        subtitle: Text("Pickup by $pickup • $quantity available"),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
