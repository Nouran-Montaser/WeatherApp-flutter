import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'file:///F:/learning/weather_app/lib/network/weather_repository.dart';
import 'package:weather_app/ui/weather_search_page.dart';
import 'package:weather_app/utils.dart';

void main() {
  setupLogging();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: const Color(0xff3C598B),
        primaryColor: const Color(0xff223752),
        primaryColorDark: const Color(0xff223752),
      ),
      title: 'Material App',
      home: BlocProvider(
        create: (context) => WeatherCubit(WeatherDataRepository()),
        child: WeatherSearchPage(),
      ),
    );
  }
}
