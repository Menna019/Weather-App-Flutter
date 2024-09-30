import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit.dart';
import 'package:weather/views/homeScreen.dart';
import 'package:weather/views/onboardingScreen.dart';
import 'package:weather/views/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
      
       theme: ThemeData.light(),
       darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routes: {
          OnboardingScreen.routeName: (context) => const OnboardingScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          Search.routeName: (context) => const Search(),
        },
        initialRoute: OnboardingScreen.routeName,
      ),
    );
  }
}

class ThemesProvider {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
    ),
    
  );
}
