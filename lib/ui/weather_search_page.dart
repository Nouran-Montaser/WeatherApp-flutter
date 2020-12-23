import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/data/model/weather_response.dart';

class WeatherSearchPage extends StatefulWidget {
  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Weather  ☀⛈")),
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        color: Color(0xff223752),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is WeatherInitial) {
              return buildInitialInput();
            } else if (state is WeatherLoading) {
              return buildLoading();
            } else if (state is WeatherLoaded) {
              return buildColumnWithData(state.weather);
            } else {
              // (state is WeatherError)
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(WeatherResponse weather) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CityInputField(),
        Center(
          child: Container(
            padding: const EdgeInsets.only(top: 25, bottom: 5),
            child: Text(
              weather.data[0].cityName,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 50,
                  color: Colors.white),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text(
              // Display the temperature with 1 decimal place
              "${weather.data[0].temp.toStringAsFixed(1)} °c",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
        ReusableCard(
          firstPhenomenaImage: "images/humidity.png",
          firstPhenomena: "Humidity",
          firstPhenomenaResult:
              "${weather.data[0].relativeHumidityPercentage}%",
          secondPhenomenaImage: "images/cloud.png",
          secondPhenomena: "Clouds",
          secondPhenomenaResult: "${weather.data[0].cloudsCoveragePercentage}%",
        ),
        ReusableCard(
          firstPhenomenaImage: "images/wind.png",
          firstPhenomena: "Wind",
          firstPhenomenaResult:
              "${weather.data[0].windSpeedInMeterPerSecond} m/s",
          secondPhenomenaImage: "images/pressure.png",
          secondPhenomena: "pressure",
          secondPhenomenaResult:
              "${weather.data[0].seaLevelPressureInMilliBars}mb",
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
    );
  }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        style: TextStyle(color: Colors.white),
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          labelStyle: new TextStyle(color: Colors.white),
          hintText: "Search with the name of the city...",
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    final weatherCubit = context.bloc<WeatherCubit>();
    weatherCubit.getWeather(cityName);
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.firstPhenomenaImage,
      @required this.firstPhenomena,
      @required this.firstPhenomenaResult,
      @required this.secondPhenomenaImage,
      @required this.secondPhenomena,
      @required this.secondPhenomenaResult});

  final String firstPhenomenaImage;
  final String firstPhenomena;
  final String firstPhenomenaResult;
  final String secondPhenomenaImage;
  final String secondPhenomena;
  final String secondPhenomenaResult;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconContent(
                phenomenaImage: firstPhenomenaImage,
                phenomena: firstPhenomena,
                phenomenaResult: firstPhenomenaResult,
              ),
              Container(
                width: 1,
                height: 50,
                color: Colors.grey,
              ),
              IconContent(
                phenomenaImage: secondPhenomenaImage,
                phenomena: secondPhenomena,
                phenomenaResult: secondPhenomenaResult,
              ),
            ],
          ),
        ),
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0xff31425E),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class IconContent extends StatelessWidget {
  IconContent(
      {@required this.phenomenaImage,
      @required this.phenomena,
      @required this.phenomenaResult});

  final String phenomenaImage;
  final String phenomena;
  final String phenomenaResult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            phenomenaImage,
            width: 30,
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  phenomena,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  phenomenaResult,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
