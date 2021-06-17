import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
            child: FaIcon(
              FontAwesomeIcons.comments,
              color: Colors.black,
              size: 32,
            ),
          )
        ],
        centerTitle: false,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 500,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                          child: PageView(
                            controller: pageViewController,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Image.network(
                                'https://picsum.photos/seed/477/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://picsum.photos/seed/25/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              Image.network(
                                'https://picsum.photos/seed/501/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
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
                              effect: ExpandingDotsEffect(
                                expansionFactor: 2,
                                spacing: 8,
                                radius: 16,
                                dotWidth: 16,
                                dotHeight: 16,
                                dotColor: Color(0xFF9E9E9E),
                                activeDotColor: Color(0xFF3F51B5),
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
            )
          ],
        ),
      ),
    );
  }
}
