import 'package:flutter/material.dart';

class ChartStatus {
  String? _type;
  Colors? _color;

  ChartStatus({String? type, Colors? color}) {
    _type = type;
    _color = color;
  }

  String get type => _type!;
  set type(String type) => _type = type;
  Colors get color => _color!;
  set color(Colors color) => _color = color;

  ChartStatus.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['color'] = _color;
    return data;
  }
}
