import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CrmpageWidget extends StatefulWidget {
  CrmpageWidget({Key key}) : super(key: key);

  @override
  _CrmpageWidgetState createState() => _CrmpageWidgetState();
}

class _CrmpageWidgetState extends State<CrmpageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Статистика салона',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Playfair Display',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
    );
  }
}
