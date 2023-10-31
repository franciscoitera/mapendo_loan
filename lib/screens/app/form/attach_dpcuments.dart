import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapendo/screens/app/personalInfo/first_page.dart';
import 'package:page_transition/page_transition.dart';

class FormAttachDocuments extends StatefulWidget {
  final String carBrand;
  final String carModel;
  final String carYear;
  final String carKTp;
  final String dateob;
  final String monthlyIncome;

  const FormAttachDocuments(
      {required Key key,
      required this.carModel,
      required this.carBrand,
      required this.carYear,
      required this.carKTp,
      required this.dateob,
      required this.monthlyIncome})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _formCarYear();
  }
}

class _formCarYear extends State<FormAttachDocuments> {
  Widget yourContainer(var height, var width, var text) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: width,
        child: Center(child: AutoSizeText(text)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffEAF8F9),
        ));
  }

  Widget displayData() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              yourContainer(35.0, 80.0, widget.carBrand),
              Container(
                width: 10,
              ),
              yourContainer(35.0, 80.0, widget.carModel),
              Container(
                width: 10,
              ),
              yourContainer(35.0, 80.0, widget.carYear)
            ],
          ),
          Container(
            height: 10,
          ),
          yourContainer(35.0, 260.0, widget.carKTp),
          Container(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              yourContainer(35.0, 125.0, widget.dateob),
              Container(
                width: 10,
              ),
              yourContainer(35.0, 125.0, widget.monthlyIncome),
            ],
          )
        ],
      ),
    );
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 70,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                Container(
                  width: 10,
                ),
                new AutoSizeText("Checking Eligibility"),
              ],
            ),
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.bottomToTop, child: FirstPage()));
    });
  }

  var _controller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('d-MM-yyyy');

  Future<Null> _selectDate(BuildContext context) async {
    final YearPicker picked = YearPicker(
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      onChanged: (DateTime value) {
        selectedDate = value;
      },
      selectedDate: selectedDate,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        // selectedDate = picked;
        _controller.value =
            TextEditingValue(text: myFormat.format(selectedDate));
      });
  }

  double _value = 0.0;
  void _setvalue(double value) => setState(() => _value = value);
  @override
  Widget build(BuildContext context) {
    // TODO: implement buil
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/topCurveBlue.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 250,
                      left: 16,
                      child: Image.asset("assets/stair.png"),
                    ),
                    Positioned(
                      top: 200,
                      left: 20,
                      child: Image.asset("assets/stairMan.png"),
                    ),
                    Positioned(
                      top: 300,
                      // left: 100,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Image.asset("assets/check.png")),
                      ),
                    ),
                    Positioned(
                        top: 400,
                        // left: 130,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: AutoSizeText(
                              "Attached Document",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        )),
                    Positioned(
                      child: displayData(),
                      top: 50,
                      // left: 50,
                    ),
                    Positioned(
                        // left: 40,
                        top: 470,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                // color: Colors.black12,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        MaterialButton(
                                            height: 50,
                                            minWidth: 50,
                                            child: const Center(
                                              child: Icon(Icons.add),
                                            ),
                                            onPressed: () {},
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        Container(
                                          height: 5,
                                        ),
                                        const AutoSizeText(
                                            'Income \n Statement'),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        MaterialButton(
                                            height: 50,
                                            minWidth: 50,
                                            child: const Center(
                                              child: Icon(Icons.add),
                                            ),
                                            onPressed: () {},
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        Container(
                                          height: 5,
                                        ),
                                        const AutoSizeText('Bank \n Statement'),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        MaterialButton(
                                            height: 50,
                                            minWidth: 50,
                                            child: const Center(
                                              child: Icon(Icons.add),
                                            ),
                                            onPressed: () {},
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        Container(
                                          height: 5,
                                        ),
                                        const AutoSizeText(
                                            'Electricity \n Bill'),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        MaterialButton(
                                            height: 50,
                                            minWidth: 50,
                                            child: const Center(
                                              child: Icon(Icons.add),
                                            ),
                                            onPressed: () {},
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        Container(
                                          height: 5,
                                        ),
                                        const AutoSizeText('Mobile \n Bill'),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(05),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xff29DBB7),
                                        Color(0xff66BBAA)
                                      ])),
                                  child: MaterialButton(
                                    child: const AutoSizeText("Submit"),
                                    minWidth: 150,
                                    onPressed: () {
                                      _onLoading();
                                    },
                                  ),
                                )),
                          ],
                        ))
                  ],
                ))));
  }
}
