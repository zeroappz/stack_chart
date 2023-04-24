library stack_chart;

export 'src/stack_chart_base.dart';

import 'package:flutter/material.dart';

class MacStackChart extends StatelessWidget {
  List<dynamic> booked_status = [];
  // List<ChartData> data_value = [];\
  var data = "impromptu";

  var onPressed;
  // final Widget child;
  // var style;
  MacStackChart({Key? key, @required this.onPressed})
      // required this.child
      // this.style
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        15,
        15,
        15,
        0,
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.31,
            // width:double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              itemCount: booked_status.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsetsDirectional.all(7),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.11,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, data) {
                      return stackWidget(data, context);
                    },
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsetsDirectional.all(10),
                width: MediaQuery.of(context).size.width * 0.05,
                height: 20,
                color: Colors.pink,
              ),
              Text(
                "Trym'd Booking",
              ),
              Container(
                  margin: EdgeInsetsDirectional.all(10),
                  width: MediaQuery.of(context).size.width * 0.05,
                  height: 20,
                  color: Colors.orange),
              Text(
                "Walkin Booking",
              ),
            ],
          ),
        ],
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
