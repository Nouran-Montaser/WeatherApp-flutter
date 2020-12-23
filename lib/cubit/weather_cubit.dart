import 'package:bloc/bloc.dart';
import 'file:///F:/learning/weather_app/lib/network/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weatherResponse = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weatherResponse));
    } on NetworkException {
      emit(WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}