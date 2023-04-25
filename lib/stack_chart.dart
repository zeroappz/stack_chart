library stack_chart;

export 'src/stack_chart_base.dart';

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class MacStackChart extends StatelessWidget {
  List<dynamic> booked_status = [];
  // List<ChartData> data_value = [];\
  var data = "impromptu";
  var diffs = "10";
  var onPressed;
  // final Widget child;
  // var style;
  var indexSplitup;

  dynamic time3;
  dynamic time5;

  MacStackChart(
      {Key? key, @required this.onPressed, @required this.indexSplitup})
      // required this.child
      // this.style
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                    child: Text(
                      "Bookings & Occupancy Chart",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                SizeConfig.blockSizeHorizontal! * 3,
                SizeConfig.blockSizeVertical! * 2,
                SizeConfig.blockSizeHorizontal! * 3,
                0,
              ),
              child: Material(
                color: const Color(0xFFFFFFFF),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.58,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF000000).withAlpha(60),
                              blurRadius: 6.0,
                              spreadRadius: 0.0,
                              offset: const Offset(
                                0.0,
                                3.0,
                              ),
                            ),
                          ]),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.36,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                // Time
                                // DateTime now = DateTime.now();
                                // String formattedDate =
                                //     DateFormat('yyyy-MM-dd').format(now);
                                // var d1 =
                                //     bookedStatus[index]['time'].split(' - ');
                                // String formattedDate1 =
                                //     "$formattedDate ${d1[0]}:00";
                                // String formattedDate2 =
                                //     "$formattedDate ${d1[1]}:00";
                                // String start = DateFormat('h a')
                                //     .format(DateTime.parse(formattedDate1));
                                // String end = DateFormat('h a')
                                //     .format(DateTime.parse(formattedDate2));
                                // time3 = start;
                                // time5 = end;
                                // dynamic time1 =
                                //     booked_status[index]["time"].split("-");
                                // time3 = time1[0];
                                // time5 = time1[1].replaceAll(" ", "");
                                if (indexSplitup.length == 0) {
                                  return null;
                                } else {
                                  return Column(children: [
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0,
                                            SizeConfig.blockSizeVertical! * 0.5,
                                            0,
                                            0),
                                        child: Text(
                                          time5 ?? "",
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    1.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    Container(
                                      margin: EdgeInsetsDirectional.all(0),
                                      width: MediaQuery.of(context).size.width *
                                          0.11,
                                      child: ListView.builder(
                                        reverse: true,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: indexSplitup,
                                        itemBuilder: (context, index1) {
                                          // dynamic time = bookedStatus[index]
                                          //         ['split_up'][0]["time"]
                                          //     .split("-");

                                          // String start = time.first;
                                          // String end = time.last;
                                          // String starttime =
                                          //     start.replaceAll(" ", "");
                                          // String endtime =
                                          //     end.replaceAll(" ", "");
                                          // DateFormat dateformate =
                                          //     DateFormat("yyyy-MM-dd");
                                          // var date = dateformate
                                          //     .format(DateTime.now());
                                          // DateTime s = DateTime.parse(
                                          //     "$date $starttime:00");
                                          // DateTime e = DateTime.parse(
                                          //     "$date $endtime:00");
                                          // Duration diff = e.difference(s);
                                          if (indexSplitup.length != 0) {
                                            try {
                                              return stackWidget(6, context);
                                            } catch (e) {
                                              return SizedBox();
                                            }
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0,
                                            SizeConfig.blockSizeVertical! * 0.5,
                                            0,
                                            0),
                                        child: Text(
                                          time3 ?? "",
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    1.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ]);
                                }
                              },
                            ),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0,
                                      SizeConfig.blockSizeVertical! * 0, 0, 0),
                                  child: Text(
                                    "VALUE OF ONE ",
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical! * 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                                height:
                                    MediaQuery.of(context).size.width * 0.07,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF21B000),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0,
                                      SizeConfig.blockSizeVertical! * 0, 0, 0),
                                  child: Text(
                                    "  = $diffs MINS",
                                    style: TextStyle(
                                      fontFamily: 'geometric sans-serif',
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeVertical! * 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ]),
                        Divider(
                          thickness: 0.8,
                          color: Color(0xFFDFE1E7),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Column(children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 40,
                                      child: Row(
                                        children: [
                                          Container(
                                              margin:
                                                  EdgeInsetsDirectional.all(10),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              height: SizeConfig
                                                      .blockSizeVertical! *
                                                  2.4,
                                              color: const Color(0xFFF75C1E)),
                                          Text(
                                            "Online",
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 40,
                                      child: Row(children: [
                                        Container(
                                            margin:
                                                EdgeInsetsDirectional.all(10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            height:
                                                SizeConfig.blockSizeVertical! *
                                                    2.4,
                                            color: const Color(0xFFD9177E)),
                                        Text(
                                          "Walk-In",
                                        ),
                                      ]))
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 40,
                                      child: Row(children: [
                                        Container(
                                            margin:
                                                EdgeInsetsDirectional.all(10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            height:
                                                SizeConfig.blockSizeVertical! *
                                                    2.4,
                                            color: const Color(0xFF21B000)),
                                        Text(
                                          "Available",
                                        ),
                                      ])),
                                  SizedBox(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 40,
                                      child: Row(children: [
                                        Container(
                                            margin:
                                                EdgeInsetsDirectional.all(10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            height:
                                                SizeConfig.blockSizeVertical! *
                                                    2.4,
                                            color: const Color.fromARGB(
                                                255, 238, 226, 59)),
                                        Text(
                                          "Advance",
                                        ),
                                      ]))
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 40,
                                      child: Row(children: [
                                        Container(
                                            margin:
                                                EdgeInsetsDirectional.all(10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            height:
                                                SizeConfig.blockSizeVertical! *
                                                    2.4,
                                            color: const Color(0xFFF70000)),
                                        Text(
                                          "Cancelled",
                                        ),
                                      ])),
                                  SizedBox(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 40,
                                      child: Row(children: [
                                        Container(
                                            margin:
                                                EdgeInsetsDirectional.all(10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            height:
                                                SizeConfig.blockSizeVertical! *
                                                    2.4,
                                            color: const Color(0xFFE2E5EC)),
                                        Text(
                                          "Expired",
                                        ),
                                      ])),
                                ])
                          ]),
                        ),
                      ])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stackWidget(data, context) {
    return Container(
        margin: EdgeInsetsDirectional.all(10),
        width: MediaQuery.of(context).size.width * 0.05,
        height: 20,
        color: data == 'impromptu'
            ? Colors.orange
            : data == 'Expired'
                ? Colors.grey
                : Colors.pink);
  }
}

class SizeConfig {
  /// Size Config is usd for loading the dynamic sizes
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = (screenWidth! / 100);
    blockSizeVertical = screenHeight! / 100;

    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;
  }
}
