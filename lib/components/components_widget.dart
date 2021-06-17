import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ComponentsWidget extends StatefulWidget {
  ComponentsWidget({
    Key key,
    this.created,
    this.username,
  }) : super(key: key);

  final PostsRecord created;
  final PostsRecord username;

  @override
  _ComponentsWidgetState createState() => _ComponentsWidgetState();
}

class _ComponentsWidgetState extends State<ComponentsWidget> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(
                children: [
                  PageView(
                    controller: pageViewController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.network(
                        'https://picsum.photos/seed/905/600',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://picsum.photos/seed/77/600',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://picsum.photos/seed/638/600',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: SmoothPageIndicator(
                        controller: pageViewController,
                        count: 3,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (i) {
                          pageViewController.animateToPage(
                            i,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        effect: SlideEffect(
                          spacing: 8,
                          radius: 16,
                          dotWidth: 12,
                          dotHeight: 12,
                          dotColor: Color(0xFF9E9E9E),
                          activeDotColor: Colors.white,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(widget.username.user),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final columnUsersRecord = snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        columnUsersRecord.email,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        widget.created.createdAt.toString(),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 4,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Color(0xFFA6A6A6),
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(
                          text: 'Услуги',
                        ),
                        Tab(
                          text: 'Акции',
                        ),
                        Tab(
                          text: 'Мастера',
                        ),
                        Tab(
                          text: 'Отзывы',
                        )
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Text(
                            'Tab View 1',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            'Tab View 2',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            'Tab View 3',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            'Tab View 4',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 32,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
