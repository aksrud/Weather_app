import 'package:flutter/material.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weather_screen.dart';
const apiKey = '4b6cb73591e57b35e1cc1289fb74122f';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  double? latitude;
  double? longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude = myLocation.latitude;
    longitude = myLocation.longitude;

    Network network = Network('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric',);
    Network air = Network('http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude&lon=$longitude&appid=$apiKey');
    Network networks = Network('https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var airData = await air.getJsonData();
    var weatherData = await network.getJsonData();
    var weatherDatas = await networks.getJsonData();
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return WeatherScreen(WeatherData: weatherData, WeatherDatas: weatherDatas, AirData: airData);
      }, 
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('images/loading.gif'))
    );
  }
}