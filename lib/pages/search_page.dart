import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              BlocProvider.of<WeatherCubit>(context).getWeather(
                cityName: cityName!,
              );
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: const Text('search'),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    // WeatherService service = WeatherService();

                    // WeatherModel? weather =
                    //     await service.getWeather(cityName: cityName!);

                    // Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                    //              Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.search)),
              border: const OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
