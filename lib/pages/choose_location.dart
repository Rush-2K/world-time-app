import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {

    //simulate network request for a data
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'Rush2K';
    });

    //simulate network request to get bio of username
    int age = await Future.delayed(Duration(seconds: 2), () {
      return 23;
    });

    print ('$username - $age');

  }

  int counter = 0;

  @override
  void initState() {     //run once
    super.initState();
    getData();   //since its async, any function/method below can be run without waiting this method to finish
  }

  @override
  Widget build(BuildContext context) {     //run every time the state is change
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter+=1;
          });
        },
        child: Text('counter is $counter'),
      ),
    );
  }
}
