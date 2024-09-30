import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit.dart';
import 'package:weather/views/search.dart';
import 'package:weather/widgets/getweather.dart';
import 'package:weather/widgets/no_weatherdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
   static String routeName="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    actions: [
    IconButton(
    color: Theme.of(context).colorScheme.onSurface,
    onPressed: (){
    Navigator.pushNamed(context, Search.routeName);
    }, icon: const Icon(Icons.search,size: 30,
   ))
    ],
    ),
    body: BlocBuilder<GetWeatherCubit, GetWeatherState>(builder: (context, state){
    if(state is GetWeatherLoading) {
    return GetWeatherScreen(weatherList: state.weathers);
    }else{
    return const NoData();
    }
    }
    ),
    );
  }
}