import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(initState());

  WeatherService weatherService;
WeatherModel? weatherModel;
  String? cityName;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      WeatherModel weatherModel =
          await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } on Exception catch (e) {
      emit(WeatherError());
    }
  }
}
