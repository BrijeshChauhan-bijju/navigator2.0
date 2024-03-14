class MyRoutePath {
  final bool isHome;
  final bool isDetails;

  MyRoutePath.home() : isHome = true, isDetails = false;

  MyRoutePath.details() : isHome = false, isDetails = true;
}
