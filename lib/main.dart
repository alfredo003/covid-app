import 'package:flutter/material.dart';
import 'pages/coro.dart';
import 'layout.dart';
import 'pages/prevencao.dart';
import 'pages/sintomas.dart';
import 'pages/transmicao.dart';
import 'package:covid19/bottom_nav/my_bottom_nav.dart';

void main() => runApp(Covid());

class Covid extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    InfoScreen.tag: (context) => InfoScreen(),
    PrevPage.tag: (context) => PrevPage(),
    SintoPage.tag: (context) => SintoPage(),
    TransPage.tag: (context) => TransPage(),
    MyBottomNav.tag: (context) => MyBottomNav(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Layout.primary(),
        primaryColorDark: Layout.primary(),
        accentColor: Layout.seconder(),
        textTheme: TextTheme(
            headline: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            title: TextStyle(
                fontSize: 36,
                fontStyle: FontStyle.italic,
                color: Colors.blueGrey),
            body1: TextStyle(fontSize: 14)),
      ),
      home: MyBottomNav(),
      routes: routes,
    );
  }
}
