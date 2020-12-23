import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Theme(
        data: ThemeData(
          accentColor: const Color(0xff3C598B),
          primaryColor: const Color(0xff3C598B),
          primaryColorDark: const Color(0xff3C598B),
        ),
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
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    final weatherCubit = context.bloc<WeatherCubit>();
    weatherCubit.getWeather(cityName);
  }
}
