import 'package:imake/auth_page/auth_page_password.dart';
import 'package:imake/home_page/home_page_widget.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Registration registrationFromJson(String str) =>
//     Registration.fromJson(json.decode(str));

// String registrationToJson(Registration data) => json.encode(data.toJson());

Future createUser() async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('http://13.125.119.193:8080/api/sign_up/code'));
  request.body = json.encode({"phone": "79659940815"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print('Jobb completed');
  } else {
    print(response.reasonPhrase);
  }
}

class AuthPageNewuser extends StatefulWidget {
  AuthPageNewuser({Key key}) : super(key: key);

  @override
  _AuthPageNewuserState createState() => _AuthPageNewuserState();
}

class _AuthPageNewuserState extends State<AuthPageNewuser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/imakelogo.png',
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.2,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    controller: nameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Имя',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Playfair Display',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFBDBDBD),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFBDBDBD),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Playfair Display',
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    controller: phoneController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Номер',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Playfair Display',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFBDBDBD),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFBDBDBD),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Playfair Display',
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Пароль',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Playfair Display',
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFBDBDBD),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFBDBDBD),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Playfair Display',
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.055,
                    child: FFButtonWidget(
                      // onPressed: () {
                      //   return Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => AuthPagePassword(
                      //               number1: phoneController.text,
                      //               name1: nameController.text,
                      //               password1: passwordController.text,
                      //             )),
                      //   );
                      //   createUser(phoneController.text);
                      // },
                      onPressed: () => {createUser()},
                      text: 'Зарегистрироваться',
                      options: FFButtonOptions(
                        width: 140,
                        height: 45,
                        color: Colors.white,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 17,
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFFBDBDBD),
                          width: 5,
                        ),
                        borderRadius: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
