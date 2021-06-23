import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SotrudnikiWidget extends StatefulWidget {
  SotrudnikiWidget({
    Key key,
    this.salon,
  }) : super(key: key);

  final DocumentReference salon;

  @override
  _SotrudnikiWidgetState createState() => _SotrudnikiWidgetState();
}

class _SotrudnikiWidgetState extends State<SotrudnikiWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SalonsRecord>(
      stream: SalonsRecord.getDocument(widget.salon),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final sotrudnikiSalonsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              'Сотрудники',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.check_circle,
                  color: Colors.black,
                  size: 30,
                ),
                iconSize: 30,
              )
            ],
            centerTitle: true,
            elevation: 4,
          ),
          body: SafeArea(
            child: Align(
              alignment: Alignment(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Мастер',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      TextFormField(
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Почта1',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord
                              .where('email', isEqualTo: textController1.text),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          List<UsersRecord> buttonUsersRecordList =
                              snapshot.data;
                          // Customize what your widget looks like with no query results.
                          if (snapshot.data.isEmpty) {
                            // return Container();
                            // For now, we'll just include some dummy data.
                            buttonUsersRecordList =
                                createDummyUsersRecord(count: 1);
                          }
                          final buttonUsersRecord = buttonUsersRecordList.first;
                          return FFButtonWidget(
                            onPressed: () async {
                              final role = 'Мастер';
                              final salon = sotrudnikiSalonsRecord.reference;

                              final usersRecordData = createUsersRecordData(
                                role: role,
                                salon: salon,
                              );

                              await sotrudnikiSalonsRecord.user
                                  .update(usersRecordData);
                            },
                            text: 'Добавить',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: Color(0xFFBDBDBD),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'Администратор',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: textController2,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Почта2',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Добавить',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: Color(0xFFBDBDBD),
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord.where(
                            'salon',
                            isEqualTo: sotrudnikiSalonsRecord.reference),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        List<UsersRecord> gridViewUsersRecordList =
                            snapshot.data;
                        // Customize what your widget looks like with no query results.
                        if (snapshot.data.isEmpty) {
                          // return Container();
                          // For now, we'll just include some dummy data.
                          gridViewUsersRecordList =
                              createDummyUsersRecord(count: 4);
                        }
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: gridViewUsersRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewUsersRecord =
                                gridViewUsersRecordList[gridViewIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.network(
                                  gridViewUsersRecord.photoUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  gridViewUsersRecord.displayName,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  gridViewUsersRecord.role,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
