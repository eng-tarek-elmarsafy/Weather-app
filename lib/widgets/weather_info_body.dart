import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waether_app/cubit/grt_weather_cubit/get_weather_cubit.dart';

import '../models/weather_info.dart';

class WeatherInfoBody extends StatelessWidget {
   WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherInfoModel getData =
        BlocProvider.of<GetWeatherCubit>(context).weatherInfoModel!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (getData.city),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            'updated at ${getData.tiame.hour}:${getData.tiame.minute}',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'http:${getData.icon}',
              ),
              Text(
                '${getData.avrTamp}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Maxtemp: ${getData.maxTamp}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Mintemp: ${getData.minTamp}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            getData.condition,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}

// String imagePth(double info) {
//   if (info >= 30) {
//     return 'assets/images/clear.png';
//   } else if (info >= 15) {
//     return 'assets/images/cloudy.png';
//   } else if (info >= 5) {
//     return 'assets/images/rainy.png';
//   } else if (info >= 1) {
//     return 'assets/images/snow.png';
//   } else {
//     return 'assets/images/thunderstorm.png';
//   }
// }
