import 'package:flutter/material.dart';

const appBarBackgroundColor = Color(0xFFbd5726);
const buttonColor = Color(0xFFdf7f0f);
const primaryColor = Color(0xFFfcd47f);

const textInputDecoration = InputDecoration (
  fillColor : Colors.white,
  filled : true,
  enabledBorder : OutlineInputBorder (
    borderSide : BorderSide (color : Colors.white, width : 2.0)
  ),
  focusedBorder : OutlineInputBorder (
    borderSide : BorderSide (color : Color(0xFFdf7f0f), width : 2.0)
  ),
);

const backgroundDecoration = BoxDecoration(
  image : DecorationImage(
    image : AssetImage('assets/coffee_bg.jpg'),
    fit : BoxFit.cover,
  ),
);