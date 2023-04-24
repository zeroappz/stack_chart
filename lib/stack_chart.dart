library stack_chart;

export 'src/stack_chart_base.dart';

import 'package:flutter/material.dart';

class MacinCodeButton extends StatelessWidget {
  var onPressed;
  final Widget child;
  var style;
  MacinCodeButton(
      {Key? key, @required this.onPressed, required this.child, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16.0),
          backgroundColor: Colors.pinkAccent,
          elevation: 9.0,
          textStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
        child: child);
  }
}
