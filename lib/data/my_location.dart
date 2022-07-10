import 'package:geolocator/geolocator.dart';

class MyLocation{
  double? latitude;
  double? longitude;

  Future<void> getMyCurrentLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude+0.0326;
      longitude = position.longitude+0.00000000001;
      print(latitude);
      print(longitude);
    } catch(e){
      print('오류남');
    }
  }
}