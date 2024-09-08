import 'package:flutter/material.dart';

class CoffeeItem extends StatelessWidget {
  final String coffeeName;
  final String coffeeImage;

  CoffeeItem({required this.coffeeName, required this.coffeeImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(coffeeImage, width: 50, height: 50), // Display the image
        title: Text(coffeeName),
      ),
    );
  }
}
