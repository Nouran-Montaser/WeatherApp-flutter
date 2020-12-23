import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/model/weather.dart';

part 'weather_data.g.dart';

@JsonSerializable(nullable: false)
class WeatherData {
  @JsonKey(name: 'rh', nullable: false)
  double relativeHumidityPercentage = 0.0;
  @JsonKey(name: 'pod')
  String dayOrNight;
  @JsonKey(name: 'lon')
  double longitude;

  @JsonKey(name: 'pres')
  double pressureInMilliBars;

  @JsonKey(name: 'timezone')
  String timezone;
  @JsonKey(name: 'ob_time')
  String lastObservationTime;
  @JsonKey(name: 'country_code')
  String countryCode;
  @JsonKey(name: 'clouds', nullable: false)
  double cloudsCoveragePercentage = 0.0;
  @JsonKey(name: 'ts')
  double lastObservationTimeUnixTimeStamp;
  @JsonKey(name: 'solar_rad')
  double solarRadiation;
  @JsonKey(name: 'state_code')
  String stateCode;
  @JsonKey(name: 'city_name', nullable: false)
  String cityName = "-";
  @JsonKey(name: 'wind_spd', nullable: false)
  double windSpeedInMeterPerSecond = 0.0;
  @JsonKey(name: 'wind_cdir_full')
  String verbalWindDirection;
  @JsonKey(name: 'wind_cdir')
  String abbreviatedWindDirection;
  @JsonKey(name: 'slp', nullable: false)
  double seaLevelPressureInMilliBars = 0.0;
  @JsonKey(name: 'vis')
  double visibilityInKM;
  @JsonKey(name: 'h_angle')
  double solarHourAngleInDegrees;
  @JsonKey(name: 'sunset', nullable: false)
  String sunset = "-";
  @JsonKey(name: 'dni')
  double directNormalSolarIrradiance;
  @JsonKey(name: 'dewpt')
  double dewPointInCelcius;
  @JsonKey(name: 'snow')
  double snowFallInMilliMetersPerHour;
  @JsonKey(name: 'uv')
  double uvIndex;
  @JsonKey(name: 'precip')
  double liquidEquivalentPrecipitationRateInMilliMetersPerHour;
  @JsonKey(name: 'wind_dir')
  double windDir;
  @JsonKey(name: 'sunrise', nullable: false)
  String sunrise = "-";
  @JsonKey(name: 'ghi')
  double globalHorizontalSolarIrradiance;

  @JsonKey(name: 'dhi')
  double diffuseHorizontalSolarIrradiance;
  @JsonKey(name: 'aqi')
  double airQualityIndex;
  @JsonKey(name: 'lat')
  double latitude;

  @JsonKey(name: 'weather')
  Weather weather;
  @JsonKey(name: 'datetime')
  String datetime;
  @JsonKey(name: 'temp', nullable: false)
  double temp = 0.0;
  @JsonKey(name: 'station')
  String station;
  @JsonKey(name: 'elev_angle')
  double solarElevationAngle;
  @JsonKey(name: 'app_temp')
  double appTemp;


  WeatherData({
      this.relativeHumidityPercentage,
      this.dayOrNight,
      this.longitude,
      this.pressureInMilliBars,
      this.timezone,
      this.lastObservationTime,
      this.countryCode,
      this.cloudsCoveragePercentage,
      this.lastObservationTimeUnixTimeStamp,
      this.solarRadiation,
      this.stateCode,
      this.cityName,
      this.windSpeedInMeterPerSecond,
      this.verbalWindDirection,
      this.abbreviatedWindDirection,
      this.seaLevelPressureInMilliBars,
      this.visibilityInKM,
      this.solarHourAngleInDegrees,
      this.sunset,
      this.directNormalSolarIrradiance,
      this.dewPointInCelcius,
      this.snowFallInMilliMetersPerHour,
      this.uvIndex,
      this.liquidEquivalentPrecipitationRateInMilliMetersPerHour,
      this.windDir,
      this.sunrise,
      this.globalHorizontalSolarIrradiance,
      this.diffuseHorizontalSolarIrradiance,
      this.airQualityIndex,
      this.latitude,
      this.weather,
      this.datetime,
      this.temp,
      this.station,
      this.solarElevationAngle,
      this.appTemp});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
