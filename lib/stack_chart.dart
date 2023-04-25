library stack_chart;

export 'src/stack_chart_base.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MacStackChart extends StatelessWidget {
  final List<Map<String, dynamic>> bookedDetails;
  final String chartTitle;
  final TextStyle? style;
  final Map<String, dynamic> valueOfOne;
  final List<Map<String, dynamic>> onlineData;
  final double? containerHeight;
  final double? containerWidth;
  final String? dateFormat;

  MacStackChart(
      {Key? key,
      required this.chartTitle,
      this.style,
      required this.bookedDetails,
      required this.onlineData,
      required this.valueOfOne,
      this.containerHeight,
      this.containerWidth,
      required this.dateFormat
      })
      : super(key: key);

  int columnContainersCount = 6;

  @override
  Widget build(BuildContext context) {
    columnContainersCount = bookedDetails.isEmpty ? 0 : 6;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
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
                    chartTitle,
                    style: style ??
                        TextStyle(
                          fontFamily: "geometric sans-serif",
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.all(20),
            child: Material(
              color: const Color(0xFFFFFFFF),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  height: columnContainersCount == 6
                      ? MediaQuery.of(context).size.height * 0.72
                      : columnContainersCount == 5
                          ? MediaQuery.of(context).size.height * 0.52
                          : columnContainersCount == 4
                              ? MediaQuery.of(context).size.height * 0.46
                              : columnContainersCount == 0
                                  ? MediaQuery.of(context).size.height * 0.50
                                  : MediaQuery.of(context).size.height * 0.44,
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
                    ],
                  ),
                  child: Column(
                    children: [
                      if (bookedDetails.isEmpty) const SizedBox(height: 80),
                      if (bookedDetails.isEmpty)
                        Text(
                          "No data available",
                          style: style ??
                              TextStyle(
                                fontFamily: "geometric sans-serif",
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      if (bookedDetails.isEmpty) const SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: SizedBox(
                          height: columnContainersCount == 6
                              ? MediaQuery.of(context).size.height * 0.44
                              : columnContainersCount == 5
                                  ? MediaQuery.of(context).size.height * 0.32
                                  : columnContainersCount == 4
                                      ? MediaQuery.of(context).size.height *
                                          0.26
                                      : columnContainersCount == 0
                                          ? MediaQuery.of(context).size.height *
                                              0.0
                                          : MediaQuery.of(context).size.height *
                                              0.23,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              itemCount: bookedDetails.length,
                              itemBuilder: (context, index) {
                                  String start = DateFormat(dateFormat).format(DateTime.parse(bookedDetails[index]['start.time']));
                                  String end = DateFormat(dateFormat).format(DateTime.parse(bookedDetails[index]['end.time']));

                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                      child: Text(
                                        end,
                                        style: style ??
                                            TextStyle(
                                              fontFamily:
                                                  "geometric sans-serif",
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsetsDirectional.all(6),
                                      width: MediaQuery.of(context).size.width *
                                          0.11,
                                      child: ListView.builder(
                                        reverse: true,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: columnContainersCount,
                                        itemBuilder: (context, index1) {
                                          if (bookedDetails[index]
                                                                ['split_up']
                                                            .length !=
                                                        0) {
                                                      try {
                                                        return stackWidget(context,
                                                            bookedDetails[index]
                                                                    ['split_up']
                                                                [index1]);
                                                      } catch (e) {
                                                        return stackWidget(context);
                                                      }
                                                    } else {
                                                      return Container();
                                                    }
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                        start,
                                        style: style ??
                                            TextStyle(
                                              fontFamily:
                                                  "geometric sans-serif",
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "VALUE OF ONE ",
                              style: style ??
                                  TextStyle(
                                    fontFamily: "geometric sans-serif",
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Container(
                            width: containerWidth ??
                                MediaQuery.of(context).size.width * 0.03,
                            height: containerHeight ??
                                MediaQuery.of(context).size.height * 0.023,
                            decoration: BoxDecoration(
                              color: valueOfOne['color'],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "  = ${valueOfOne['time']}",
                              style: style ??
                                  TextStyle(
                                    fontFamily: "geometric sans-serif",
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 0.8,
                        color: Color(0xFFDFE1E7),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: Column(
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              itemCount: onlineData.length,
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: false,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 24,
                                      childAspectRatio: (1 / .3),
                                      mainAxisSpacing: 0),
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin:
                                                const EdgeInsetsDirectional.all(
                                                    10),
                                            width: containerWidth ??
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.03,
                                            height: containerHeight ??
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.023,
                                            color: onlineData[index]['color']),
                                        Text(
                                          onlineData[index]['type'],
                                          style: style ??
                                              TextStyle(
                                                fontFamily:
                                                    "geometric sans-serif",
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )
                                      ],
                                    ));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget stackWidget( context,[data]) {
    return Container(
        margin: EdgeInsetsDirectional.all(10),
        width: MediaQuery.of(context).size.width,
        height: 30,
        color: data == 'impromptu'
            ? Colors.orange
            : data == 'Expired'
                ? Colors.grey
                : Colors.pink);
  }
}