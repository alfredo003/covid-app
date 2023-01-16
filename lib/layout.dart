import 'package:flutter/material.dart';

class Layout {
  static int currentIndex = 0;
  static Scaffold getContent(BuildContext context, content) {
    return Scaffold(
      backgroundColor: Layout.primary(),
      body: content,
    );
  }

  static Color primary([double opacity = 1]) =>
      Color.fromRGBO(0, 19, 43, opacity);
  static Color seconder([double opacity = 1]) =>
      Color.fromRGBO(255, 255, 255, opacity);
  static Color light([double opacity = 1]) =>
      Color.fromRGBO(255, 162, 0, opacity);
  static Color select([double opacity = 1]) =>
      Color.fromRGBO(188, 7, 7, opacity);
}
