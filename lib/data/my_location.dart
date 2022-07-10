import 'package:geolocator/geolocator.dart';

class MyLocation{
  double? latitude;
  double? longitude;

  Future<void> getMyCurrentLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch(e){
      print('오류남');
    }
  }
}