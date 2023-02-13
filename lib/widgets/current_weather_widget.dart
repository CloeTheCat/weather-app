import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //temperature area
        temperatureAreaWidget(),
        //more details - windspees, humidity, clouds
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    print("assets/weather/  ${weatherDataCurrent.current.weather![0].icon}");
    return Row(children: [
      Image.asset(
		"assets/weather/01n.png"
        // "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
      )
    ]);
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Container();
  }
}
