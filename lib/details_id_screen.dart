import 'package:flutter/material.dart';

class DetailsIdScreen extends StatelessWidget {
  final int id;

  const DetailsIdScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Id Screen')),
      body: Center(child: Text('Details Screen for ID: $id')),
    );
  }
}
