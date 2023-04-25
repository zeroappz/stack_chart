class ChartData {
  String _startTime;
  String _endTime;
  List<String> _splitUp;

  ChartData({String startTime, String endTime, List<String> splitUp}) {
    this._startTime = startTime;
    this._endTime = endTime;
    this._splitUp = splitUp;
  }

  String get startTime => _startTime;
  set startTime(String startTime) => _startTime = startTime;
  String get endTime => _endTime;
  set endTime(String endTime) => _endTime = endTime;
  List<String> get splitUp => _splitUp;
  set splitUp(List<String> splitUp) => _splitUp = splitUp;

  ChartData.fromJson(Map<String, dynamic> json) {
    _startTime = json['start.time'];
    _endTime = json['end.time'];
    _splitUp = json['split_up'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start.time'] = this._startTime;
    data['end.time'] = this._endTime;
    data['split_up'] = this._splitUp;
    return data;
  }
}