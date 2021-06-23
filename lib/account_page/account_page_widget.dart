import '../auth/auth_util.dart';
import '../auth_page/auth_page_widget.dart';
import '../backend/backend.dart';
import '../crmpage/crmpage_widget.dart';
import '../editclient/editclient_widget.dart';
import '../editsalon/editsalon_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../sotrudniki/sotrudniki_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                          fontFamily: 'Poppins',
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  accountPageUsersRecord.displayName,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  accountPageUsersRecord.role,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
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
                            width: 130,
                            height: 40,
                            color: Color(0x00FFFFFF),
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBDBDBD),
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        final frontImage =
                            'https://firebasestorage.googleapis.com/v0/b/imake-b18ed.appspot.com/o/salon%2Fshop.png?alt=media&token=813a7381-1ea3-4e7c-94dc-436433d059bc';
                        final salonName = 'Название салона';
                        final salonStreet = 'Улица';
                        final user = accountPageUsersRecord.reference;

                        final salonsRecordData = createSalonsRecordData(
                          frontImage: frontImage,
                          salonName: salonName,
                          salonStreet: salonStreet,
                          user: user,
                        );

                        await SalonsRecord.collection
                            .doc()
                            .set(salonsRecordData);
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Создание салона'),
                              content: Text('Салон создан успешно!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      text: 'Создать салон',
                      options: FFButtonOptions(
                        width: 180,
                        height: 40,
                        color: Color(0x00FFFFFF),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFFBDBDBD),
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    )
                  ],
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
                      // return Container();
                      // For now, we'll just include some dummy data.
                      rowSalonsRecordList = createDummySalonsRecord(count: 1);
                    }
                    final rowSalonsRecord = rowSalonsRecordList.first;
                    return Row(
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
                              return Center(child: CircularProgressIndicator());
                            }
                            List<SalonImagesRecord>
                                buttonSalonImagesRecordList = snapshot.data;
                            // Customize what your widget looks like with no query results.
                            if (snapshot.data.isEmpty) {
                              // return Container();
                              // For now, we'll just include some dummy data.
                              buttonSalonImagesRecordList =
                                  createDummySalonImagesRecord(count: 1);
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
                                width: 180,
                                height: 40,
                                color: Color(0x00FFFFFF),
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBDBDBD),
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
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
                            // return Container();
                            // For now, we'll just include some dummy data.
                            buttonSalonsRecordList =
                                createDummySalonsRecord(count: 1);
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
                              width: 180,
                              height: 40,
                              color: Color(0x00FFFFFF),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                              borderSide: BorderSide(
                                color: Color(0xFFBDBDBD),
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
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
                          width: 180,
                          height: 40,
                          color: Color(0x00FFFFFF),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                          ),
                          borderRadius: 12,
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
                          color: Color(0x00FFFFFF),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                          ),
                          borderRadius: 12,
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
