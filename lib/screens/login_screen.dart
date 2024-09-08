import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor, Color(0xFFD2B48C)], // Using the primary color from the theme and tan
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(  // Allow scrolling when keyboard is visible
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Swift Café',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // To contrast the background
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/menu');
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Theme.of(context).indicatorColor // Button background color based on theme
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Sign up'),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor, // Text color
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Privacy Policy'),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor, // Text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
