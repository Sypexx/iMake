import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ChooseroleWidget extends StatefulWidget {
  ChooseroleWidget({Key key}) : super(key: key);

  @override
  _ChooseroleWidgetState createState() => _ChooseroleWidgetState();
}

class _ChooseroleWidgetState extends State<ChooseroleWidget> {
  String dropDownValue;

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown(
      options: ['Option 1', 'Option 12', 'Option 13'],
      onChanged: (value) {
        setState(() => dropDownValue = value);
      },
      width: 130,
      height: 40,
      textStyle: FlutterFlowTheme.bodyText1.override(
        fontFamily: 'Poppins',
        color: Colors.black,
      ),
      fillColor: Colors.white,
      elevation: 2,
      borderColor: Colors.transparent,
      borderWidth: 0,
      borderRadius: 0,
      margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
    );
  }
}
