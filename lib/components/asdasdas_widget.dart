import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AsdasdasWidget extends StatefulWidget {
  AsdasdasWidget({Key key}) : super(key: key);

  @override
  _AsdasdasWidgetState createState() => _AsdasdasWidgetState();
}

class _AsdasdasWidgetState extends State<AsdasdasWidget> {
  String dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: FlutterFlowDropDown(
        options: ['Option 1'],
        onChanged: (value) {
          setState(() => dropDownValue = value);
        },
        width: 130,
        height: 40,
        textStyle: FlutterFlowTheme.bodyText1.override(
          fontFamily: 'Playfair Display',
          color: Colors.black,
        ),
        fillColor: Colors.white,
        elevation: 2,
        borderColor: Colors.transparent,
        borderWidth: 0,
        borderRadius: 0,
        margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
      ),
    );
  }
}
