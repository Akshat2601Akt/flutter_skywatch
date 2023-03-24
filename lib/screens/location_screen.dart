import 'package:skywatch/screens/city_screen.dart';
import 'package:skywatch/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:skywatch/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature, condition, pressure, humidity, visibility, windSpeed;
  late double minTemp, maxTemp;
  late String cityName, weatherMessage, weatherDescription;
  late IconData weatherIcon;
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic data) {
    if (data == null) {
      temperature = 0;
      weatherMessage = "Unable to get weather data";
      weatherIcon = Icons.error_outline_rounded;
      cityName = "";
      return;
    }
    temperature = data['main']['temp'].toInt();
    condition = data['weather'][0]['id'];
    cityName = "${data['name']}";
    minTemp = data['main']['temp_min'];
    maxTemp = data['main']['temp_max'];
    pressure = data['main']['pressure'].toInt();
    humidity = data['main']['humidity'].toInt();
    visibility = data['visibility'].toInt();
    windSpeed = data['wind']['speed'].toInt();
    weatherDescription = data['weather'][0]['main'].toString();
    weatherMessage = weather.getMessage(temperature);
    weatherIcon = weather.getWeatherIcon(condition);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width ;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData =
                          await WeatherModel().getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 35.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    cityName,
                    style: kShortMessageTextStyle,
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CityScreen();
                      }));
                      if (typedName != null) {
                        var weatherData = await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 35.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.18,
              ),
              Text(
                '$temperature °C',
                style: kTempTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    weatherIcon,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    weatherDescription,
                    style: kShortMessageTextStyle,
                  ),
                ],
              ),
              Divider(
                color: Colors.white,
                indent: screenWidth*0.23,
                endIndent: screenWidth*0.23,
              ),
              Text(
                'H: $maxTemp°, L: $minTemp°',
                style: kShortDetailTextStyle,
              ),
              SizedBox(
                height: screenHeight * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Humidity: $humidity %',
                        style: kShortDetailTextStyle,
                      ),
                      Text(
                        'Pressure: $pressure hPa',
                        style: kShortDetailTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wind Speed: $windSpeed m/s',
                        style: kShortDetailTextStyle,
                      ),
                      Text(
                        'Visibility: $visibility m',
                        style: kShortDetailTextStyle,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$weatherMessage!",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
