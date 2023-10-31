import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'application.dart';
import 'bottom_nav.dart';

class ApplicationStepper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _applicationStepper();
  }
}

class _applicationStepper extends State<ApplicationStepper> {
  int _currentstep = 0;
  void _movetonext() {
    setState(() {
      _currentstep++;
    });
  }

  void _movetostart() {
    setState(() {
      _currentstep = 0;
    });
  }

  List<Step> spr = <Step>[
    // const Step( title:  ,'SubTitle1', 'This is Content', state: StepState.indexed, true)
    const Step(
        title: Text('Check Eligibility'),
        // subtitle: Text('SubTitle1'),
        content: Text(''),
        state: StepState.complete,
        isActive: true),
    const Step(
        title: Text('In pricipal approval'),
        // subtitle: Text('SubTitle1'),
        content: Text(''),
        state: StepState.complete,
        isActive: true),
    const Step(
        title: Text('Upload Documents'),
        // subtitle: Text('SubTitle1'),
        content: Text(''),
        state: StepState.error,
        isActive: true),
    const Step(
        title: Text('Loan Sactioned'),
        // subtitle: Text('SubTitle1'),
        content: Text(''),
        state: StepState.disabled,
        isActive: true),
    const Step(
        title: Text('Disbursment'),
        // subtitle: Text('SubTitle1'),
        content: Text(''),
        state: StepState.disabled,
        isActive: true),
    const Step(
        title: Text('Repayment'),
        // subtitle: Text('SubTitle1'),
        content: Text(''),
        state: StepState.disabled,
        isActive: true),
  ];

  Widget stpperWidget() {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
            child: Stepper(
          steps: spr,
          type: StepperType.vertical,
          currentStep: _currentstep,
          onStepContinue: _movetonext,
          onStepCancel: _movetostart,
        )));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: const Color(0xff02314B),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ApplicationPage()));
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      "Applications",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 1.3,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 0),
                          child: Text(
                            "APPLICATIONS IN PROGRESS",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 00, bottom: 05),
                          child: Text(
                            "TODAY",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      spreadRadius: 2)
                                ]),
                            height: MediaQuery.of(context).size.height / 1.5,
                            child: ListView(
                              children: <Widget>[
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        "Name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 20, top: 10),
                                      child: Text(
                                        "John",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        "Loan Type",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 20, top: 10),
                                      child: Text(
                                        "Vehical Loan",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        "Amount",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 20, top: 10),
                                      child: Text(
                                        "RP.512000",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        "Status",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 20, top: 10),
                                      child: Text(
                                        "Documents pending",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                stpperWidget()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        )));
  }
}
