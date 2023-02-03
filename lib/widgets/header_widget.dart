import "package:flutter/material.dart";
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude().value, globalController.getLongitude().value);

    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    print(placemark);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Text(city),
      )
    ]);
  }
}
