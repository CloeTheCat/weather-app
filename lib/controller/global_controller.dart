import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/fetch_weather.dart';
import 'package:weather_app/model/weather_data.dart';

class GlobalController extends GetxController {
  // create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  //instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;

	WeatherData getData() {
		// print('khu   prova hvuhvuv');
		return weatherData.value;
	}

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    print('getLocation function start');
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error("Location service is not enabled");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission is denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      // _isLoading.value = false;
      print('Geolocator.getCurrentPosition: ${_longitude.value}');

      return FetchWeatherAPI()
			  .processData(value.latitude, value.longitude)
				.then((value) { //print('FetchWeatherAPI: $value');
					weatherData.value = value;
					_isLoading.value = false;
				});
    });
  }
}



///----------------------------------------------------------------------------------------------------------


// final weatherData = WeatherData().obs;

	// WeatherData getData() {
	// 	// print('khu   prova hvuhvuv');
	// 	return weatherData.value;
	// }

// 	constructor() {
// 		print('khu   prova hvuhvuv');
		
// 		getLocation() async {
// 			bool isServiceEnabled;
// 			LocationPermission locationPermission;

// 			isServiceEnabled = await Geolocator.isLocationServiceEnabled();

// 			if (!isServiceEnabled) {
// 				return Future.error("Location service is not enabled");
// 			}

// 			locationPermission = await Geolocator.checkPermission();

// 			if (locationPermission == LocationPermission.deniedForever) {
// 					return Future.error("Location permission is denied forever");
// 				} else if (locationPermission == LocationPermission.denied) {
// 					locationPermission = await Geolocator.requestPermission();
// 						if (locationPermission == LocationPermission.denied) {
// 							return Future.error("Location permission is denied");
// 						}
// 				}

// 			return await Geolocator.getCurrentPosition(
// 				desiredAccuracy: LocationAccuracy.high)
// 					.then((value) {
// 					_latitude.value = value.latitude;
// 					_longitude.value = value.longitude;
// 					_isLoading.value = false;
// 					print(_isLoading.value);
// 					// return FetchWeatherAPI()
// 					//     .processData(value.latitude, value.longitude)
// 					//     .then((value) {
// 					//   weatherData.value = value;
// 					//   _isLoading.value = false;
// 					// });
// 			});
// 		}

// 		@override
// 		void onInit() {
// 		if (_isLoading.isTrue) {
// 		getLocation();
// 		}
// 		super.onInit();
// 		}
// 	}
// }
