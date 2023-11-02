import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapendo/screens/app/form/formKtpNumber.dart';
import 'package:mapendo/screens/app/validation.dart';
import 'package:page_transition/page_transition.dart';

class FormGender extends StatefulWidget {
  final String firstname;
  final String surname;

  const FormGender(
      {required Key key, required this.firstname, required this.surname})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _formGender();
  }
}

class _formGender extends State<FormGender> {
  Widget yourContainer(var height, var width, var text) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: width,
        child: Center(child: Text(text)),
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
              yourContainer(35.0, 80.0, widget.firstname),
              Container(
                width: 10,
              ),
              yourContainer(35.0, 80.0, widget.surname),
              Container(
                width: 10,
              ),
              yourContainer(35.0, 80.0, "")
            ],
          ),
          Container(
            height: 10,
          ),
          yourContainer(35.0, 260.0, ""),
          Container(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              yourContainer(35.0, 125.0, ""),
              Container(
                width: 10,
              ),
              yourContainer(35.0, 125.0, ""),
            ],
          )
        ],
      ),
    );
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

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  validateData() {
    if (_key.currentState!.validate()) {
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: FormKtp(
                  carBrand: widget.firstname,
                  carModel: widget.surname,
                  carYear: _controller.text,
                  key: GlobalKey<FormState>())));

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
    // TODO: implement buil
    return Scaffold(
        body: SafeArea(
            child: Form(
                key: _key,
                autovalidateMode: AutovalidateMode.always,
                child: SingleChildScrollView(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: <Widget>[
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   child: Image.asset(
                          //     "assets/images/team_illistruation.png",
                          //     fit: BoxFit.fill,
                          //   ),
                          // ),
                          Positioned(
                            top: 200,
                            height: 150,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                  child: Image.asset(
                                      "assets/images/team_illistruation.png")),
                            ),
                          ),
                          // Positioned(
                          //   top: 250,
                          //   left: 16,
                          //   child: Image.asset("assets/stair.png"),
                          // ),
                          // Positioned(
                          //   top: 200,
                          //   left: 20,
                          //   child: Image.asset("assets/stairMan.png"),
                          // ),
                          // Positioned(
                          //   top: 300,
                          //   // left: 100,
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     child: Center(
                          //         child: Image.asset("assets/check.png")),
                          //   ),
                          // ),
                          Positioned(
                              top: 400,
                              // left: 130,
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
                            // left: 50,
                          ),
                          Positioned(
                              // left: 40,
                              bottom: 120,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        child: const Text(
                                          "Year",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Container(
                                        height: 5,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                10,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        child: TextFormField(
                                          validator:
                                              ValidationData.yearValidate,
                                          controller: _controller,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: const Color(0xFFF5f5f5),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 2.0),
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                validateData();
                                                Navigator.pushReplacement(
                                                    context,
                                                    PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child: FormKtp(
                                                          carBrand:
                                                              widget.firstname,
                                                          carModel:
                                                              widget.surname,
                                                          carYear:
                                                              _controller.text,
                                                          key: GlobalKey<
                                                              FormState>(),
                                                        )));
                                              },
                                              icon: const Icon(Icons.forward),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      )),
                ))));
  }
}
