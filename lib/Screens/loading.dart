import 'package:flutter/material.dart';

import 'package:weather_app3_1/Screens/weather_screen.dart';
import 'package:weather_app3_1/data/my_location.dart';
import 'package:weather_app3_1/data/network.dart';

const apikey = '68d98bad52ca08306555b33401aaf5e7';



class Loading extends StatefulWidget {
  // const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double latitude3;
  double longtitude3;


  @override
  void initState() {
    super.initState();
    getLocation();
  }


  void getLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longtitude3 = myLocation.longtitude2;


    // getlocation 메서드에 fetchdata a 메서드를 통합함.
    Network network = Network('https://samples.openweathermap.org/data/2.5/weather?'
        'q=London&appid=b1b15e88fa797225412429c1c50c122a1');

    var weatherData = await network.getJsonData(); //futre 타입으로 Pasing 데이터를 리턴함
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherScreen(parseWeatherData: weatherData, );
    }));
  }

  // void fetchData() async{
  //
  //     var myJson = parsingData['weather'][0]['description'];
  //     var wind = parsingData['wind'][0]['speed'];
  //     var id = parsingData['id'];
  //   }else {
  //     print(response.statusCode);
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
        onPressed:()=>
            getLocation(),child: Text('Get my location'),
    )
      ),
    );
  }
}
