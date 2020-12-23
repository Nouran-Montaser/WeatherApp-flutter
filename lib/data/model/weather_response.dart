import 'package:json_annotation/json_annotation.dart';

import 'weather_data.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  @JsonKey(name: 'data')
  List<WeatherData> data;
  @JsonKey(name: 'count')
  int count;

  WeatherResponse({this.data, this.count});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
