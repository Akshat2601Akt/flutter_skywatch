import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 30.0,
);

const kShortMessageTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 30.0,
);

const kShortDetailTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 20.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w700,
  fontFamily: 'Nunito',
  color: Colors.white
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kCityInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.all(10.0),
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
      size: 40.0,
    ),
    hintText: "Enter City Name",
    hintStyle:
    TextStyle(color: Colors.grey, fontFamily: "Nunito"),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    ));