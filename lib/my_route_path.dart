/// It has properties isHome and isDetails to indicate the current route path.
class MyRoutePath {
  final bool isHome;
  final bool isDetails;
  final bool isDetailsId;
  final int? id;

  MyRoutePath.home()
      : isHome = true,
        isDetailsId = false,
        isDetails = false,
        id = 0;

  MyRoutePath.details()
      : isHome = false,
        isDetails = true,
        isDetailsId = false,
        id = 0;

  MyRoutePath.detailsId({this.id})
      : isHome = false,
        isDetails = false,
        isDetailsId = true;

  MyRoutePath.unknown()
      : isHome = false,
        isDetails = false,
        isDetailsId = false,
        id = 0;
}
