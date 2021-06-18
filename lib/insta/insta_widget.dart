import '../addimg/addimg_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../salon_page/salon_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstaWidget extends StatefulWidget {
  InstaWidget({Key key}) : super(key: key);

  @override
  _InstaWidgetState createState() => _InstaWidgetState();
}

class _InstaWidgetState extends State<InstaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Работы мастеров',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddimgWidget(),
                ),
              );
            },
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
              size: 30,
            ),
            iconSize: 30,
          )
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: StreamBuilder<List<PostsRecord>>(
                stream: queryPostsRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<PostsRecord> gridViewPostsRecordList = snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    // return Container();
                    // For now, we'll just include some dummy data.
                    gridViewPostsRecordList = createDummyPostsRecord(count: 4);
                  }
                  return Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: gridViewPostsRecordList.length,
                      itemBuilder: (context, gridViewIndex) {
                        final gridViewPostsRecord =
                            gridViewPostsRecordList[gridViewIndex];
                        return StreamBuilder<UsersRecord>(
                          stream:
                              UsersRecord.getDocument(gridViewPostsRecord.user),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }
                            final imageUsersRecord = snapshot.data;
                            return Padding(
                              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SalonPageWidget(
                                        created: gridViewPostsRecord,
                                        username: gridViewPostsRecord,
                                      ),
                                    ),
                                  );
                                },
                                child: Image.network(
                                  gridViewPostsRecord.imgUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
