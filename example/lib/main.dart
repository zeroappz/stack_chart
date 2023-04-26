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
      title: 'Macincode Charts',
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
      "female",
      "male",
      "female",
      "transgender",
      "transgender",
    ]),
    ChartData("2023-02-12 11:00:00", "2023-02-12 12:00:00", [
      "male",
      "female",
      "female",
      "transgender",
      "male",
      "transgender",
    ]),
    ChartData("2023-02-12 12:00:00", "2023-02-12 13:00:00", [
      "male",
      "female",
      "transgender",
      "female",
      "male",
      "transgender",
    ]),
    ChartData("2023-02-12 13:00:00", "2023-02-12 14:00:00", [
      "male",
      "transgender",
      "female",
      "male",
      "female",
      "transgender",
    ]),
    ChartData("2023-02-12 14:00:00", "2023-02-12 15:00:00", [
      "male",
      "female",
      "female",
      "transgender",
      "male",
      "transgender",
    ]),
    ChartData("2023-02-12 15:00:00", "2023-02-12 16:00:00", [
      "male",
      "female",
      "transgender",
      "transgender",
      "male",
      "female",
    ]),
  ];

  List<ChartLabel> chartLabel = [
    ChartLabel("Male", Colors.red),
    ChartLabel("Female", Colors.green),
    ChartLabel("Transgender", Colors.yellow),
  ];
  ChartText chartText = ChartText("10 Minutes", Colors.amber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MacStackChart(
              chartTitle: "Bookings Stack Chart",
              dateFormat: "h a",
              chartData: chartData,
              chartLabel: chartLabel,
              containerHeight: MediaQuery.of(context).size.height * 0.035,
              containerWidth: MediaQuery.of(context).size.width * 0.05,
              chartText: chartText,
              backgroundColor: Colors.transparent,
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
