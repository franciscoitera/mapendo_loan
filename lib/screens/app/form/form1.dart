import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mapendo/screens/app/form/formLastName.dart';
import 'package:mapendo/screens/app/validation.dart';
import 'package:page_transition/page_transition.dart';

class FormBrand extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _formBrand();
  }
}

class _formBrand extends State<FormBrand> {
  late String firstname; // Declare the late variable here

  @override
  void initState() {
    super.initState();
    firstname = ''; // Initialize the carBrand variable here
  }

  Widget yourContainer(var height, var width, var text) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: width,
        child: AutoSizeText(text),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffEAF8F9),
        ));
  }

  Widget displayData() {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              yourContainer(35.0, 80.0, ""),
              Container(
                width: 10,
              ),
              yourContainer(35.0, 80.0, ""),
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

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  validateData() {
    if (_key.currentState!.validate()) {
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: FormLastName(
                firstname: firstname,
                key: GlobalKey<FormState>(),
              )));

      _key.currentState!.save();
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  firstnameField() {
    return FormField<String>(
      validator: (value) {
        if (value == null) {
          return "";
        }
      },
      onSaved: (value) {
        firstname = value!;
      },
      builder: (
        FormFieldState<String> state,
      ) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 5.0),
              TextFormField(
                validator: ValidationData.nameValidate,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF5f5f5),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 2.0),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      validateData();
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: FormLastName(
                                firstname: firstname,
                                key: GlobalKey<FormState>(),
                              )));
                    },
                    icon: const Icon(Icons.forward),
                  ),
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement buil
    return Scaffold(
        body: SafeArea(
            child: Form(
                key: _key,
                autovalidateMode: AutovalidateMode.always,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 210,
                          height: 150,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: Image.asset(
                                    "assets/images/team_illistruation.png")),
                          ),
                        ),
                        Positioned(
                            top: 400,
                            //  left: 130,
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
                          top: 50,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: displayData(),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 100,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    child: const Text(
                                      "First Name",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 220,
                                    child: firstnameField(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )))));
  }
}
