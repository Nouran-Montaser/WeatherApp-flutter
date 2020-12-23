// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    weatherIcon: json['icon'] as String,
    weatherCode: json['code'] as int,
    weatherDescription: json['description'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'icon': instance.weatherIcon,
      'code': instance.weatherCode,
      'description': instance.weatherDescription,
    };
