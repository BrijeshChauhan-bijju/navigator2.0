import 'package:flutter/material.dart';
import 'package:navigation2/details_screen.dart';
import 'package:navigation2/home_screen.dart';
import 'package:navigation2/my_route_path.dart';

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  MyRoutePath _currentPath = MyRoutePath.home();

  @override
  MyRoutePath get currentConfiguration => _currentPath;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: HomeScreen(
            onDetailsPressed: _handleDetailsPressed,
          ),
        ),
        if (_currentPath.isDetails) MaterialPage(child: DetailsScreen()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _currentPath = MyRoutePath.home();
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MyRoutePath path) async {
    _currentPath = path;
  }

  void _handleDetailsPressed() {
    _currentPath = MyRoutePath.details();
    notifyListeners();
  }
}
