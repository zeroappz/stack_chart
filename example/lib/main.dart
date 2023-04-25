import 'package:flutter/material.dart';
import 'package:stack_chart/stack_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  @override
  void initState() {
    super.initState();
  }

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
              chartTitle: "Stacked Chart",
              dateFormat: "h a",
              chartData: const [
                {
                  "start_time": "2023-02-12 10:00:00",
                  "end_time": "2023-02-12 13:00:00",
                  "split_up": [
                    "male",
                    "female",
                    "male",
                    "female",
                    "male",
                    "female"
                  ]
                },
                {
                  "start_time": "2023-02-12 10:00:00",
                  "end_time": "2023-02-12 13:00:00",
                  "split_up": [
                    "male",
                    "female",
                    "male",
                    "female",
                    "male",
                    "female"
                  ]
                },
                {
                  "start_time": "2023-02-12 10:00:00",
                  "end_time": "2023-02-12 13:00:00",
                  "split_up": [
                    "male",
                    "female",
                    "male",
                    "female",
                    "male",
                    "female"
                  ]
                },
                {
                  "start_time": "2023-02-12 10:00:00",
                  "end_time": "2023-02-12 13:00:00",
                  "split_up": [
                    "male",
                    "female",
                    "male",
                    "female",
                    "male",
                    "female"
                  ]
                },
                {
                  "start_time": "2023-02-12 10:00:00",
                  "end_time": "2023-02-12 13:00:00",
                  "split_up": [
                    "male",
                    "female",
                    "male",
                    "female",
                    "male",
                    "female"
                  ]
                },
                {
                  "start_time": "2023-02-12 10:00:00",
                  "end_time": "2023-02-12 13:00:00",
                  "split_up": [
                    "male",
                    "female",
                    "male",
                    "female",
                    "male",
                    "female"
                  ]
                },
              ],
              onlineData: const [
                {"type": "Male", "color": Colors.red},
                {"type": "Female", "color": Colors.pink},
                {"type": "Transgender", "color": Colors.yellow},
              ],
              containerHeight: MediaQuery.of(context).size.height * 0.023,
              containerWidth: MediaQuery.of(context).size.width * 0.03,
              valueOfOne: const {"time": "10 Mins", "color": Colors.amber},
              style: const TextStyle(
                fontFamily: "geometric sans-serif",
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
