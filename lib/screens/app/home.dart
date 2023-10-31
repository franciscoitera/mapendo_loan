import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mapendo/screens/app/application.dart';
import 'package:mapendo/screens/app/check_eligibility.dart';
import 'package:mapendo/screens/app/leads.dart';
import 'package:mapendo/screens/app/profile_page.dart';
import 'package:page_transition/page_transition.dart';

import 'bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homePage();
  }
}

// ignore: camel_case_types
class _homePage extends State<HomePage> {
  double _value = 0.0;
  void _setvalue(double value) => setState(() => _value = value);
  var currentSelectedValue;
  var deviceTypes = [
    "5 years",
    "10 years",
  ];
  void loanRequirementSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.81,
            decoration: const BoxDecoration(
              color: Color(0xffEBEBEB),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 8,
                  width: 100,
                  color: Colors.grey,
                ),
                Container(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: const BoxDecoration(
                    color: Color(0xff02314B),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          "Loan Requirement",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 0),
                        child: Text(
                          "IDR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          "${(_value * 5120800).round()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 0),
                          child:
                              new Slider(value: _value, onChanged: _setvalue)),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Rp.1m",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              "Rp.500m",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListTile(
                            title: const Text(
                              "For Period Of",
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: const Text("Select"),
                                value: currentSelectedValue,
                                isDense: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    currentSelectedValue = newValue;
                                  });
                                  print(currentSelectedValue);
                                },
                                items: deviceTypes.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListTile(
                              title: const Text(
                                "At interest rate",
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: MaterialButton(
                                color: Colors.white54,
                                minWidth: 120,
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "${(_value * 15).round()}%",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListTile(
                              title: const Text(
                                "Monthly Installment",
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: MaterialButton(
                                color: Colors.white54,
                                minWidth: 120,
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "Rp. ${(_value * 51208000).round()}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))),
                      Container(
                        height: 20,
                      ),
                      MaterialButton(
                        minWidth: 200,
                        color: const Color(0xff29DBB7),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckEligibility()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: const Text("Check Eligibility"),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }

  // ignore: unused_field
  var _selectedLocation = "A";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: const Color(0xffEBF1F3),
        body: SafeArea(
          child: Container(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 16, 124, 72),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              children: <Widget>[
                                AutoSizeText(
                                  "Hello Alex",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.white,
                                      fontSize: 26),
                                ),
                                AutoSizeText(
                                  "February 2020",
                                  style: TextStyle(
                                      fontFamily: "RobotoConsode",
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.scale,
                                      alignment: Alignment.bottomRight,
                                      child: ProfilePage()));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ProfilePage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "assets/images/user.png")))),
                            ),
                          ),
                        ],
                      )),
                      Container(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.scale,
                                          alignment: Alignment.bottomRight,
                                          child: LeadsPage()));
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => LeadsPage()));
                                },
                                child: Container(
                                  // ignore: sort_child_properties_last
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const AutoSizeText(
                                        "History",
                                        style: TextStyle(
                                            fontFamily: "RobotoConsode",
                                            color: Colors.black,
                                            fontSize: 16),
                                      ),
                                      Container(
                                        height: 5,
                                      ),
                                      const AutoSizeText(
                                        "25",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 1, 207, 107)),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.topToBottom,
                                          child: ApplicationPage()));
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             ApplicationPage()));
                                },
                                child: Container(
                                  // ignore: sort_child_properties_last
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const AutoSizeText(
                                        "Applications",
                                        style: TextStyle(
                                            fontFamily: "RobotoConsode",
                                            color: Colors.black,
                                            fontSize: 12),
                                      ),
                                      Container(
                                        height: 5,
                                      ),
                                      const AutoSizeText(
                                        "15",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 1, 207, 107)),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 1, 207, 107)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const AutoSizeText(
                                      "Loans",
                                      style: TextStyle(
                                          fontFamily: "RobotoConsode",
                                          color: Colors.black,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      height: 5,
                                    ),
                                    const AutoSizeText(
                                      "12",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                ),
                Container(
                  // ignore: sort_child_properties_last
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 229, 227,
                                227), // Set gray background color
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                    0.5), // Set shadow color and opacity
                                spreadRadius:
                                    2, // Set the spread radius of the shadow
                                blurRadius:
                                    5, // Set the blur radius of the shadow
                                offset: const Offset(
                                    0, 3), // Set the offset of the shadow
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.add_chart_sharp,
                                  size: 110,
                                  color: Colors.green,
                                ),
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Center(
                                        child: AutoSizeText("Emergency Loan")))
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTopPop,
                              alignment: Alignment.bottomRight,
                              child: MyBottomSheet(), // Your new page widget
                              childCurrent: widget, // Your current page widget
                            ),
                          );
                        },
                      ),
                      Container(
                        width: 20,
                      ),
                      InkWell(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 229, 227,
                                227), // Set gray background color
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                    0.5), // Set shadow color and opacity
                                spreadRadius:
                                    2, // Set the spread radius of the shadow
                                blurRadius:
                                    5, // Set the blur radius of the shadow
                                offset: const Offset(
                                    0, 3), // Set the offset of the shadow
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.car_crash,
                                  size: 100,
                                  color: Colors.green,
                                ),
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child:
                                        Center(child: AutoSizeText("Car Loan")))
                              ],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 229, 227,
                                227), // Set gray background color
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                    0.5), // Set shadow color and opacity
                                spreadRadius:
                                    2, // Set the spread radius of the shadow
                                blurRadius:
                                    5, // Set the blur radius of the shadow
                                offset: const Offset(
                                    0, 3), // Set the offset of the shadow
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.business_center,
                                  size: 110,
                                  color: Colors.green,
                                ),
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Center(
                                        child: AutoSizeText("Business Loan")))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 229, 227,
                                227), // Set gray background color
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                    0.3), // Set shadow color and opacity
                                spreadRadius:
                                    2, // Set the spread radius of the shadow
                                blurRadius:
                                    5, // Set the blur radius of the shadow
                                offset: const Offset(
                                    0, 3), // Set the offset of the shadow
                              ),
                            ],
                          ),
                          child: const Center(
                              child: Stack(
                            children: <Widget>[
                              Icon(
                                Icons.school,
                                size: 110,
                                color: Colors.green,
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Center(
                                    child: AutoSizeText("Education Loan")),
                              )
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.scale,
                                alignment: Alignment.bottomRight,
                                child: ProfilePage()));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ProfilePage()));
                      },
                      minWidth: 125,
                      color: Colors.white,
                      child: const AutoSizeText(
                        "Todays Follow-Ups",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "RobotoConsode",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 10,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 125,
                      color: Colors.white,
                      child: const AutoSizeText(
                        "Recovery",
                        style: TextStyle(
                            fontFamily: "RobotoConsode",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ));
  }
}
