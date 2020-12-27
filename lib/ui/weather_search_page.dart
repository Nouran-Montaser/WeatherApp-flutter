import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/data/model/weather_data.dart';
import 'package:weather_app/data/model/weather_response.dart';
import 'component/city_input_field.dart';
import 'component/reusable_card.dart';

class WeatherSearchPage extends StatefulWidget {
  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text(" Weather  ☀⛈")),
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        color: Color(0xff223752),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is WeatherInitial) {
              return buildColumnWithData(WeatherResponse(data: [
                WeatherData(
                    relativeHumidityPercentage: 0.0,
                    cloudsCoveragePercentage: 0.0,
                    cityName: "-",
                    windSpeedInMeterPerSecond: 0.0,
                    seaLevelPressureInMilliBars: 0.0,
                    sunset: "-",
                    sunrise: "-",
                    temp: 0.0)
              ]));
            } else if (state is WeatherLoading) {
              return buildLoading();
            } else if (state is WeatherLoaded) {
              return buildColumnWithData(state.weather);
            } else {
              // (state is WeatherError)
              return buildColumnWithData(WeatherResponse(data: [
                WeatherData(
                    relativeHumidityPercentage: 0.0,
                    cloudsCoveragePercentage: 0.0,
                    cityName: "-",
                    windSpeedInMeterPerSecond: 0.0,
                    seaLevelPressureInMilliBars: 0.0,
                    sunset: "-",
                    sunrise: "-",
                    temp: 0.0)
              ]));
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Scaffold buildColumnWithData(WeatherResponse weather) {
    return Scaffold(
      backgroundColor: Color(0xff223752),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ReusableCard(
            firstPhenomenaImage: "images/humidity.png",
            firstPhenomena: "Humidity",
            firstPhenomenaResult:
                "${weather.data[0].relativeHumidityPercentage}%",
            secondPhenomenaImage: "images/cloud.png",
            secondPhenomena: "Clouds",
            secondPhenomenaResult:
                "${weather.data[0].cloudsCoveragePercentage}%",
          ),
          ReusableCard(
            firstPhenomenaImage: "images/wind.png",
            firstPhenomena: "Wind",
            firstPhenomenaResult:
                "${weather.data[0].windSpeedInMeterPerSecond} m/s",
            secondPhenomenaImage: "images/pressure.png",
            secondPhenomena: "pressure",
            secondPhenomenaResult:
                "${weather.data[0].seaLevelPressureInMilliBars} mb",
          ),
          ReusableCard(
            firstPhenomenaImage: "images/sunset.png",
            firstPhenomena: "sunset",
            firstPhenomenaResult: "${weather.data[0].sunset} AM",
            secondPhenomenaImage: "images/sunrise.png",
            secondPhenomena: "sunrise",
            secondPhenomenaResult: "${weather.data[0].sunrise} PM",
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CityInputField(),
          ListTile(
            title: Text(
              weather.data[0].cityName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 50,
                  color: Colors.white),
            ),
            subtitle: Text(
              "${weather.data[0].temp.toStringAsFixed(1)} °c",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}


