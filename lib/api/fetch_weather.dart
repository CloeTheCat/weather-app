import 'dart:convert';

import 'package:weather_app/api/api_key.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_data_current.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    print('FetchWeatherAPI, jsonString: $jsonString');
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    print('FetchWeatherAPI, weatherData: $weatherData');
    return weatherData!;
  }
}

String apiURL(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=it";
  return url;
}
