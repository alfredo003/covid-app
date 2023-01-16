import 'package:covid19/constant.dart';
import 'package:covid19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransPage extends StatefulWidget {
  static String tag = 'trans-page';
  @override
  _TransPageState createState() => _TransPageState();
}

class _TransPageState extends State<TransPage> {
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
              image: "assets/icons/Drcorona2.svg",
              textTop: "Tudo Sobre",
              textBottom: "Transmissão",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: Text(
                    'O modo de transmissão dos coronavírus humanos comuns acontece das seguintes formas :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(height: 20),
                  PreventCard(
                    title: "1. Transmissão que ocorrer pelo ar",
                  ),
                  PreventCard(
                    title: "2. Por meio de tosse ou espirro",
                  ),
                  PreventCard(
                    title:
                        "3. Contato pessoal próximo, como toque ou aperto de mão",
                  ),
                  PreventCard(
                    title:
                        "4. Contato com objetos ou superfícies contaminadas, seguido então de contato com a boca, nariz ou olhos.",
                  ),
                  Center(
                      child: Text(
                    'O período de incubação dos coronavírus, ou seja, período em que os sintomas surgem desde a infecção no organismo, é de 2 a 14 dias. Já sobre o período de transmissibilidade, de uma forma geral, ocorre apenas enquanto persistirem os sintomas',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
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
        height: 130,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.red,
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
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
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
