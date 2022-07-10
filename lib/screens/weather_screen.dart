import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({required this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  String? weather;
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
        weather = weatherData['weather'][0]['main'];
        print(temp);
        print(weather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
