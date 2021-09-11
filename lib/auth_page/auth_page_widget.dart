import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:imake/auth_page/auth_page_newuser.dart';
import 'package:imake/home_page/home_page_widget.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';


class AuthPageWidget extends StatefulWidget {
  AuthPageWidget({Key key}) : super(key: key);

  @override
  _AuthPageWidgetState createState() => _AuthPageWidgetState();
}

class _AuthPageWidgetState extends State<AuthPageWidget> {
  TapGestureRecognizer _registration;

  TextEditingController phoneController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    // _privacyPolicy.dispose();
    // _termsCondition.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    passwordVisibility = false;
    _registration = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthPageNewuser(),
            ));
      };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: true, body: setUserForm());
  }

  Widget setUserForm() {
    return Stack(children: <Widget>[
      //BACKGROUND
      Container(
          padding: EdgeInsets.fromLTRB(0, 75, 0, 0),
          child: Center(
              child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                  ),
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/imakelogo.png')),
            ],
          )),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff7FE7E9), Color(0x80F45B94)])),
          height: MediaQuery.of(context).size.height * 0.66),
      // BODY MAKET
      SafeArea(
        child: Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.625,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    controller: phoneController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Телефон',
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
                Container(
                  padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.055,
                  child: FFButtonWidget(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NavBarPage(initialPage: 'HomePage')),
                    ),
                    text: 'Авторизоваться',
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
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 600, right: 50, left: 100),
        child: Container(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              text: 'Нет аккаунта? ',
              children: [
                TextSpan(
                  style: TextStyle(color: Colors.blue),
                  text: 'Зарегистрироваться',
                  recognizer: _registration,
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
