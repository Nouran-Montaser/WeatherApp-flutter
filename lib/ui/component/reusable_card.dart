import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/ui/component/weather_content.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: WeatherContent(
                  phenomenaImage: firstPhenomenaImage,
                  phenomena: firstPhenomena,
                  phenomenaResult: firstPhenomenaResult,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 1,
                    height: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: WeatherContent(
                  phenomenaImage: secondPhenomenaImage,
                  phenomena: secondPhenomena,
                  phenomenaResult: secondPhenomenaResult,
                ),
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
