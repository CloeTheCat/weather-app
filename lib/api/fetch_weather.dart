import 'dart:convert';
import 'package:weather_app/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/model/weather_data_hourly.dart';
import 'package:weather_app/utilities/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    // print('FetchWeatherAPI, jsonString: $jsonString');
    weatherData = 
    WeatherData(WeatherDataCurrent.fromJson(jsonString), 
    WeatherDataHourly.fromJson(jsonString),
    WeatherDataDaily.fromJson(jsonString)    
    );
    // print('FetchWeatherAPI, weatherData: $weatherData');
    return weatherData!;
  }
}


