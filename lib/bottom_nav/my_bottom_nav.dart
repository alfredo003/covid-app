import 'package:flutter/material.dart';
import 'package:covid19/bottom_nav/favorites_list.dart';
import 'package:covid19/bottom_nav/recents_list.dart';
import 'package:covid19/bottom_nav/contacts.dart';
import 'package:covid19/layout.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<String> _contents = <String>['HOME', 'COVID-19', 'SOBRE'];

class MyBottomNav extends StatefulWidget {
  static String tag = 'MyBottomNav-page';

  @override
  MyBottomNavState createState() {
    return new MyBottomNavState();
  }
}

class MyBottomNavState extends State<MyBottomNav> {
  int _currentIndex = 0;

  _onTapItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _myBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      fixedColor: Colors.white,
      unselectedItemColor: Colors.white54,
      backgroundColor: Layout.primary(),
      iconSize: 20,
      selectedFontSize: 10,
      unselectedFontSize: 9,
      onTap: _onTapItem,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(_contents[0]),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/virus.svg",
            width: 27,
          ),
          title: Text(_contents[1]),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.live_help),
          title: Text(_contents[2]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.dialpad),
        tooltip: 'Dialer pad',
      ),*/
      body: BottomNavContents(
        index: _currentIndex,
      ),
      bottomNavigationBar: _myBottomNavBar(),
    );
  }
}

class BottomNavContents extends StatelessWidget {
  BottomNavContents({this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: navBarContents(index, context),
      ),
    );
  }

  Widget navBarContents(int index, BuildContext context) {
    switch (index) {
      case 1:
        return FavoritesList();
      case 0:
        return RecentsList(
          icon: Icons.call,
        );
      case 2:
        return Contacts();
      default:
        return Container();
    }
  }
}
