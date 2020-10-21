import 'package:flutter/material.dart';
import 'package:fluttertest/widgets/pages/AlbumView/AlbumView.dart';
import 'package:fluttertest/widgets/pages/AlbumsList/AlbumsList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/') return albumsList(settings);
        if (settings.name == '/album') return albumView(settings);

        // return MaterialPageRoute(builder: (context) => ());
      },
    );
  }

  PageRouteBuilder albumsList(settings) {
    return PageRouteBuilder(
      pageBuilder: (context, __, ___) => AlbumsList(),
      settings: settings,
      transitionsBuilder: (_, anim, __, child) => _slideLeft(anim, child),
    );
  }

  PageRouteBuilder albumView(settings) {
    return PageRouteBuilder(
      pageBuilder: (context, __, ___) => AlbumView(),
      settings: settings,
      transitionsBuilder: (_, anim, __, child) => _slideLeft(anim, child),
    );
  }

  SlideTransition _slideLeft(Animation<double> anim, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
          .animate(anim),
      child: child,
    );
  }
}
