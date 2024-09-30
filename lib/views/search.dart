// ignore_for_file: body_might_complete_normally_nullable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/widgets/getweather.dart';
class Search extends StatefulWidget {
  const Search({super.key});
  static String routeName="Search";
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
    child: Column(children: [
    const SizedBox(
    height: 100,
    ),
    Image.asset("assets/search.gif"),
     Center(
    child: Padding(padding:const EdgeInsets.only(
    left: 50, right: 50,
    ),
    child: Form(
    key: formKey,
    child: TextFormField(
    controller: controller,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    ),
    hintText: "Enter City Name",
    ),
    validator: (value) {
    value!.isEmpty? "Enter City Name": null;
    },
    ),
    ),
    ),
    ),
    MaterialButton(
    color: const Color.fromARGB(255, 238, 161, 251),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    ),
    onPressed: () async{
    if(formKey.currentState!.validate()){
    weather=await WeatherService().getweather(city: controller.text);
   BlocProvider.of<GetWeatherCubit>(context).getweather(city: controller.text);
  Navigator.push(context, MaterialPageRoute(builder: (context)=> GetWeatherScreen(weatherList: weather)));
  }
  },
  child: const Text("Search Now!"),
  ),
  ],
  ),
  ),
  );
  }
  }
 List<WeatherModel> weather=[];
