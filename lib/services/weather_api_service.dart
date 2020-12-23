import 'package:chopper/chopper.dart';
import 'package:weather_app/data/model/weather_response.dart';
import 'ModelConverter.dart';
import 'package:weather_app/data/model/constants.dart';

part 'weather_api_service.chopper.dart';

/*
 this class is abstract because chopper works by generating code and
 the actual implementation of this class will be inside a generated class
 not directly inside of WeatherApiService
*/
@ChopperApi(baseUrl: CURRENT_END_POINT)
abstract class WeatherApiService extends ChopperService {
  @Get()
  Future<Response<WeatherResponse>> getCurrentWeather(
      @Query(CITY_HEADER) String cityName,
      @Query(ACCESS_KEY) String accessKey,
      );

  static WeatherApiService create() {
    final client = ChopperClient(
        baseUrl: BASE_URL,
        services: [_$WeatherApiService()],
        converter: ModelConverter(),
        errorConverter: JsonConverter(),
        interceptors: [
          HttpLoggingInterceptor(),
          // (Response response) async {
          //   if (response.statusCode == 200) {
          //     chopperLogger.finest("get current weather response succeed");
          //   }
          // },
          // MobileDataInterceptor()
        ]);
    return _$WeatherApiService(client);
  }
}