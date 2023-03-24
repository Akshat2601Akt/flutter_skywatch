import 'package:flutter/material.dart';
import 'package:skywatch/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width ;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weather.jpeg'),
            opacity: 0.4,
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                height: 50.0,
                child: TextField(
                  style: const TextStyle(
                      color: Colors.blueGrey, fontFamily: "Nunito"),
                  decoration: kCityInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  'Show Weather',
                  style: kButtonTextStyle,
                ),
              ),
              const SizedBox(
                height: 400.0,
              ),
              const Text(
                'Stay ahead of the weather, always.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'TTNorms',
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600
                ),
              ),
              Divider(
                color: Colors.white,
                indent: screenWidth*0.1,
                endIndent: screenWidth*0.1,
                height: 30.0,
              ),
              const Text(
                'Get accurate and up-to-date weather information with just a tap.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'TTNorms',
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
