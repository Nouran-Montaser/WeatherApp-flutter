// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return WeatherData(
    relativeHumidityPercentage: (json['rh'] as num)?.toDouble(),
    dayOrNight: json['pod'] as String,
    longitude: (json['lon'] as num)?.toDouble(),
    pressureInMilliBars: (json['pres'] as num)?.toDouble(),
    timezone: json['timezone'] as String,
    lastObservationTime: json['ob_time'] as String,
    countryCode: json['country_code'] as String,
    cloudsCoveragePercentage: (json['clouds'] as num)?.toDouble(),
    lastObservationTimeUnixTimeStamp: (json['ts'] as num)?.toDouble(),
    solarRadiation: (json['solar_rad'] as num)?.toDouble(),
    stateCode: json['state_code'] as String,
    cityName: json['city_name'] as String,
    windSpeedInMeterPerSecond: (json['wind_spd'] as num)?.toDouble(),
    verbalWindDirection: json['wind_cdir_full'] as String,
    abbreviatedWindDirection: json['wind_cdir'] as String,
    seaLevelPressureInMilliBars: (json['slp'] as num)?.toDouble(),
    visibilityInKM: (json['vis'] as num)?.toDouble(),
    solarHourAngleInDegrees: (json['h_angle'] as num)?.toDouble(),
    sunset: json['sunset'] as String,
    directNormalSolarIrradiance: (json['dni'] as num)?.toDouble(),
    dewPointInCelcius: (json['dewpt'] as num)?.toDouble(),
    snowFallInMilliMetersPerHour: (json['snow'] as num)?.toDouble(),
    uvIndex: (json['uv'] as num)?.toDouble(),
    liquidEquivalentPrecipitationRateInMilliMetersPerHour:
        (json['precip'] as num)?.toDouble(),
    windDir: (json['wind_dir'] as num)?.toDouble(),
    sunrise: json['sunrise'] as String,
    globalHorizontalSolarIrradiance: (json['ghi'] as num)?.toDouble(),
    diffuseHorizontalSolarIrradiance: (json['dhi'] as num)?.toDouble(),
    airQualityIndex: (json['aqi'] as num)?.toDouble(),
    latitude: (json['lat'] as num)?.toDouble(),
    weather: json['weather'] == null
        ? null
        : Weather.fromJson(json['weather'] as Map<String, dynamic>),
    datetime: json['datetime'] as String,
    temp: (json['temp'] as num)?.toDouble(),
    station: json['station'] as String,
    solarElevationAngle: (json['elev_angle'] as num)?.toDouble(),
    appTemp: (json['app_temp'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'rh': instance.relativeHumidityPercentage,
      'pod': instance.dayOrNight,
      'lon': instance.longitude,
      'pres': instance.pressureInMilliBars,
      'timezone': instance.timezone,
      'ob_time': instance.lastObservationTime,
      'country_code': instance.countryCode,
      'clouds': instance.cloudsCoveragePercentage,
      'ts': instance.lastObservationTimeUnixTimeStamp,
      'solar_rad': instance.solarRadiation,
      'state_code': instance.stateCode,
      'city_name': instance.cityName,
      'wind_spd': instance.windSpeedInMeterPerSecond,
      'wind_cdir_full': instance.verbalWindDirection,
      'wind_cdir': instance.abbreviatedWindDirection,
      'slp': instance.seaLevelPressureInMilliBars,
      'vis': instance.visibilityInKM,
      'h_angle': instance.solarHourAngleInDegrees,
      'sunset': instance.sunset,
      'dni': instance.directNormalSolarIrradiance,
      'dewpt': instance.dewPointInCelcius,
      'snow': instance.snowFallInMilliMetersPerHour,
      'uv': instance.uvIndex,
      'precip': instance.liquidEquivalentPrecipitationRateInMilliMetersPerHour,
      'wind_dir': instance.windDir,
      'sunrise': instance.sunrise,
      'ghi': instance.globalHorizontalSolarIrradiance,
      'dhi': instance.diffuseHorizontalSolarIrradiance,
      'aqi': instance.airQualityIndex,
      'lat': instance.latitude,
      'weather': instance.weather,
      'datetime': instance.datetime,
      'temp': instance.temp,
      'station': instance.station,
      'elev_angle': instance.solarElevationAngle,
      'app_temp': instance.appTemp,
    };
