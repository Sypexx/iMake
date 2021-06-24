import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPageWidget extends StatefulWidget {
  AuthPageWidget({Key key}) : super(key: key);

  @override
  _AuthPageWidgetState createState() => _AuthPageWidgetState();
}

class _AuthPageWidgetState extends State<AuthPageWidget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, -0.65),
                child: Image.asset(
                  'assets/images/IMG_3916.PNG',
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment(-0.63, -0.09),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: FlutterFlowDropDown(
                    initialOption: 'aasdf',
                    options: ['123', '1234', '12345'],
                    onChanged: (value) {
                      setState(() => dropDownValue = value);
                    },
                    width: 140,
                    height: 50,
                    textStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                    icon: Icon(
                      Icons.three_k,
                      color: Color(0xFFFF0000),
                      size: 24,
                    ),
                    fillColor: Colors.white,
                    elevation: 2,
                    borderColor: Colors.transparent,
                    borderWidth: 1,
                    borderRadius: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
