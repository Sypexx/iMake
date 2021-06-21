import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text(
                'Якутск',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPageWidget(),
                  ),
                );
              },
              icon: FaIcon(
                FontAwesomeIcons.search,
                color: Colors.black,
                size: 24,
              ),
              iconSize: 24,
            ),
          )
        ],
        centerTitle: false,
        elevation: 4,
      ),
      body: SafeArea(
        child: FlutterFlowDropDown(
          initialOption: 'lolxd',
          options: ['Option 1', 'Option 2', 'Option 3'],
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
        ),
      ),
    );
  }
}
