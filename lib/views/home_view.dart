import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app/cubit/grt_weather_cubit/get_weather_cubit.dart';
import 'package:waether_app/cubit/grt_weather_cubit/get_weather_state.dart';
import 'package:waether_app/main.dart';
import 'package:waether_app/views/search_view.dart';
import 'package:waether_app/widgets/weather_info_body.dart';

import '../widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 35,
            ),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  getMaterialColor(BlocProvider.of<GetWeatherCubit>(context)
                          .weatherInfoModel
                          ?.condition)
                      .shade800,
                  getMaterialColor(BlocProvider.of<GetWeatherCubit>(context)
                          .weatherInfoModel
                          ?.condition)
                      .shade300,
                  getMaterialColor(BlocProvider.of<GetWeatherCubit>(context)
                          .weatherInfoModel
                          ?.condition)
                      .shade50,
                ],
              ),
            ),
            child: BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitialState) {
                  return const NoWeatherBody();
                } else if (state is WeatherLoadedState) {
                  return WeatherInfoBody();
                } else {
                  return const Text('Oops there was an erroe, try later');
                }
              },
            ),
          );
        },
      ),
    );
  }
}
