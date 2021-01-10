import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherContent extends StatelessWidget {
  WeatherContent(
      {@required this.phenomenaImage,
      @required this.phenomena,
      @required this.phenomenaResult});

  final String phenomenaImage;
  final String phenomena;
  final String phenomenaResult;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth : 0,
      leading: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 30,
          minHeight: 30,
          maxWidth: 30,
          maxHeight: 30,
        ),
        child: Image.asset(phenomenaImage, fit: BoxFit.contain),
      ),
      title: Text(
        phenomena,
        style: TextStyle(
          fontSize: 60.0.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        phenomenaResult,
        style: TextStyle(
          fontSize: 45.0.sp,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
    );
  }
}
