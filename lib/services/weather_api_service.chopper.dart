// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$WeatherApiService extends WeatherApiService {
  _$WeatherApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = WeatherApiService;

  @override
  Future<Response<WeatherResponse>> getCurrentWeather(
      String cityName, String accessKey) {
    final $url = '/current';
    final $params = <String, dynamic>{'city': cityName, 'key': accessKey};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<WeatherResponse, WeatherResponse>($request);
  }
}
