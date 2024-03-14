import 'package:flutter/material.dart';
import 'package:navigation2/my_route_path.dart';

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return MyRoutePath.home();
    } else if (uri.pathSegments.first == 'details') {
      final id = int.tryParse(uri.pathSegments.elementAt(1) ?? '') ?? 0;
      return MyRoutePath.details();
    } else {
      return MyRoutePath.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(MyRoutePath configuration) {
    if (configuration.isHome) {
      return RouteInformation(location: '/');
    } else if (configuration.isDetails) {
      return RouteInformation(location: '/details');
    } else {
      return null;
    }
  }
}
