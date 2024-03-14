import 'package:flutter/material.dart';
import 'package:navigation2/my_router_information_parser.dart';
import 'package:navigation2/router_delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Navigation 2.0 Example',
      routerDelegate: MyRouterDelegate(),
      routeInformationParser: MyRouteInformationParser(),
    );
  }
}







