import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ChoserolWidget extends StatefulWidget {
  ChoserolWidget({Key key}) : super(key: key);

  @override
  _ChoserolWidgetState createState() => _ChoserolWidgetState();
}

class _ChoserolWidgetState extends State<ChoserolWidget> {
  String dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Color(0xFFF5F5F5),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlutterFlowDropDown(
            options: ['Option 1'],
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
          )
        ],
      ),
    );
  }
}
