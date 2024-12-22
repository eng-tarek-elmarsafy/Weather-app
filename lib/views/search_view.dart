import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/grt_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              BlocProvider.of<GetWeatherCubit>(context).getWeather(value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              suffixIcon: Icon(
                Icons.search,
              ),
              hintText: 'Enter City',
              label: Text('Search'),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
