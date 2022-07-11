import 'package:flutter/material.dart';
import 'package:weather_app/screens/detail_weather.dart';
import 'package:weather_app/data/weather_icon.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({required this.WeatherData, required this.WeatherDatas, required this.AirData});
  final dynamic WeatherData;
  final dynamic WeatherDatas;
  final dynamic AirData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  String? weather;
  var temp;
  dynamic weatherDatas;
  dynamic airData;
  String? text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.WeatherData, widget.WeatherDatas, widget.AirData);
  }

  void updateData(dynamic WeatherData, dynamic WeatherDatas, dynamic AirData){
    temp = WeatherData['main']['temp'];
    if(WeatherData['weather'][0]['main'] == 'Rain'){
      weather = 'images/흐림.png';
      text = '우산을 챙기세요';
    }
    if(WeatherData['weather'][0]['main'] == 'Clouds'){
      weather = 'images/흐림-해.png';
      text = '구름이 낌';
    }
    if(WeatherData['weather'][0]['main'] == 'Clear'){
      weather = 'images/맑음-해.png';
      text = '맑다 ㅎㅎ';
    }
    else{
      weather = '데이터가 없음';
      text = '데이터가 읎음';
    }
    weatherDatas=WeatherDatas;
    airData=AirData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Column(
                      children: [
                        Image.asset(weather!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$temp',
                              style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              '°C',
                              style: TextStyle(
                                fontSize: 40, 
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '하루씨',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(text!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailWeatherScreen(WeatherDatas: weatherDatas, AirData: airData,);
                              }, 
                              ));
                          },
                          child: Text("자세히 보기"),
                        ),
                        SizedBox(
                          height: 250,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '48동',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      )
    );
  }
}
