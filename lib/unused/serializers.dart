// import 'package:built_value/serializer.dart';
// import 'package:built_value/standard_json_plugin.dart';
// import 'package:weather_app/data/model/built_weather.dart';
//
// part 'serializers.g.dart';
//
//
// //Built value without this StandardJsonPlugin will serialize the data into a data structure
// // {"key": 3, "key2": "title"} with StandardJsonPlugin
// // ["key", 3, "key2", "title"] without StandardJsonPlugin
//
// @SerializersFor(const [BuiltWeather])
// final Serializers serializers =
// (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();