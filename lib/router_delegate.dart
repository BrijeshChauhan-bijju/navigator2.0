import 'package:flutter/material.dart';
import 'package:navigation2/deep_linking_handler.dart';
import 'package:navigation2/details_id_screen.dart';
import 'package:navigation2/details_screen.dart';
import 'package:navigation2/my_route_path.dart';

/// Manages the navigation stack and controls the rendering of pages.
class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  MyRoutePath _currentPath = MyRoutePath.home();

  @override
  MyRoutePath get currentConfiguration => _currentPath;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
            child: DeepLinkHandler(onDetailsPressed: _handleDetailsPressed)),
        if (_currentPath.isDetails)
          MaterialPage(
            child: DetailsScreen(onDetailsIdPressed: _handleDetailsIDPressed),
          ),
        if (_currentPath.isDetailsId)
          MaterialPage(
            child: DetailsIdScreen(
              id: _currentPath.id??0,
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        // Check if the current page is DetailsIdScreen
        if (_currentPath.isDetailsId) {
          // If popped from DetailsIdScreen, navigate back to DetailsScreen
          _currentPath = MyRoutePath.details();
          notifyListeners();
          return true;
        }
        print("3=====>");
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

  void _handleDetailsIDPressed(int id) {
    print("2rfefjherjhfrbfrfr");
    _currentPath = MyRoutePath.detailsId(id:id);
    notifyListeners();
  }
}
