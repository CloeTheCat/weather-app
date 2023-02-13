import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
// import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/header_widget.dart';

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
    print('HOME SCREEN, checkLoading: ${globalController.checkLoading().isTrue}');
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(scrollDirection: Axis.vertical, children: const [
                SizedBox(
                  height: 20,
                ),

                HeaderWidget(),

                // CurrentWeatherWidget(
                //   weatherDataCurrent: 
                //     globalController.getData().getCurrentWeather()
                //   ),
              ])),
      ),
    );
  }
}