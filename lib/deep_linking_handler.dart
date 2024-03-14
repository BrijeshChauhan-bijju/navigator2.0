import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation2/my_route_path.dart';
import 'package:navigation2/router_delegate.dart';
import 'package:uni_links/uni_links.dart';

class DeepLinkHandler extends StatefulWidget {
  VoidCallback onDetailsPressed;

  DeepLinkHandler({required this.onDetailsPressed}) : super();

  @override
  _DeepLinkHandlerState createState() => _DeepLinkHandlerState(onDetailsPressed:onDetailsPressed);
}

class _DeepLinkHandlerState extends State<DeepLinkHandler> {
  StreamSubscription? _sub;
  VoidCallback? onDetailsPressed;

  _DeepLinkHandlerState({required this.onDetailsPressed});

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> initUniLinks() async {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null && !mounted) return;
      handleDeepLink(uri);
    }, onError: (dynamic err) {
      print('Error receiving uri: $err');
    });

    try {
      final initialUri = await getInitialUri();
      handleDeepLink(initialUri);
    } on PlatformException {
      print('Failed to get initial uri');
    }
  }

  void handleDeepLink(Uri? uri) {
    if (uri != null && uri.pathSegments.isNotEmpty) {
      final route = uri.pathSegments.first;
      if (route == 'details') {
        int id = int.tryParse(uri.pathSegments.elementAt(1)) ?? 0;
        MyRouterDelegate().setNewRoutePath(MyRoutePath.details());
      }
    }
  }

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
