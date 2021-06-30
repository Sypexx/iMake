import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ZapisWidget extends StatefulWidget {
  ZapisWidget({Key key}) : super(key: key);

  @override
  _ZapisWidgetState createState() => _ZapisWidgetState();
}

class _ZapisWidgetState extends State<ZapisWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Text(
          'Записаться',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Playfair Display',
            fontSize: 24,
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
