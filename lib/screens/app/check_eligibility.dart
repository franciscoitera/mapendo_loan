import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'form/form1.dart';

class CheckEligibility extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _checkEligibility();
  }
}

class _checkEligibility extends State<CheckEligibility> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 20,
            ),
            const Icon(Icons.money_rounded),
            Container(
              height: 50,
            ),
            const AutoSizeText(
              "Select Profession",
              style: TextStyle(
                  color: const Color.fromARGB(255, 16, 124, 72),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FormBrand()));
                    },
                    child: Image.asset(
                      "assets/images/emergence.png",
                      height: 50,
                    ),
                  ),
                  Container(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FormBrand()));
                    },
                    child: Image.asset(
                      "assets/images/emergence.png",
                      height: 50,
                    ),
                  ),
                  Container(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FormBrand()));
                    },
                    child: Image.asset(
                      "assets/images/emergence.png",
                      height: 50,
                    ),
                  ),
                  Container(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FormBrand()));
                    },
                    child: Image.asset(
                      "assets/images/emergence.png",
                      height: 50,
                    ),
                  ),
                  Container(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FormBrand()));
                    },
                    child: Image.asset(
                      "assets/images/emergence.png",
                      height: 50,
                    ),
                  ),
                  Container(
                    width: 15,
                  ),
                ],
              ),
            ),
            Container(
              height: 15,
            ),
          ],
        ),
      )),
    );
  }
}
