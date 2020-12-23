import 'dart:math';
import 'package:weather_app/data/model/constants.dart';
import 'package:weather_app/data/model/weather_data.dart';
import 'package:weather_app/data/model/weather_response.dart';
import 'package:weather_app/services/weather_api_service.dart';


abstract class WeatherRepository {
  Future<WeatherResponse> fetchWeather(String cityName);
}

class WeatherDataRepository implements WeatherRepository {
  @override
  Future<WeatherResponse> fetchWeather(String cityName) async {
    var weatherService = WeatherApiService.create();
    final response = await weatherService.getCurrentWeather(cityName, KEY_VALUE);
    if (response.body.data == null || !(response.body is WeatherResponse))
      throw NetworkException();
    else
      return response.body;
  }
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<WeatherResponse> fetchWeather(String cityName) async {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
          () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          throw NetworkException();
        }

        // Return "fetched" weather
        return WeatherResponse(
          data: [WeatherData()],
          count: 1,
        );
      },
    );
  }
}

class NetworkException implements Exception {}
