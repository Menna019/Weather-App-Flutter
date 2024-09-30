import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather/models/weather_model.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitial());

  Future<List<WeatherModel>> getweather({required String city}) async{
try {
  Response response = await Dio().get(
  "https://api.weatherapi.com/v1/forecast.json?key=1dce3bfb653d484eb6a120154242909&q=$city&days=3&aqi=no&alerts=no"
  );
  // ignore: unused_local_variable
  List <WeatherModel> weatherList =[
  WeatherModel.fromjson(response.data, 0), //weather days (index)
  WeatherModel.fromjson(response.data, 1),
  WeatherModel.fromjson(response.data, 2),
  ];
  emit(GetWeatherLoading(weatherList));
  return weatherList;
} on DioException catch (e) {
  //throw Exception(e); //errors in app generally
  final message=e.response?.data['error']['message']??"Somethig went wrong!";
  emit(FailWeatherState(message));
  throw Exception(message);
}catch(e){
  emit(FailWeatherState("try later! $e"));
  throw Exception("Try later! $e");
}
}
}
