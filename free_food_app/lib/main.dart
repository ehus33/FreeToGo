import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(FreeFoodApp());

class FreeFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Free Food Rescue',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}
