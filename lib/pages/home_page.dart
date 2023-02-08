import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather/weather_cubit.dart';
import 'package:weather_app/cubits/weather/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  // WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
          title: const Text('Weather App',style: TextStyle(color: Colors.black),),
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherSuccess) {
              // weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
              return WeatherSc(weatherData: state.weatherModel);
            } else if (state is WeatherError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}

class WeatherSc extends StatelessWidget {
  const WeatherSc({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherModel weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weatherData.getThemeColor(),
          weatherData.getThemeColor()[300]!,
          weatherData.getThemeColor()[100]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at : ',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData.getImage()),
              Text(
                weatherData.temp.toInt().toString(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('maxTemp :${weatherData.maxTemp.toInt()}'),
                  Text('minTemp : ${weatherData.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            weatherData.weatherStateName,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
