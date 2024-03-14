import 'package:flutter/material.dart';
import 'package:navigation2/my_route_path.dart';

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return MyRoutePath.home();
    } else if (uri.pathSegments.length == 1 && uri.pathSegments.first == 'details') {
      // Parse additional path segments or query parameters here if needed
      return MyRoutePath.details();
    }

    // Return a default route if the path is not recognized
    return MyRoutePath.home();
  }

  @override
  RouteInformation? restoreRouteInformation(MyRoutePath path) {
    if (path.isHome) {
      return RouteInformation(location: '/');
    } else if (path.isDetails) {
      return RouteInformation(location: '/details');
    }
    return null;
  }
}
