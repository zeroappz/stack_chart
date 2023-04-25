class ChartStatus {
  String _type;
  Colors _color;

  ChartStatus({String type, Colors color}) {
    this._type = type;
    this._color = color;
  }

  String get type => _type;
  set type(String type) => _type = type;
  Colors get color => _color;
  set color(Colors color) => _color = color;

  ChartStatus.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['color'] = this._color;
    return data;
  }
}