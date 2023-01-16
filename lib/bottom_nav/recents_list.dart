import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/images/s1.png',
  'assets/images/s2.png',
  'assets/images/s3.png',
];

class RecentsList extends StatelessWidget {
  RecentsList({this.icon});
  final icon;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/fundo1.jpg'),
                fit: BoxFit.cover),
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black.withOpacity(.6),
              Colors.black.withOpacity(.6),
            ])),
            child: Padding(
              padding: EdgeInsets.all(40),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    getFullScreenCarousel(context),
                  ])),
            ),
          ),
        )
      ],
    );
  }
}

CarouselSlider getFullScreenCarousel(BuildContext mediaContext) {
  return CarouselSlider(
    height: 350,
    autoPlay: true,
    viewportFraction: 1.0,
    aspectRatio: MediaQuery.of(mediaContext).size.aspectRatio,
    items: imgList.map(
      (url) {
        return Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            child: Image(image: AssetImage(url)),
          ),
        );
      },
    ).toList(),
  );
}
