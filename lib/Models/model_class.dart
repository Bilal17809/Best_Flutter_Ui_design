class BarChartDataModel {
  final List<DayData> days;
  BarChartDataModel({required this.days});
  factory BarChartDataModel.fromJson(Map<String, dynamic> json) {
    return BarChartDataModel(
      days: List<DayData>.from(
        json['days'].map((dayData) => DayData.fromJson(dayData)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'days': days.map((day) => day.toJson()).toList(),
    };
  }
}

class DayData {
  final String day;
  final List<dynamic> values;
  DayData({required this.day, required this.values});
  factory DayData.fromJson(Map<String, dynamic> json) {
    // print("Parsing DayData: $json");
    return DayData(
      day: json['day'],
      values: List<dynamic>.from(json['values']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'values': values,
    };
  }
}



