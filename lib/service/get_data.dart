import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:waether_app/models/weather_info.dart';

class GetData {
  final Dio dio;

  const GetData({required this.dio});
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String key = '98abbb3a892145008a6130348241812';

  getService(String city) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$key&q=$city&days=1&aqi=no&alerts=no');

      WeatherInfoModel model = WeatherInfoModel.fromJson(response.data);

      return model;
    } on DioException catch (e) {
      final String erorrMessage = e.response?.data['error']['message'] ??
          'Oops there was an erroe, try later';
      throw Exception(erorrMessage);
    } catch (e) {
      log(e.toString());
      return 'Oops there was an erroe, try later';
    }
  }
}
