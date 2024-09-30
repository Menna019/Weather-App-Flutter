import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class GetWeatherScreen extends StatelessWidget {
  const GetWeatherScreen({super.key, required this.weatherList});
    final List<WeatherModel> weatherList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    centerTitle: true,
    title:const Text("Weather",
    style:TextStyle(fontSize: 25,
    fontWeight: FontWeight.bold),
    ),
    ),
      body: Swiper(
      itemBuilder: (BuildContext context, int index) {
      return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 260),
        child: Column(
        children: [
        Text(weatherList[index].cityName,style:const TextStyle(
        fontSize: 35,fontWeight: FontWeight.bold,
        fontFamily: "PlayfairDisplaySC-Bold.ttf"
        ),
        ),
        Image.network("https:${weatherList[index].icon}"),
        Text(weatherList[index].date,style:const TextStyle(
        fontSize: 17,fontWeight: FontWeight.normal,
        ),
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(weatherList[index].avgTemp.toString(),style:const TextStyle(
          fontWeight: FontWeight.w500,fontSize: 15,
          ),
          ),
        const Text("°C"),
        ],
        ),
      
        const SizedBox(height: 20,),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text("MinTemp:",style: TextStyle(fontWeight: FontWeight.bold),),
        Text(weatherList[index].minTemp.toString(),style:const TextStyle(
          ),
          ),
          const Text("°C"),
          const SizedBox(width: 40,),
        const Text("MaxTemp:",style: TextStyle(fontWeight: FontWeight.bold)),
        Text(weatherList[index].maxTemp.toString(),),
         const Text("°C"),
        ],
        )
        ],
        ),
      ),
      );
        },
        itemCount: weatherList.length,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );

  }
}