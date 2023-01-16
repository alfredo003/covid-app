import 'dart:math';

import 'package:flutter/material.dart';
import 'package:covid19/pages/prevencao.dart';
import 'package:covid19/pages/sintomas.dart';
import 'package:covid19/pages/transmicao.dart';
import 'package:covid19/pages/coro.dart';
import 'package:covid19/layout.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritesList extends StatelessWidget {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: CustomPaint(
              child: Container(
                height: size.height / 2,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  createGridItem(0),
                  createGridItem(1),
                  createGridItem(2),
                  createGridItem(3),
                  createGridItem(4),
                  createGridItem(5),
                  createGridItem(6),
                  createGridItem(7),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createGridItem(int position) {
    var color = Colors.white;
    var icondata = Icons.add;
    var titulo = ' ';

    switch (position) {
      case 0:
        color = Colors.cyan;
        icondata = Icons.blur_on;
        titulo = 'Coronavírus';
        break;
      case 1:
        color = Colors.deepPurple;
        titulo = 'Prevenção';
        icondata = Icons.favorite;
        break;
      case 2:
        color = Colors.orange[300];
        icondata = Icons.library_books;
        titulo = 'Sintomas';
        break;
      case 3:
        color = Colors.pinkAccent;
        icondata = Icons.local_hospital;
        titulo = 'Transmissão';
        break;
      case 4:
        color = Colors.teal[900];
        icondata = Icons.supervised_user_circle;
        titulo = 'Covid-Angola';
        break;
      case 5:
        color = Colors.red[600];
        icondata = Icons.phone;
        titulo = 'Emergência';
        break;
      case 6:
        color = Colors.blue;
        icondata = Icons.language;
        titulo = 'www.gpn.ao';
        break;
      case 7:
        color = Colors.transparent;

        break;
    }

    return Builder(builder: (context) {
      return Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
        child: Card(
          elevation: 10,
          color: Layout.primary(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(1)),
            side: BorderSide(color: Layout.primary()),
          ),
          child: InkWell(
            onTap: () {
              if ('$position' == '0') {
                Navigator.of(context).pushNamed(InfoScreen.tag);
              } else if ('$position' == '1') {
                Navigator.of(context).pushNamed(PrevPage.tag);
              } else if ('$position' == '2') {
                Navigator.of(context).pushNamed(SintoPage.tag);
              } else if ('$position' == '3') {
                Navigator.of(context).pushNamed(TransPage.tag);
              } else if ('$position' == '4') {
                String url = "http://www.covid19.gov.ao";
                canLaunch(url).then((bool status) {
                  if (status) {
                    launch(url);
                  }
                });
              } else if ('$position' == '5') {
                _callContact(String phone) async {
                  String tel = "tel: $phone";
                  if (await canLaunch(tel)) {
                    await launch(tel);
                  }
                }

                _callContact('931101057');
              } else if ('$position' == '6') {
                String url = "http://www.gpn.ao";
                canLaunch(url).then((bool status) {
                  if (status) {
                    launch(url);
                  }
                });
              }
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    icondata,
                    size: 40,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      titulo,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
      ;
    });
  }
}
