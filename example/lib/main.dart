import 'package:flutter/material.dart';
import 'package:stack_chart/stack_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Package',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ChartData> chartData = [
    ChartData("2023-02-12 10:00:00", "2023-02-12 11:00:00", [
      "male",
      "male",
      "male",
      "male",
      "male",
      "male",
      "male",
      "male",
      "male",
    ]),
    ChartData("2023-02-12 11:00:00", "2023-02-12 12:00:00", [
      "female",
    ]),
    ChartData("2023-02-12 12:00:00", "2023-02-12 13:00:00", [
      "transgender",
    ]),
    ChartData("2023-02-12 13:00:00", "2023-02-12 14:00:00", [
      "transgender",
    ]),
    ChartData("2023-02-12 14:00:00", "2023-02-12 15:00:00",
        ["transgender", "something"]),
    ChartData("2023-02-12 15:00:00", "2023-02-12 16:00:00", [
      "male",
    ]),
  ];

  List<ChartText> chartText = [
    ChartText("Male", Colors.red),
    ChartText("Female", Colors.green),
    ChartText("Transgender", Colors.yellow),
  ];
  ValueOfOne valueOfOne = ValueOfOne("10 Mins", Colors.amber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MacStackChart(
              chartTitle: "Bookings Chart",
              dateFormat: "h a",
              chartData: chartData,
              chartText: chartText,
              containerHeight: MediaQuery.of(context).size.height * 0.035,
              containerWidth: MediaQuery.of(context).size.width * 0.055,
              valueOfOne: valueOfOne,
              backgroundColor: Colors.white,
              chartBackgroundColor: Colors.white,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
