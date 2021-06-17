import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPageWidget extends StatefulWidget {
  SearchPageWidget({Key key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowDropDown(
              options: ['Option 1'],
              onChanged: (value) {
                setState(() => dropDownValue = value);
              },
              width: 250,
              height: 40,
              textStyle: FlutterFlowTheme.title1.override(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              fillColor: Colors.white,
              elevation: 3,
              borderColor: Colors.transparent,
              borderWidth: 0,
              borderRadius: 0,
              margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
            )
          ],
        ),
      ),
    );
  }
}
