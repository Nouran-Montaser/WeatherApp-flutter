import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  @JsonKey(name: 'icon')
  String weatherIcon;
  @JsonKey(name: 'code')
  int weatherCode;
  @JsonKey(name: 'description')
  String weatherDescription;

  Weather({this.weatherIcon, this.weatherCode, this.weatherDescription});

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
