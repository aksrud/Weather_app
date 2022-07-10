import 'package:flutter/material.dart';
import 'package:weather_app/data/weather_icon.dart';

class DetailWeatherScreen extends StatefulWidget {
  DetailWeatherScreen({required this.WeatherDatas, required this.AirData});
  final dynamic WeatherDatas;
  final dynamic AirData;

  @override
  State<DetailWeatherScreen> createState() => _DetailWeatherScreenState();
}

class _DetailWeatherScreenState extends State<DetailWeatherScreen> {
  
  String? weather;
  int? temp;
  double? dust1;
  double? dust2;
  dynamic airData;
  var l1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.WeatherDatas, widget.AirData);
  }

  void updateData(dynamic weatherDatas, dynamic AirData){
    l1 = weatherDatas['list'];
    airData = AirData;
    dust1 = airData['list'][0]['components']['pm10'];
    dust2 = airData['list'][0]['components']['pm2_5'];
    double temp2 = l1[0]['main']['temp'];
    temp = temp2.round();
    weather= weatherString(l1[0]['weather'][0]['main']);
  }

  String? weatherIcon(String weather){
    String? icon;
    if(weather == 'Rain')
    return icon!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey,),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(weather!),
              Padding(
                padding: const EdgeInsets.fromLTRB(200.0, 0, 40.0, 0),
                child: Row(
                  children: [
                    Text('온도 : ',
                      style: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
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
                    SizedBox(width: 450,),
                    Text('미세먼지 : ',
                      style: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '$dust1㎍/㎥',
                      style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 330,),
                    Text('초미세먼지 : ',
                      style: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '$dust2㎍/㎥',
                      style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(200.0, 100.0, 20.0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [

                        Container(
                          child: Text('강수량 : ${l1[0]['rain']['3h']}mm',
                            style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(width: 50,),
                        Container(
                          child: Text('습도 : ${l1[0]['main']['humidity']}%',
                            style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(child: Text('비 내릴 확률 : ${l1[0]['pop']*100}%',
                          style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold
                            ),
                        ),),
                        SizedBox(width: 20,),
                        Container(
                          child: Text('풍속 : ${l1[0]['wind']['speed']}m/s',
                            style: TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[0]['weather'][0]['main'])),
                        Text('${l1[0]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[0]['dt_txt']}'),
                      ],
                    )
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[1]['weather'][0]['main'])),
                        Text('${l1[1]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[1]['dt_txt']}'),
                      ],
                    )
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[2]['weather'][0]['main'])),
                        Text('${l1[2]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[2]['dt_txt']}'),
                      ],
                    )
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[3]['weather'][0]['main'])),
                        Text('${l1[3]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[3]['dt_txt']}'),
                      ],
                    )
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[4]['weather'][0]['main'])),
                        Text('${l1[4]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[4]['dt_txt']}'),
                      ],
                    )
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[5]['weather'][0]['main'])),
                        Text('${l1[5]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[5]['dt_txt']}'),
                      ],
                    )
                  ),
                ],
              ),
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[6]['weather'][0]['main'])),
                        Text('${l1[6]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[6]['dt_txt']}'),
                      ],
                    )
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[7]['weather'][0]['main'])),
                        Text('${l1[7]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[7]['dt_txt']}'),
                      ],
                    )
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[8]['weather'][0]['main'])),
                        Text('${l1[8]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[8]['dt_txt']}'),
                      ],
                    )
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[9]['weather'][0]['main'])),
                        Text('${l1[9]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[9]['dt_txt']}'),
                      ],
                    )
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[10]['weather'][0]['main'])),
                        Text('${l1[10]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[10]['dt_txt']}'),
                      ],
                    )
                  ),
                  SizedBox(width: 40,),
                  Container(
                    height: 500,
                    width: 180,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Image.asset(weatherString(l1[11]['weather'][0]['main'])),
                        Text('${l1[11]['main']['temp']}°C',
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('${l1[11]['dt_txt']}'),
                      ],
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}