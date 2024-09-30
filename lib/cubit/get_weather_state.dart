// ignore_for_file: must_be_immutable

part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}

class GetWeatherLoading extends GetWeatherState {
  List<WeatherModel> weathers;
  GetWeatherLoading(this.weathers);
}
class FailWeatherState extends GetWeatherState{
final String message;
FailWeatherState(this.message);
}
