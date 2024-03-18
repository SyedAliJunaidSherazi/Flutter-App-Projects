import 'package:geolocator/geolocator.dart';
class Location {

  late double latitude;
  late double longitude;


  Future<void> getLocation() async {

    try{
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.denied){
        permission = await Geolocator.requestPermission();

        if(permission!=LocationPermission.denied){
          Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
          longitude = position.longitude;
          latitude = position.latitude;

        }


      }
      else{
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
        longitude = position.longitude;
        latitude = position.latitude;

      }
    }catch(e){
      print(e);
    }
  }







}


