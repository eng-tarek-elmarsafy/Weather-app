import 'package:waether_app/models/weather_info.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherInfoModel weatherInfoModel;
   WeatherLoadedState(this.weatherInfoModel);
}

class WeatherFailureState extends WeatherState {}
