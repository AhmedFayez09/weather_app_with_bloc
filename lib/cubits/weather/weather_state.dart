// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

class WeatherLoading extends WeatherState {}
class initState extends WeatherState {}

class WeatherSuccess extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccess({
    required this.weatherModel,
  });
  
}

class WeatherError extends WeatherState {}
