import 'dart:async';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../salon_page/salon_page_widget.dart';
import '../search_page/search_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_picker/flutter_picker.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int i = 2;
  int curri = 0;
  @override
  void initState() {
    super.initState();
    if (curri >= i) {
      curri = 0;
    } else
      Timer.periodic(Duration(seconds: 5), (Timer timer) {
        pageViewController.animateToPage(
          curri++,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      });
  }

// showPickerDialog(BuildContext context) {
//     Picker(
//         adapter: PickerDataAdapter<String>(pickerdata: JsonDecoder().convert(PickerData)),
//         hideHeader: true,
//         title: Text("Select Data"),
//         selectedTextStyle: TextStyle(color: Colors.blue),
//         onConfirm: (Picker picker, List value) {
//           print(value.toString());
//           print(picker.getSelectedValues());
//         }
//     ).showDialog(context);
//   }

  @override
  Widget build(BuildContext context) {
    //return StreamBuilder<UsersRecord> (
    //stream: UsersRecord.getDocument(currentUserReference),
    //builder: (context, snapshot) {
    // if (!snapshot.hasData) {
    //   return Center(child: CircularProgressIndicator());
    // }
    // final homePageUsersRecord = snapshot.data;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // title: GestureDetector(
        //   onTap: showPickerDialog(context),
        //   child: Text(
        //     'Якутск',
        //     style: FlutterFlowTheme.bodyText1.override(
        //       fontFamily: 'Playfair Display',
        //       fontSize: 24,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        // ),
        title: Text('Якутск',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Playfair Display',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              onPressed: () {
                print('IconButton pressed ...');
              },
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
                size: 30,
              ),
              iconSize: 30,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: StreamBuilder<List>(
                    //<AdRecord>
                    //stream: queryAdRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      // List<AdRecord> pageViewAdRecordList = snapshot.data;
                      if (snapshot.data.isEmpty) {
                        return Container(
                          height: 100,
                          child: Center(
                            child: Text('No results.'),
                          ),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Stack(
                            children: [
                              PageView.builder(
                                controller: pageViewController,
                                scrollDirection: Axis.horizontal,
                                // itemCount: pageViewAdRecordList.length,
                                // itemBuilder: (context, pageViewIndex) {
                                //   final pageViewAdRecord =
                                //       pageViewAdRecordList[pageViewIndex];
                                //   return ClipRRect(
                                //     borderRadius: BorderRadius.circular(20),
                                //     child: Image.network(
                                //       pageViewAdRecord.imgUrl,
                                //       width:
                                //           MediaQuery.of(context).size.width,
                                //       height: MediaQuery.of(context)
                                //               .size
                                //               .height *
                                //           1,
                                //       fit: BoxFit.cover,
                                //     ),
                                //   );
                                // },
                              ),
                              Align(
                                alignment: Alignment(0, 1),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: SmoothPageIndicator(
                                    controller: pageViewController,
                                    // count: pageViewAdRecordList.length,
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
                      );
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Text(
                'Категории',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Playfair Display',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            StreamBuilder<List>(
              //<CategoriesRecord>
              //stream: queryCategoriesRecord(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                // List<CategoriesRecord> rowCategoriesRecordList =
                //     snapshot.data;
                if (snapshot.data.isEmpty) {
                  return Container(
                    height: 100,
                    child: Center(
                      child: Text('No results.'),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(10, (rowIndex) {
                        //rowCategoriesRecordList.length
                        //final rowCategoriesRecord =
                        //rowCategoriesRecordList[rowIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SearchPageWidget(
                                          //text: rowCategoriesRecord,
                                          ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    // child: Image.network(
                                    //   rowCategoriesRecord.imgUrl,
                                    //   width:
                                    //       MediaQuery.of(context).size.width,
                                    //   height: MediaQuery.of(context)
                                    //           .size
                                    //           .height *
                                    //       1,
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
                              // child: Text(
                              //   rowCategoriesRecord.text,
                              //   style: FlutterFlowTheme.bodyText1.override(
                              //     fontFamily: 'Playfair Display',
                              //   ),
                              // ),
                            )
                          ],
                        );
                      }),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
              child: Text(
                'Новинки',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Playfair Display',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            StreamBuilder<List>(
              //<SalonsRecord>
              //stream: querySalonsRecord(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                // List<SalonsRecord> rowSalonsRecordList = snapshot.data;
                if (snapshot.data.isEmpty) {
                  return Container(
                    height: 100,
                    child: Center(
                      child: Text('No results.'),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(10, //rowSalonsRecordList.length
                        (rowIndex) {
                      //final rowSalonsRecord = rowSalonsRecordList[rowIndex];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
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
                                  borderRadius: BorderRadius.circular(20),
                                  // child: Image.network(
                                  //   rowSalonsRecord.frontImage,
                                  //   width:
                                  //       MediaQuery.of(context).size.width,
                                  //   height:
                                  //       MediaQuery.of(context).size.height *
                                  //           1,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            // child: Text(
                            //   rowSalonsRecord.salonName,
                            //   style: FlutterFlowTheme.bodyText1.override(
                            //     fontFamily: 'Playfair Display',
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            // ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            // child: Text(
                            //   rowSalonsRecord.salonStreet,
                            //   style: FlutterFlowTheme.bodyText1.override(
                            //     fontFamily: 'Playfair Display',
                            //   ),
                            // ),
                          )
                        ],
                      );
                    }),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
              child: Text(
                'Популярные',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Playfair Display',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            StreamBuilder<List>(
              //<SalonsRecord>
              //stream: querySalonsRecord(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                //List<SalonsRecord> rowSalonsRecordList = snapshot.data;
                if (snapshot.data.isEmpty) {
                  return Container(
                    height: 100,
                    child: Center(
                      child: Text('No results.'),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(10, //rowSalonsRecordList.length
                        (rowIndex) {
                      // final rowSalonsRecord = rowSalonsRecordList[rowIndex];
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SalonPageWidget(
                                          // idsalon: rowSalonsRecord.reference,
                                          ),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  // child: Image.network(
                                  //   rowSalonsRecord.frontImage,
                                  //   width:
                                  //       MediaQuery.of(context).size.width,
                                  //   height:
                                  //       MediaQuery.of(context).size.height *
                                  //           1,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            // child: Text(
                            //   rowSalonsRecord.salonName,
                            //   style: FlutterFlowTheme.bodyText1.override(
                            //     fontFamily: 'Playfair Display',
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w600,
                            //   ),
                            // ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            // child: Text(
                            //   rowSalonsRecord.salonStreet,
                            //   style: FlutterFlowTheme.bodyText1.override(
                            //     fontFamily: 'Playfair Display',
                            //   ),
                            // ),
                          )
                        ],
                      );
                    }),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
