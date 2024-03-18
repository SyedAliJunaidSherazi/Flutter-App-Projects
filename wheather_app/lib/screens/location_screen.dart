import 'package:flutter/material.dart';
import 'package:wheather_app/utilities/constants.dart';
import 'package:wheather_app/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationData});

  final locationData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {


  WeatherModel weather = WeatherModel();
  late String weatherIcon;
  late String cityName;
  late String message;
  late int temperature;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationData);
  }

  void updateUi(dynamic weatherData) {

    setState(() {
      // if(weatherData==null){

      //   return; // this will pre maturely return the method without going further
      // }
      if(weatherData!=null){
        double temp = weatherData['main']['temp']; // gettint data from json file using api
        temperature = temp.toInt();

        var condition = weatherData['weather'][0]['id'];
        weatherIcon = weather.getWeatherIcon(condition);
        message = weather.getMessage(temperature);
        cityName = weatherData['name'];
        return;
      }
      temperature = 0;
      weatherIcon = 'Error';
      message = 'Unable to get Weather Data';
      cityName = '';


    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      updateUi(await weather.getLocationWeather());
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){ // getting value back from CityScreen
                         return  CityScreen();
                      },
                      ),);

                      if(typedName!=null){
                        updateUi( await weather.getCityWeather(typedName));
                      }

                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$message time in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
