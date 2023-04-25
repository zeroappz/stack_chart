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
              chartData: const [ 
                   {"start.time": "2023-02-12 10:00:00", "end.time": "2023-02-12 13:00:00","split_up":[
                    "impromptu","trymd","impromptu","trymd","impromptu","trymd"
                   ]},
                   {"start.time": "2023-02-12 10:00:00", "end.time": "2023-02-12 13:00:00","split_up":[
                    "impromptu","trymd","impromptu","trymd","impromptu","trymd"
                   ]},
                   {"start.time": "2023-02-12 10:00:00", "end.time": "2023-02-12 13:00:00","split_up":[
                    "impromptu","trymd","impromptu","trymd","impromptu","trymd"
                   ]},
                   {"start.time": "2023-02-12 10:00:00", "end.time": "2023-02-12 13:00:00","split_up":[
                    "impromptu","trymd","impromptu","trymd","impromptu","trymd"
                   ]},
                   {"start.time": "2023-02-12 10:00:00", "end.time": "2023-02-12 13:00:00","split_up":[
                    "impromptu","trymd","impromptu","trymd","impromptu","trymd"
                   ]},
                    {"start.time": "2023-02-12 10:00:00", "end.time": "2023-02-12 13:00:00","split_up":[
                    "impromptu","trymd","impromptu","trymd","impromptu","trymd"
                   ]},
                ],
                onlineData: const [
                  {"type": "Online", "color": Colors.red},
                  {"type": "Offline", "color": Colors.pink},
                  {"type": "WalkIn", "color": Colors.yellow},
                  {"type": "TelePhone", "color": Colors.black},
                  {"type": "Online", "color": Colors.green}
                ],
                containerHeight: MediaQuery.of(context).size.height * 0.023,
                containerWidth: MediaQuery.of(context).size.width * 0.03,
                valueOfOne: const {"time": "10 Mins", "color": Colors.amber},
                 style: const TextStyle(
                      fontFamily: "geometric sans-serif" ,
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
}