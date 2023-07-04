import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for the UI
  String time = '';  // time for that location
  String flag;  // url to asset flag
  String url;  // location url for api endpoint
  bool isDaytime = false; //true or false if daytime or not

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
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';

    }



  }

}


