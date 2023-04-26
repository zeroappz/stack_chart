library stack_chart;

export 'src/stack_chart_base.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MacStackChart extends StatefulWidget {
  MacStackChart(
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
  final List<ChartData> chartData;
  final String chartTitle;
  final TextStyle? style;
  final ChartText chartText;
  final List<ChartLabel> chartLabel;
  final double? containerHeight;
  final double? containerWidth;
  final String? dateFormat;
  final Color? backgroundColor;
  final Color? chartBackgroundColor;

  @override
  State<MacStackChart> createState() => _MacStackChartState();
}

class _MacStackChartState extends State<MacStackChart> {
  int columnContainersCount = 0;

  @override
  Widget build(BuildContext context) {
    double containerOneHeight = 0.0;
    if (widget.chartData.isEmpty) {
      columnContainersCount = 0;
    } else {
      List bookedlength = [];
      for (var element in widget.chartData) {
        bookedlength.add(element._splitUps!.length);
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
                    style: widget.style ??
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
                          style: widget.style ??
                              TextStyle(
                                fontFamily: "geometric sans-serif",
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
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
                                final start =
                                    DateFormat(widget.dateFormat ?? 'h a')
                                        .format(DateTime.parse(
                                            widget.chartData[index].startTime));
                                final end =
                                    DateFormat(widget.dateFormat ?? 'h a')
                                        .format(DateTime.parse(
                                            widget.chartData[index].endTime));

                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                      child: Text(
                                        end,
                                        style: widget.style ??
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
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                        start,
                                        style: widget.style ??
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
                              style: widget.style ??
                                  TextStyle(
                                    fontFamily: "geometric sans-serif",
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Container(
                            width: widget.containerWidth ??
                                MediaQuery.of(context).size.width * 0.03,
                            height: widget.containerHeight ??
                                MediaQuery.of(context).size.height * 0.023,
                            decoration: BoxDecoration(
                              color: widget.chartText.color,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              "  = ${widget.chartText.type}",
                              style: widget.style ??
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
                              itemCount: widget.chartLabel.length,
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: false,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 24,
                                      childAspectRatio: 1 / .4),
                              itemBuilder: (context, index) {
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
                                            color: widget.chartLabel[index]
                                                .color as Color),
                                        Text(
                                          widget.chartLabel[index].type,
                                          style: widget.style ??
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
    Color color = widget.chartBackgroundColor ?? Colors.white;
    if (data != null) {
      for (var item in widget.chartLabel) {
        String key = data.toLowerCase();
        String itemKey = item.type.toLowerCase();
        if (key == itemKey) {
          color = item.color as Color;
        }
      }
    }

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0.25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.035,
        color: color);
  }
}

class ChartData {
  ChartData(String? startTime, String? endTime, List<String>? splitUp) {
    _startTime = startTime;
    _endTime = endTime;
    _splitUps = splitUp;
  }

  ChartData.fromJson(Map<String, dynamic> json) {
    _startTime = json['start.time'];
    _endTime = json['end.time'];
    _splitUps = json['split_up'].cast<String>();
  }
  String? _startTime;
  String? _endTime;
  List<String>? _splitUps;

  String get startTime => _startTime!;
  set startTime(String startTime) => _startTime = startTime;
  String get endTime => _endTime!;
  set endTime(String endTime) => _endTime = endTime;
  List<String> get splitUp => _splitUps!;
  set splitUp(List<String> splitUp) => _splitUps = splitUp;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start.time'] = _startTime;
    data['end.time'] = _endTime;
    data['split_up'] = _splitUps;
    return data;
  }
}

class ChartLabel {
  ChartLabel(String? type, Colors? color) {
    _type = type;
    _color = color;
  }

  ChartLabel.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _color = json['color'];
  }
  String? _type;
  Colors? _color;

  String get type => _type!;
  set type(String type) => _type = type;
  Colors get color => _color!;
  set color(Colors color) => _color = color;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['color'] = _color;
    return data;
  }
}

class ChartText {
  ChartText(String? type, Color? color) {
    if (type != null) {
      _type = type;
    }
    if (color != null) {
      _color = color;
    }
  }

  ChartText.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _color = json['color'];
  }
  String? _type;
  Color? _color;

  String? get type => _type;
  set type(String? type) => _type = type;
  Color? get color => _color;
  set color(Color? color) => _color = color;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['color'] = _color;
    return data;
  }
}
