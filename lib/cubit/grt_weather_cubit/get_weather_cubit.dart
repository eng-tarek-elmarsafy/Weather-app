import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app/cubit/grt_weather_cubit/get_weather_state.dart';

import '../../models/weather_info.dart';
import '../../service/get_data.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
   WeatherInfoModel? weatherInfoModel;
  getWeather(String cityName) async {
    try {
      weatherInfoModel = await GetData(dio: Dio()).getService(cityName);

      emit(WeatherLoadedState(weatherInfoModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
