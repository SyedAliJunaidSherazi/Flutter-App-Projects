
import 'package:flutter/material.dart';

import 'package:wheather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wheather_app/services/weather.dart';



class LoadingScreen extends StatefulWidget {


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();



  }

  void getLocationData() async{

    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationData: weatherData);

    }));


  }

  // @override
  // void deactivate() {
  //
  //   super.deactivate();
  // }
  //

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}