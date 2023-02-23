import 'package:flutter/material.dart';
import 'loading.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  String cityName;
  double temp;

  @override
  void initState() {
    super.initState();
    UpadateData(widget.parseWeatherData);
  }

  void UpadateData(dynamic weatherData) {

        temp = weatherData['main']['temp'];
        cityName = weatherData['main'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$temp',
              ),
              Text(
                '$cityName'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
