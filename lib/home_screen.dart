import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onDetailsPressed;

  HomeScreen({required this.onDetailsPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: onDetailsPressed,
          child: Text('Go to Details'),
        ),
      ),
    );
  }
}
