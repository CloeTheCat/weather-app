import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/utilities/custom_colors.dart';
import 'package:weather_app/widgets/comfort_level.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/daily_data_forecast.dart';
import 'package:weather_app/widgets/header_widget.dart';
import 'package:weather_app/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
	final GlobalController globalController =
	Get.put(GlobalController(), permanent: true);
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: SafeArea(
				child: Obx(() => globalController.checkLoading().isTrue
					? const Center(
						child: CircularProgressIndicator(),
					)
					: Center(
						child: ListView(
							scrollDirection: Axis.vertical, 
							children: [
								const SizedBox(height: 20),
								const HeaderWidget(),
								CurrentWeatherWidget(
									weatherDataCurrent: globalController.getData().getCurrentWeather()
								),
                const SizedBox(height: 20),
								HourlyDataWidget(
                  weatherDataHourly: globalController.getData().getHourlyWeather()
                ),
                DailyDataForecast(
                  weatherDataDaily: globalController.getData().getDailyWeather()
                ),
                Container(
                  height: 1,
                  color: CustomColors.dividerLine,
                ),
                const SizedBox(
                  height: 10,
                ),
                ComfortLevel(
                  weatherDataCurrent: globalController.getData().getCurrentWeather()
                )
							]
						)
					)
				),
			),
		);
	}
}
