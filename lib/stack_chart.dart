library stack_chart;

export 'src/stack_chart_base.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

/// Creates Stack Chart
/// [chartData], [chartLabel], [chartTitle] & [chartText] must be provided and must not be null
class MacStackChart extends StatefulWidget {
  /// Default Constructor for [MacStackChart] that process all the given information to the well designed Stack chart
  ///
  const MacStackChart(
      {Key? key,
      required this.chartTitle,
      this.style,
      required this.chartData,
      required this.chartLabel,
      required this.chartText,
      this.containerHeight,
      this.containerWidth,
      this.backgroundColor,
      this.chartBackgroundColor,
      this.dateFormat})
      : super(key: key);

  /// chartData used for loading information to your chart design
  final List<ChartData> chartData;

  /// chartTitle used for chart title
  final String chartTitle;

  /// style used for chart text style includes fontSize, fontColor, fontWeight & much more
  final TextStyle? style;

  /// chartText used for horizontal split up difference between each hour. say 10 minutes * 6 = 6 slots per hour
  final ChartText chartText;

  /// chartLabel used for label representation for the data provided
  final List<ChartLabel> chartLabel;

  /// containerHeight used for sample color container's height
  final double? containerHeight;

  /// containerWidth used for sample color container's width
  final double? containerWidth;

  /// dateFormat used for changing the Date Format (credits: intl dart package), defaults to 'h a'
  final String? dateFormat;

  /// backgroundColor used for changing the chart's overall widget's background color
  final Color? backgroundColor;

  /// chartBackgroundColor used for changing the chart's section background color
  final Color? chartBackgroundColor;

  @override
  State<MacStackChart> createState() => _MacStackChartState();
}

class _MacStackChartState extends State<MacStackChart> {
  int macStackCount = 0;

  /// The function calculates the height of a container based on the number of
  /// elements in a chart data list.
  ///
  /// Args:
  ///   context (BuildContext): The `context` parameter is an object that
  /// provides access to various information about the current build context,
  /// such as the theme, media queries, and localization.
  ///
  /// It is typically used to retrieve information or perform actions related
  /// to the current state of the app.
  @override
  Widget build(BuildContext context) {
    double containerOneHeight = 0.0;
    if (widget.chartData.isEmpty) {
      macStackCount = 0;
    } else {
      List chartDataList = [];
      for (var element in widget.chartData) {
        chartDataList.add(element._splitUps!.length);
      }
      chartDataList.sort();
      macStackCount = chartDataList[chartDataList.length - 1];
      if (macStackCount == 0) {
        containerOneHeight = MediaQuery.of(context).size.height * 0.0;
      } else {
        double two = 0.10;
        for (int i = 0; i < macStackCount; i++) {
          two = two + 0.035;
          containerOneHeight = MediaQuery.of(context).size.height * two;
        }
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
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
                    widget.chartTitle,
                    style: widget.style ?? chartTextStyle(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.all(20),
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
                    color:
                        widget.chartBackgroundColor ?? const Color(0xFFFFFFFF),
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
                      if (widget.chartData.isEmpty) const SizedBox(height: 30),
                      if (widget.chartData.isEmpty)
                        Text(
                          'No data available',
                          style: widget.style ?? chartTextStyle(),
                        ),
                      if (widget.chartData.isEmpty) const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: SizedBox(
                          height: containerOneHeight,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              itemCount: widget.chartData.length,
                              itemBuilder: (context, index) {
                                final start = DateFormat(
                                        widget.dateFormat ?? 'h a')
                                    .format(DateTime.parse(
                                        widget.chartData[index]._startTime!));
                                final end =
                                    DateFormat(widget.dateFormat ?? 'h a')
                                        .format(DateTime.parse(
                                            widget.chartData[index]._endTime!));

                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 0),
                                      child: Text(
                                        end,
                                        style: widget.style ?? chartTextStyle(),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsetsDirectional.all(6),
                                      width: MediaQuery.of(context).size.width *
                                          0.11,
                                      child: ListView.builder(
                                        reverse: true,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: macStackCount,
                                        itemBuilder: (context, index1) {
                                          if (widget.chartData[index]._splitUps!
                                              .isNotEmpty) {
                                            try {
                                              return stackWidget(
                                                  context,
                                                  widget.chartData[index]
                                                      ._splitUps![index1]);
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
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                        start,
                                        style: widget.style ?? chartTextStyle(),
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
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "EACH STACK  ",
                              style: widget.style ?? chartTextStyle(),
                            ),
                          ),
                          Container(
                            width: widget.containerWidth ??
                                MediaQuery.of(context).size.width * 0.03,
                            height: widget.containerHeight ??
                                MediaQuery.of(context).size.height * 0.023,
                            decoration: BoxDecoration(
                              color: widget.chartText._color,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "  = ${widget.chartText._time!}",
                              style: widget.style ?? chartTextStyle(),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
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
                              itemCount: widget.chartLabel.length,
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: false,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 24,
                                      childAspectRatio: 1 / .4),
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsetsDirectional.all(
                                                  10),
                                          width: widget.containerWidth ??
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.055,
                                          height: widget.containerHeight ??
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.035,
                                          color: widget.chartLabel[index]._color
                                              as Color),
                                      Text(
                                        widget.chartLabel[index]._type!,
                                        style: widget.style ?? chartTextStyle(),
                                      )
                                    ],
                                  ),
                                );
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

  // ignore: type_annotate_public_apis
  /// The function `stackWidget` returns a container widget with a specified
  /// color, width, and height, based on the provided context and data.
  ///
  /// Args:
  ///   context: The `context` parameter is the build context of the widget.
  /// It is typically used to access the theme, media queries,
  /// and other properties of the widget's parent widget tree.
  ///
  ///   data: The `data` parameter is a variable that represents the data used
  /// to determine the color of the widget. It is expected to be a string value.
  ///
  /// Returns:
  ///   a Container widget.
  Widget stackWidget(dynamic context, [dynamic data]) {
    assert(context != null);
    assert(data != null);
    Color color = widget.chartBackgroundColor ?? Colors.white;
    if (data != null) {
      for (var item in widget.chartLabel) {
        String key = data.toLowerCase();
        String itemKey = item._type!.toLowerCase();
        if (key == itemKey) {
          color = item._color as Color;
        }
      }
    }

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0.25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.035,
        color: color);
  }

  TextStyle chartTextStyle() {
    return const TextStyle(
      fontFamily: "geometric sans-serif",
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
  }
}

/// ChartData Model collects and process the JSON based information
/// To update the chart design
class ChartData {
  final String? _startTime;
  final String? _endTime;
  final List<String>? _splitUps;

  /// Default Constructor for ChartData
  ChartData(this._startTime, this._endTime, this._splitUps);
}

/// ChartLabel Model collects and process the JSON based information
/// To update the dynamic chart Labels
class ChartLabel {
  final String? _type;
  final Color? _color;

  /// Default Constructor for ChartLabel
  ChartLabel(this._type, this._color, {bool dynamicColors = false});
}

/// ChartText Model collects and process the JSON based information
/// To update the dynamic chart time difference between each stack
/// and color for the stack to be filled
class ChartText {
  final String? _time;
  final Color? _color;

  /// Default Constructor for ChartText
  ChartText(this._time, this._color, {bool dynamicColors = false});
}

// /// DynamicChartLabel Model collects and process the JSON based information
// /// To update the dynamic chart Labels
// class DynamicChartLabel {
//   final String? _type;

//   /// Default Constructor for ChartLabel
//   DynamicChartLabel(this._type);
// }

// /// DynamicChartText Model collects and process the JSON based information
// /// To update the dynamic chart time difference between each stack
// /// and color for the stack to be filled
// class DynamicChartText {
//   final String? _time;

//   /// Default Constructor for ChartText
//   DynamicChartText(this._time);
// }

  // /// Dynamic Chart Fill Colors
  // List<DynamicChartLabel> chartDynamicColorLabel = [
  //   DynamicChartLabel("Male"),
  //   DynamicChartLabel("Female"),
  //   DynamicChartLabel("Transgender"),
  // ];

  // DynamicChartText dynamicChartText = DynamicChartText("10 Minutes");