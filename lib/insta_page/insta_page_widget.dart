import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstaPageWidget extends StatefulWidget {
  InstaPageWidget({
    Key key,
    this.idInsta,
    this.currentimg,
  }) : super(key: key);

  final DocumentReference idInsta;
  final PostsRecord currentimg;

  @override
  _InstaPageWidgetState createState() => _InstaPageWidgetState();
}

class _InstaPageWidgetState extends State<InstaPageWidget> {
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
        final instaPageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              'Пост',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                fontSize: 16,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<PostsRecord>(
                          stream: PostsRecord.getDocument(
                              widget.currentimg.reference),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }
                            final imagePostsRecord = snapshot.data;
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                imagePostsRecord.imgUrl,
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                instaPageUsersRecord.displayName,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                rowRecord.displayName,
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Image.network(
                    'https://picsum.photos/seed/160/600',
                    width: 400,
                    height: 500,
                    fit: BoxFit.cover,
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
