import 'package:covid19/constant.dart';
import 'package:covid19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/images/s11.png',
  'assets/images/s22.png',
];

class PrevPage extends StatefulWidget {
  static String tag = 'preve-page';
  @override
  _PrevPageState createState() => _PrevPageState();
}

class _PrevPageState extends State<PrevPage> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona1.svg",
              textTop: "Tudo sobre",
              textBottom: "Prevenção",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dicas de Prevenção :",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  getFullScreenCarousel(context),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  PreventCard(
                    title:
                        "1- Lave as mãos com água e sabão ou use álcool em gel",
                  ),
                  PreventCard(
                    title: "2- Cubra o nariz e boca ao espirrar ou tossir",
                  ),
                  PreventCard(
                    title: "3- Evite aglomerações se estiver doente.",
                  ),
                  PreventCard(
                    title: "4- Mantenha os ambientes bem ventilados.",
                  ),
                  PreventCard(
                    title: "5- Evitar contato próximo com animais selvagens ",
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  CarouselSlider getFullScreenCarousel(BuildContext mediaContext) {
    return CarouselSlider(
      height: 70,
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
}

class PreventCard extends StatelessWidget {
  final String title;

  const PreventCard({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 100,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 170,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
