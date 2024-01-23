import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_identity_sdk/flutter_plugin_identity_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _result = '';
  String _login_id = '';
  String _password = '';
  int _merchant_id = 0;
  int _unique_customer_number = 0;
  late TextEditingController _login_id_controller;
  late TextEditingController _password_controller;
  late TextEditingController _merchant_id_controller;
  late TextEditingController _unique_customer_number_controller;

  @override
  void initState() {
    super.initState();
    _login_id_controller = TextEditingController();
    _password_controller = TextEditingController();
    _merchant_id_controller = TextEditingController();
    _unique_customer_number_controller = TextEditingController();
  }
  
  @override
  void dispose() {
    _login_id_controller.dispose();
    _password_controller.dispose();
    _merchant_id_controller.dispose();
    _unique_customer_number_controller.dispose();
    super.dispose();
  }

  void initialize() {
    FlutterPluginIdentitySdk.idm_sdk_init(_login_id, _password, _merchant_id).then((value) => set_result(value!));
  }

  void idValidation() {
    FlutterPluginIdentitySdk.idm_sdk_serviceID20().then((value) => set_result(value!));
  }

  void idValidationAndMatchFace() {
    FlutterPluginIdentitySdk.idm_sdk_serviceID10().then((value) => set_result(value!));
  }

  void identifyCustomer() {
    FlutterPluginIdentitySdk.idm_sdk_serviceID185().then((value) => set_result(value!));
  }

  void liveFaceCheck() {
    FlutterPluginIdentitySdk.idm_sdk_serviceID660().then((value) => set_result(value!));
  }

  void idValidationAndcustomerEnroll() {
    FlutterPluginIdentitySdk.idm_sdk_serviceID50(_unique_customer_number).then((value) => set_result(value!));
  }

  void customerEnrollBiometrics() {
    FlutterPluginIdentitySdk.idm_sdk_serviceID175(_unique_customer_number).then((value) => set_result(value!));
  }

  void customerVerification() {
    FlutterPluginIdentitySdk.idm_sdk_serviceID105(_unique_customer_number).then((value) => set_result(value!));
  }

  void submitResult() {
    FlutterPluginIdentitySdk.submit_result().then((value) => set_result(value!));
  }

  void set_result(String result) {
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Identity SDK'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: 'Login ID',
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  controller: _login_id_controller,
                  onChanged:  (String value) async {
                    _login_id = value;
                  },
                  onSubmitted: (String value) async {
                    _login_id = value;
                  },
              ),
              TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  controller: _password_controller,
                  onChanged:  (String value) async {
                    _password = value;
                  },                  
                  onSubmitted: (String value) async {
                    _password = value;
                  },
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: 'Merchant ID',
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  controller: _merchant_id_controller,
                  onChanged:  (String value) async {
                    _merchant_id = int.parse(value);
                  },                  
                  onSubmitted: (String value) async {
                    _merchant_id = int.parse(value);
                  },
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    hintText: 'Unique Customer Number',
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  controller: _unique_customer_number_controller,
                  onChanged:  (String value) async {
                    _unique_customer_number = int.parse(value);
                  },                  
                  onSubmitted: (String value) async {
                    _unique_customer_number = int.parse(value);
                  },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.all(10),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text('Initialize'),
                    onPressed: () => initialize(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.all(10),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text('ID Validation'),
                    onPressed: () => idValidation(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.all(10),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text('ID Validation and Match Face'),
                    onPressed: () => idValidationAndMatchFace(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.all(10),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text('Identify Customer'),
                    onPressed: () => idValidation(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.all(10),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text('Live Face Check'),
                    onPressed: () => liveFaceCheck(),
                  ),
                ],
              ),                                          
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.all(10),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text('ID Validation and Customer Enroll'),
                    onPressed: () => idValidationAndcustomerEnroll(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.all(10),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text('Customer Enroll Biometrics'),
                    onPressed: () => customerEnrollBiometrics(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.all(10),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text('Customer Verification'),
                    onPressed: () => customerVerification(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      padding: EdgeInsets.all(10),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Text('Submit Result'),
                    onPressed: () => submitResult(),
                  ),
                ],
              ),
              Text('$_result\n'),
            ],
          ),
        ),
      ),
    );
  }
}
