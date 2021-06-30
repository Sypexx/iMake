import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GrafikWidget extends StatefulWidget {
  GrafikWidget({Key key}) : super(key: key);

  @override
  _GrafikWidgetState createState() => _GrafikWidgetState();
}

class _GrafikWidgetState extends State<GrafikWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'График',
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
