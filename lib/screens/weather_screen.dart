import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({required this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  String? cityName;
  int? temp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData){

        double temp2 = weatherData['main']['temp'];
        temp = temp2.round();
        cityName =weatherData['name'];
        print(temp);
        print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
