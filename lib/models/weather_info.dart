class WeatherInfoModel {
  final String city;
  final DateTime tiame;
  final String icon;
  final double avrTamp;
  final double minTamp;
  final double maxTamp;
  final String condition;
  const WeatherInfoModel({
    required this.tiame,
    required this.icon,
    required this.avrTamp,
    required this.minTamp,
    required this.maxTamp,
    required this.condition,
    required this.city,
  });

  factory WeatherInfoModel.fromJson(json) {
    return WeatherInfoModel(
      tiame: DateTime.parse(json['current']['last_updated']),
      icon: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      avrTamp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTamp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTamp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      city: json['location']['name'],
    );
  }
}
