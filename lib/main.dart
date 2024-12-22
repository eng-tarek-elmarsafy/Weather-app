import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app/cubit/grt_weather_cubit/get_weather_cubit.dart';
import 'package:waether_app/views/home_view.dart';

import 'cubit/grt_weather_cubit/get_weather_state.dart';

void main() async {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(elevation: 0),
                useMaterial3: false,
                primarySwatch: getMaterialColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherInfoModel
                        ?.condition),
              ),
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getMaterialColor(String? weather) {
  switch (weather) {
    case null:
      return Colors.blue;
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.blueGrey;
    case 'Cloudy':
      return Colors.grey;
    case 'Mist':
    case 'Overcast':
      return Colors.teal;
    case 'Patchy rain possible':
      return Colors.lightBlue;
    case 'Patchy snow possible':
      return Colors.blue;
    case 'Patchy sleet possible':
      return Colors.cyan;
    case 'Thundery outbreaks possible':
    case 'Patchy freezing drizzle possible':
      return Colors.deepPurple;
    case 'Blowing snow':
      return Colors.indigo;
    case 'Fog':
    case 'Blizzard':
      return Colors.brown;
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Light drizzle':
    case 'Patchy light drizzle':
      return Colors.blueGrey;
    case 'Freezing drizzle':
      return Colors.blue;
    case 'Patchy light rain':
    case 'Heavy freezing drizzle':
      return Colors.blue;
    case 'Light rain':
      return Colors.blue;
    case 'Moderate rain at times':
      return Colors.cyan;
    case 'Moderate rain':
      return Colors.brown;
    case 'Heavy rain at times':
      return Colors.indigo;
    case 'Heavy rain':
      return Colors.deepPurple;
    case 'Light freezing rain':
      return Colors.lightBlue;
    case 'Moderate or heavy freezing rain':
      return Colors.blueGrey;
    case 'Light sleet':
      return Colors.cyan;
    case 'Moderate or heavy sleet':
      return Colors.indigo;
    case 'Patchy light snow':
      return Colors.lightBlue;
    case 'Light snow':
      return Colors.blue;
    case 'Patchy moderate snow':
      return Colors.blueGrey;
    case 'Moderate snow':
      return Colors.indigo;
    case 'Patchy heavy snow':
      return Colors.deepPurple;
    case 'Heavy snow':
      return Colors.grey;
    case 'Ice pellets':
      return Colors.blueGrey;
    case 'Light rain shower':
      return Colors.cyan;
    case 'Moderate or heavy rain shower':
      return Colors.blue;
    case 'Torrential rain shower':
      return Colors.indigo;
    case 'Light sleet showers':
      return Colors.lightBlue;
    case 'Moderate or heavy sleet showers':
      return Colors.cyan;
    case 'Light snow showers':
      return Colors.blue;
    case 'Moderate or heavy snow showers':
      return Colors.indigo;
    case 'Light showers of ice pellets':
      return Colors.blue;
    case 'Moderate or heavy showers of ice pellets':
      return Colors.deepPurple;
    case 'Patchy light rain with thunder':
      return Colors.orange;
    case 'Moderate or heavy rain with thunder':
      return Colors.red;
    case 'Patchy light snow with thunder':
      return Colors.blue;
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.grey; // اللون الافتراضي للحالات غير المعروفة
  }
}
