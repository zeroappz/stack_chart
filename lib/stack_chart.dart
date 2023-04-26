library stack_chart;

export 'src/stack_chart_base.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MacStackChart extends StatelessWidget {
  final List<ChartData> chartData;
  final String chartTitle;
  final TextStyle? style;
  final ValueOfOne valueOfOne;
  final List<ChartText> chartText;
  final double? containerHeight;
  final double? containerWidth;
  final String? dateFormat;
  final Color? backgroundColor;
  final Color? chartBackgroundColor;

  MacStackChart(
      {Key? key,
      required this.chartTitle,
      this.style,
      required this.chartData,
      required this.chartText,
      required this.valueOfOne,
      this.containerHeight,
      this.containerWidth,
      this.backgroundColor,
      this.chartBackgroundColor,
      this.dateFormat})
      : super(key: key);

  int columnContainersCount = 0;

  @override
  Widget build(BuildContext context) {
    double containerOneHeight = 0.0;
    if (chartData.isEmpty) {
      columnContainersCount = 0;
    } else {
      List bookedlength = [];
      for (var element in chartData) {
        bookedlength.add(element.splitUps.length);
      }
      bookedlength.sort();
      columnContainersCount = bookedlength[bookedlength.length - 1];
      if (columnContainersCount == 0) {
        containerOneHeight = MediaQuery.of(context).size.height * 0.0;
      } else {
        double two = 0.10;
        for (int i = 0; i < columnContainersCount; i++) {
          two = two + 0.035;
          containerOneHeight = MediaQuery.of(context).size.height * two;
        }
      }
    }

    return Container(
      decoration:  BoxDecoration(
        color: backgroundColor??Colors.white,
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
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color:chartBackgroundColor?? const Color(0xFFFFFFFF),
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
                      if (chartData.isEmpty) const SizedBox(height: 30),
                      if (chartData.isEmpty)
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
                      if (chartData.isEmpty) const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: SizedBox(
                          height: containerOneHeight,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              itemCount: chartData.length,
                              itemBuilder: (context, index) {
                                String start = DateFormat(dateFormat ?? "h a")
                                    .format(DateTime.parse(
                                        chartData[index].startTime));
                                String end = DateFormat(dateFormat ?? "h a")
                                    .format(DateTime.parse(
                                        chartData[index].endTime));

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
                                          if (chartData[index]
                                              .splitUps
                                              .isNotEmpty) {
                                            try {
                                              return stackWidget(
                                                  context,
                                                  chartData[index]
                                                      .splitUps[index1]);
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
                      // SizedBox(height: 20.0),
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
                              color: valueOfOne.color,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "  = ${valueOfOne.time}",
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
                              itemCount: chartText.length,
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: false,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 24,
                                      childAspectRatio: (1 / .4),
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
                                                    0.055,
                                            height: containerHeight ??
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.035,
                                            color: chartText[index].color),
                                        Text(
                                          chartText[index].type,
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

  Widget stackWidget(context, [data]) {
    Color color = chartBackgroundColor?? Colors.white;
    if (data != null) {
      for (var item in chartText) {
        String key = data.toLowerCase();
        String itemKey = item.type.toLowerCase();
        if (key == itemKey) {
          color = item.color;
        }
      }
    }

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0.25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.035,
        color: color);
  }
}

class ChartData {
  String startTime;
  String endTime;
  List<String> splitUps;
  ChartData(this.startTime, this.endTime, this.splitUps);
}

class ChartText {
  String type;
  Color color;
  ChartText(this.type, this.color);
}

class ValueOfOne {
  String time;
  Color color;
  ValueOfOne(this.time, this.color);
}
