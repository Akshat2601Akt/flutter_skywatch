import 'package:skywatch/services/location.dart';
import 'package:skywatch/services/networking.dart';
import 'package:flutter/material.dart';

const String apiKey = "d521b903c7474e90bf3e2666d0dd80b1";
const String weatherURL = "https://api.openweathermap.org/data/2.5/weather";


class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper("$weatherURL?q=$cityName&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper("$weatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  IconData getWeatherIcon(int condition) {
    if (condition < 300) {
      return Icons.thunderstorm_rounded;
    } else if (condition < 400) {
      return Icons.cloudy_snowing;
    } else if (condition < 600) {
      return Icons.umbrella_rounded;
    } else if (condition < 700) {
      return Icons.snowing;
     } else if (condition < 800) {
      return Icons.wb_cloudy_outlined;
    } else if (condition == 800) {
      return Icons.sunny;
    } else if (condition <= 804) {
      return Icons.wb_cloudy_outlined;
    } else {
      return Icons.error_outline_rounded;
    }
  }

  String getMessage(int temp) {
    if (temp >= 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
