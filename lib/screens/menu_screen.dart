import 'package:flutter/material.dart';
import '../widgets/coffee_item.dart'; // Make sure this path is correct

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6F4E37), Color(0xFFD2B48C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/order');
              },
              child: CoffeeItem(coffeeName: 'Latte', coffeeImage: 'lib/assets1/latte.jpg'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/order');
              },
              child: CoffeeItem(coffeeName: 'Cappuccino', coffeeImage: 'lib/assets1/cappuccino.jpg'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/order');
              },
              child: CoffeeItem(coffeeName: 'Flat White', coffeeImage: 'lib/assets1/flat_white.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
