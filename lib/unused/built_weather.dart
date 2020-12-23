// library built_weather;
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
//
// part 'built_weather.g.dart';
//
// abstract class BuiltWeather implements Built<BuiltWeather, BuiltWeatherBuilder> {
//
//   @nullable
//   int get id;
//
//   String get title;
//   String get body;
//
//   BuiltWeather._();
//
//   factory BuiltWeather([updates(BuiltWeatherBuilder b)]) = _$BuiltWeather;
//
//   static Serializer<BuiltWeather> get serializer => _$builtWeatherSerializer;
// }