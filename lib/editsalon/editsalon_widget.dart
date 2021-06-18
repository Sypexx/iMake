import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditsalonWidget extends StatefulWidget {
  EditsalonWidget({Key key}) : super(key: key);

  @override
  _EditsalonWidgetState createState() => _EditsalonWidgetState();
}

class _EditsalonWidgetState extends State<EditsalonWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
    );
  }
}
