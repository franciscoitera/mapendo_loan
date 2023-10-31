import 'package:flutter/material.dart';
import 'package:mapendo/screens/app/personalInfo/full_name.dart';
import 'package:page_transition/page_transition.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _firstPage();
  }
}

class _firstPage extends State<FirstPage> {
  Widget myWidget(var title, var value, var width) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 25,
          ),
          Text(title),
          Container(
            width: width,
          ),
          Container(
            height: 40,
            width: 150,
            child: Center(
              child: Text(value),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.white),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(bottom: 90),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/images/gradient.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 120,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Icon(Icons.thumb_up,
                              size: 100, color: Colors.white),
                        )),
                  ),
                  Positioned(
                      // left: 90,
                      top: 210,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text(
                          "Congratulations!",
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        )),
                      )),
                  Positioned(
                      // left: 70,
                      top: 240,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "You have in-principle approval.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ))),
                  Positioned(
                    child:
                        myWidget("Eligible Loan Amount", "Tsh 4120505", 25.0),
                    bottom: 270,
                  ),
                  Positioned(
                    child: myWidget("Loan Period", "2 Months", 70.0),
                    bottom: 220,
                  ),
                  Positioned(
                    child: myWidget("Rate of Interest", "1200.50", 60.0),
                    bottom: 170,
                  ),
                  Positioned(
                    bottom: 80,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Icon(Icons.payments_rounded),
                        )),
                    // left: 120,
                  ),
                  Positioned(
                      bottom: 20,
                      // left: 80,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(05),
                                gradient: LinearGradient(colors: [
                                  Color(0xff29DBB7),
                                  Color(0xff66BBAA)
                                ])),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FullName()));
                              },
//                              color: Color(0xff29DBB7),
                              child: Text("Update Personal Details"),
                            ),
                          )))),
                ],
              ),
            ),
          )),
    );
  }
}
