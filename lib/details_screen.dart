import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  Function(int id) onDetailsIdPressed;

  DetailsScreen({
    Key? key,
    required this.onDetailsIdPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            onDetailsIdPressed(1);
          },
          child: Text('Go to Details Id Screen'),
        ),
      ),
    );
  }
}
