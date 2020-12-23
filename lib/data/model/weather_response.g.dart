// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return WeatherResponse(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : WeatherData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'count': instance.count,
    };
