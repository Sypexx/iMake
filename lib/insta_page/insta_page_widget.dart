import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../salon_page/salon_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstaPageWidget extends StatefulWidget {
  InstaPageWidget({
    Key key,
    //this.idInsta,
    this.img,
  }) : super(key: key);

  //final DocumentReference idInsta;
  final String img;

  @override
  _InstaPageWidgetState createState() => _InstaPageWidgetState();
}

class _InstaPageWidgetState extends State<InstaPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(   //<UsersRecord>
      //stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final instaPageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              'Пост',
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
          body: SafeArea(
            child: Align(
              alignment: Alignment(0, 0),
              child: StreamBuilder(     //<PostsRecord>
                //stream: PostsRecord.getDocument(widget.idInsta),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final columnPostsRecord = snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder(     //<SalonsRecord>
                        // stream:
                        //     SalonsRecord.getDocument(columnPostsRecord.salon),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          final rowSalonsRecord = snapshot.data;
                          return Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SalonPageWidget(
                                          //idsalon: rowSalonsRecord.reference,
                                        ),
                                      ),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      instaPageUsersRecord.photoUrl,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Text(
                                        rowSalonsRecord.salonName,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Playfair Display',
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Text(
                                        instaPageUsersRecord.displayName,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Playfair Display',
                                          fontSize: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Image.network(
                          widget.img,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.6,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
