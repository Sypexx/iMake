import '../backend/backend.dart';
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
            StreamBuilder<List<UsersRecord>>(
              stream: queryUsersRecord(
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<UsersRecord> dropDownUsersRecordList = snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  // return Container();
                  // For now, we'll just include some dummy data.
                  dropDownUsersRecordList = createDummyUsersRecord(count: 1);
                }
                final dropDownUsersRecord = dropDownUsersRecordList.first;
                return FlutterFlowDropDown(
                  initialOption: 'asdasd',
                  options: ['Option 1', '22', '33', '44', '55'],
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
                  icon: Icon(
                    Icons.three_k,
                    size: 15,
                  ),
                  fillColor: Colors.white,
                  elevation: 3,
                  borderColor: Colors.transparent,
                  borderWidth: 1,
                  borderRadius: 1,
                  margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                );
              },
            ),
            Image.network(
              'https://picsum.photos/seed/730/600',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
