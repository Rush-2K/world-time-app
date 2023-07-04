import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; // location name for the UI
  String time = '';  // time for that location
  String flag;  // url to asset flag
  String url;  // location url for api endpoint

  WorldTime({ required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try {
      Response response = await get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);//convert json string to a Json object so that can easily access the data
      // print(data['dateTime']);

      //get properties of data
      String datetime = data['dateTime'];
      // print(datetime);

      //create DateTime object
      DateTime now = DateTime.parse(datetime.substring(0,26));

      // set the time property
      time = now.toString();
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';

    }

  }

}


