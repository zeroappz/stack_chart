library stack_chart;

export 'src/stack_chart_base.dart';

import 'package:flutter/material.dart';

class MacStackChart extends StatelessWidget {
  List<dynamic> booked_status = [];
  final chartTitle;
  final data = ["impromptu"];
  MacStackChart({
    Key? key,
    this.chartTitle
  })
  : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      this.chartTitle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                30,20,30,
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
                    height: MediaQuery.of(context).size.height * 0.70,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.40,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const ClampingScrollPhysics(),
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0,
                                            20,
                                            0,
                                            0),
                                        child: Text(
                                          "7 AM",
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsetsDirectional.all(5),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.10,
                                        child: ListView.builder(
                                          reverse: true,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: 6,
                                          itemBuilder: (context, index1) {
                                            return Container(
                                                margin: EdgeInsetsDirectional.all(10),
                                                width: MediaQuery.of(context).size.width * 0.06,
                                                height: 24,
                                                color: data == 'impromptu'
                                                    ? Colors.pinkAccent
                                                    : data == 'Expired'
                                                        ? Colors.grey
                                                        : Colors.pink);
                                            // stackWidget(
                                            //     "trymd", context);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0,
                                            5,
                                            0,
                                            0),
                                        child: Text(
                                          "6 AM",
                                          style: TextStyle(
                                            fontFamily: 'geometric sans-serif',
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
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, 0, 0, 0),
                              child: Text(
                                "VALUE OF ONE ",
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.05,
                              height: MediaQuery.of(context).size.width * 0.07,
                              decoration: const BoxDecoration(
                                color: Color(0xFF21B000),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, 0, 0, 0),
                              child: Text(
                                "  = 10 MINS",
                                style: TextStyle(
                                  fontFamily: 'geometric sans-serif',
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
                              horizontal: 5, vertical: 0),
                          child: Column(
                            children: [
                              

                              ListView.builder(
                                          reverse: true,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: 3,
                                          itemBuilder: (context, index1) {
                                            return 
                                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                              width: 120,
                                              child: Row(
                                                children: [
                                                  Container(
                                                      margin:
                                                          EdgeInsetsDirectional.all(10),
                                                      width: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.05,
                                                      height:
                                                          20,
                                                      color: const Color(0xFFF75C1E)),
                                                  Text(
                                                    "Online",
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                    width: 120,
                                    child: Row(
                                      children: [
                                        Container(
                                            margin:
                                                EdgeInsetsDirectional.all(10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            height:
                                                20,
                                            color: const Color.fromARGB(
                                                255, 238, 226, 59)),
                                        Text(
                                          "Advance",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],);
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

  Widget stackWidget(data, context) {
    return Container(
        margin: EdgeInsetsDirectional.all(10),
        width: MediaQuery.of(context).size.width * 0.06,
        height: 24,
        color: data == 'impromptu'
            ? Colors.orange
            : data == 'Expired'
                ? Colors.grey
                : Colors.pink);
  }
}