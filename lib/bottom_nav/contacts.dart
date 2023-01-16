import 'package:flutter/material.dart';
import 'package:covid19/layout.dart';

class Contacts extends StatelessWidget {
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
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.8),
            ])),
            child: Padding(
              padding: EdgeInsets.all(40),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                    Center(
                        child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 200,
                    )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'O covid-19.app é uma iniciativa da Startup TIMO e o Governo Provincial do Namibe, isso com o objectivo de fomentar o conhecimento sobre a pandemia do coronavírus de modo a erradicar esse vírus.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      'Apoio :',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Image(
                      image: AssetImage('assets/images/logo1.png'),
                      width: 200,
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Text(
                      'Desenvolvedor :',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: Image(
                      image: AssetImage('assets/images/logo3.png'),
                      width: 100,
                    )),
                    SizedBox(
                      height: 20,
                    ),
                  ])),
            ),
          ),
        )
      ],
    );
  }
}
