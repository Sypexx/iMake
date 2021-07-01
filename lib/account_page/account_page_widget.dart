import '../auth/auth_util.dart';
import '../auth_page/auth_page_widget.dart';
import '../backend/backend.dart';
import '../crmpage/crmpage_widget.dart';
import '../editclient/editclient_widget.dart';
import '../editsalon/editsalon_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../grafik/grafik_widget.dart';
import '../sotrudniki/sotrudniki_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPageWidget extends StatefulWidget {
  AccountPageWidget({Key key}) : super(key: key);

  @override
  _AccountPageWidgetState createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final accountPageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            title: Text(
              'Профиль',
              style: FlutterFlowTheme.title1.override(
                fontFamily: 'Poppins',
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          accountPageUsersRecord.photoUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        accountPageUsersRecord.email,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Playfair Display',
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  accountPageUsersRecord.displayName,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Playfair Display',
                  ),
                ),
                Text(
                  accountPageUsersRecord.role,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Playfair Display',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditclientWidget(),
                              ),
                            );
                          },
                          text: 'Редактировать',
                          options: FFButtonOptions(
                            width: 160,
                            height: 40,
                            color: Colors.white,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Playfair Display',
                              fontWeight: FontWeight.w600,
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBDBDBD),
                              width: 3,
                            ),
                            borderRadius: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                StreamBuilder<List<SalonsRecord>>(
                  stream: querySalonsRecord(
                    queryBuilder: (salonsRecord) => salonsRecord.where('user',
                        isEqualTo: accountPageUsersRecord.reference),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List<SalonsRecord> rowSalonsRecordList = snapshot.data;
                    // Customize what your widget looks like with no query results.
                    if (snapshot.data.isEmpty) {
                      return Container(
                        height: 100,
                        child: Center(
                          child: Text('No results.'),
                        ),
                      );
                    }
                    final rowSalonsRecord = rowSalonsRecordList.first;
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder<List<SalonImagesRecord>>(
                            stream: querySalonImagesRecord(
                              queryBuilder: (salonImagesRecord) =>
                                  salonImagesRecord.where('salon',
                                      isEqualTo: rowSalonsRecord.reference),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              List<SalonImagesRecord>
                                  buttonSalonImagesRecordList = snapshot.data;
                              // Customize what your widget looks like with no query results.
                              if (snapshot.data.isEmpty) {
                                return Container(
                                  height: 100,
                                  child: Center(
                                    child: Text('No results.'),
                                  ),
                                );
                              }
                              final buttonSalonImagesRecord =
                                  buttonSalonImagesRecordList.first;
                              return FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditsalonWidget(
                                        salon: rowSalonsRecord.reference,
                                        salonimages:
                                            buttonSalonImagesRecord.reference,
                                      ),
                                    ),
                                  );
                                },
                                text: 'Редактировать салон',
                                options: FFButtonOptions(
                                  width: 210,
                                  height: 40,
                                  color: Colors.white,
                                  textStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Playfair Display',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFBED0A8),
                                    width: 3,
                                  ),
                                  borderRadius: 15,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder<List<SalonsRecord>>(
                        stream: querySalonsRecord(
                          queryBuilder: (salonsRecord) => salonsRecord.where(
                              'user',
                              isEqualTo: accountPageUsersRecord.reference),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          List<SalonsRecord> buttonSalonsRecordList =
                              snapshot.data;
                          // Customize what your widget looks like with no query results.
                          if (snapshot.data.isEmpty) {
                            return Container(
                              height: 100,
                              child: Center(
                                child: Text('No results.'),
                              ),
                            );
                          }
                          final buttonSalonsRecord =
                              buttonSalonsRecordList.first;
                          return FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SotrudnikiWidget(
                                    salon: accountPageUsersRecord.salon,
                                  ),
                                ),
                              );
                            },
                            text: 'Сотрудники',
                            options: FFButtonOptions(
                              width: 210,
                              height: 40,
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Playfair Display',
                                fontWeight: FontWeight.w600,
                              ),
                              borderSide: BorderSide(
                                color: Color(0xFFBDBDBD),
                                width: 3,
                              ),
                              borderRadius: 15,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) =>
                        usersRecord.where('role', isEqualTo: 'Директор'),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List<UsersRecord> rowUsersRecordList = snapshot.data;
                    // Customize what your widget looks like with no query results.
                    if (snapshot.data.isEmpty) {
                      return Container(
                        height: 100,
                        child: Center(
                          child: Text('No results.'),
                        ),
                      );
                    }
                    final rowUsersRecord = rowUsersRecordList.first;
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CrmpageWidget(),
                                ),
                              );
                            },
                            text: 'Статистика',
                            options: FFButtonOptions(
                              width: 210,
                              height: 40,
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Playfair Display',
                                fontWeight: FontWeight.w600,
                              ),
                              borderSide: BorderSide(
                                color: Color(0xFFBDBDBD),
                                width: 3,
                              ),
                              borderRadius: 15,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GrafikWidget(),
                            ),
                          );
                        },
                        text: 'График',
                        options: FFButtonOptions(
                          width: 210,
                          height: 40,
                          color: Colors.white,
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Playfair Display',
                            fontWeight: FontWeight.w600,
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 3,
                          ),
                          borderRadius: 15,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          await signOut();
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthPageWidget(),
                            ),
                            (r) => false,
                          );
                        },
                        text: 'Выйти',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Color(0xFFBDBDBD),
                          textStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Playfair Display',
                            fontWeight: FontWeight.w600,
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 3,
                          ),
                          borderRadius: 20,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
