import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  String? url;
  Network(this.url);

  Future<dynamic> getJsonData() async{
    http.Response response = await http.get(Uri.parse(url!));
    if(response.statusCode == 200){
      String jsonDate = response.body;
      var parsingData = jsonDecode(jsonDate);
      return parsingData;
    }
    else{
      print(response.statusCode);
    }
  }
}