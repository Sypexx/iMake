import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String dropDownValue;
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Text(
            'Город',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(
            'Якутск',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: Color(0xFFFF0000),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(
              Icons.chat_bubble,
              color: Colors.black,
              size: 32,
            ),
          )
        ],
        centerTitle: false,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFDBE2E7),
      body: Container(
        width: 400,
        height: 650,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                width: double.infinity,
                height: 500,
                child: Stack(
                  children: [
                    PageView(
                      controller: pageViewController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset(
                          'assets/images/IMG_4633.PNG',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/IMG_4634.PNG',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                          child: Image.asset(
                            'assets/images/IMG_4630.PNG',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
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
            ),
            Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Категории',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: StreamBuilder<List<CategoriesRecord>>(
                  stream: queryCategoriesRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List<CategoriesRecord> rowCategoriesRecordList =
                        snapshot.data;
                    // Customize what your widget looks like with no query results.
                    if (snapshot.data.isEmpty) {
                      // return Container();
                      // For now, we'll just include some dummy data.
                      rowCategoriesRecordList =
                          createDummyCategoriesRecord(count: 4);
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(rowCategoriesRecordList.length,
                            (rowIndex) {
                          final rowCategoriesRecord =
                              rowCategoriesRecordList[rowIndex];
                          return Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Image.network(
                              rowCategoriesRecord.imgUrl,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            FlutterFlowDropDown(
              options: ['Option 1'],
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
            )
          ],
        ),
      ),
    );
  }
}
