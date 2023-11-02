import 'package:flutter/material.dart';
import 'package:mapendo/screens/app/form/formLastName.dart';
import 'package:mapendo/screens/app/personalInfo/attach_documents.dart';
import 'package:mapendo/screens/app/personalInfo/last_page.dart';
import 'package:page_transition/page_transition.dart';

class DealrDetails extends StatefulWidget {
  final String userName;
  final String userStatus;
  final String userEmail;

  const DealrDetails(
      {required Key key,
      required this.userName,
      required this.userStatus,
      required this.userEmail})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _dealarDetail();
  }
}

class _dealarDetail extends State<DealrDetails> {
  Widget yourContainer(var height, var width, var text) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width / 2.3,
        child: Center(
          child: Text(text),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xffEAF8F9),
        ));
  }

  Widget displayData() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: <Widget>[
              yourContainer(40.0, 135.0, widget.userName),
              Container(
                height: 5,
              ),
              yourContainer(40.0, 135.0, widget.userStatus),
              Container(
                height: 5,
              ),
              yourContainer(40.0, 135.0, widget.userEmail),
            ],
          ),
        ));
  }

  var _controller = TextEditingController();
  var currentSelectedValue;
  var deviceTypes = [
    "Harmanto",
    "Shubham",
  ];

  late String carModel;
  carModelField() {
    return FormField<String>(
      validator: (value) {
        if (value == null) {
          return "Select your dealar name";
        }
      },
      onSaved: (String? value) {
        carModel = value ?? '';
      },
      builder: (
        FormFieldState<String> state,
      ) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 5.0),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: new Text("Select"),
                  value: carModel,
                  onChanged: (String? newValue) {
                    state.didChange(newValue);
                    setState(() {
                      carModel = newValue ?? '';
                    });
                  },
                  items: <String>[
                    'Harmanto',
                    'Shubham',
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                ),
              ),
//            SizedBox(height: 5.0),
              Text(
                state.hasError ? state.errorText ?? '' : '',
                style:
                    TextStyle(color: Colors.redAccent.shade700, fontSize: 12.0),
              ),
            ],
          ),
        );
      },
    );
  }

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  validateData() {
    if (_key.currentState!.validate()) {
      Navigator.pushReplacement(context,
          PageTransition(type: PageTransitionType.fade, child: LastPage()));

      _key.currentState!.save();
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
            child: Form(
                key: _key,
                autovalidateMode: AutovalidateMode.always,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: <Widget>[
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           child: Image.asset(
//                             "assets/topCurveBlue.png",
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Positioned(
//                           top: 210,
//                           right: 30,
//                           child: Image.asset("assets/manClimb2.png"),
//                         ),
//                         Positioned(
//                             top: 300,
// //                      left: 70,
//                             child: Container(
//                               child: Center(
//                                 child: Image.asset("assets/teoLoan.png"),
//                               ),
//                               width: MediaQuery.of(context).size.width,
//                             )),
                        Positioned(
                            top: 210,
                            height: 150,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Image.asset(
                                    "assets/images/team_illistruation.png"),
                              ),
                            )),
                        Positioned(
                            top: 420,
//                      left: 130,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                child: Text(
                                  "Personal Details",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            )),
                        Positioned(
                          child: displayData(),
                          top: 50,
//                      left: 50,
                        ),
                        Positioned(
//                        left: 40,
                            bottom: 80,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    child: Text(
                                      "Phone Number",
                                      style: TextStyle(fontSize: 18),
                                    ),
//                              width:  MediaQuery.of(context).size.width / 1.2,
                                  ),
                                  Container(
                                    height: 5,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF5f5f5),
                                          borderRadius:
                                              BorderRadius.circular(5)),
//                                            height: MediaQuery.of(context).size.height * 0.09,
                                      width: MediaQuery.of(context).size.width /
                                          1.3,
                                      child: carModelField()),
                                  Container(
                                    height: 5,
                                  ),
                                ],
                              ),
                            )),
                        Positioned(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 14,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(05),
                                gradient: LinearGradient(colors: [
                                  Color(0xff29DBB7),
                                  Color(0xff66BBAA)
                                ])),
                            child: MaterialButton(
                              onPressed: () {
                                validateData();
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(),
                              ),
                            ),
                          ),
                          bottom: 20,
                          right: 40,
                        )
                      ],
                    )))));
  }
}
