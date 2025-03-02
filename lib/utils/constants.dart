import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';


import 'package:flutter/material.dart';
import 'package:learn_ease/utils/size_config.dart';



class Constants {


  static const lightColorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF96416A),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFFFD8E6),
      onPrimaryContainer: Color(0xFF3D0024),
      secondary: Color(0xFF735761),
    onSecondary: Color(0xFF3D0024), error: Colors.cyan, onError: Colors.red, surface: Colors.red, onSurface: Colors.red,

  );
  static const darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFFB0D0),
      onPrimary: Color(0xFF5C113B),
      primaryContainer: Color(0xFF792952),
      onPrimaryContainer: Color(0xFFFFD8E6),
      secondary: Color(0xFFE1BDCA),
      onSecondary: Color(0xFF412A33),
    error: Colors.cyan, onError: Colors.red, surface: Colors.red, onSurface: Colors.red,

  );


  //////////////////////////////********************************\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  static String baseUrl = "https://avtechky.in/ncert_books/";


  /////////////////////////////*********************************\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  final int pageSize = 20;



  final String tag = "eMeeting";
  String sdcardPath = "";
  String sharedDocPath = "";
  String agendaPath = "";
  String aboutUsPath = "";
  String userPath = "";
  String circularPath = "";
  String draftMomPath = "";
  String quickAccessPath = "";
  static int screenSize = 450;
  static bool ipadBool = SizeConfig.screenWidth >= screenSize;

  static  Map<String,dynamic> token = {
    "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTgwLCJpYXQiOjE3MzI2ODYxMDMsImV4cCI6MTczMjc3MjUwMywiaXNzIjoiQkFOREhBTl9BTUMifQ.ousFi3CXBLh-utcESJiCDG1RW6wlZHfOburD9cxu0lU",
    "investor_name": "CHANCHAL MANOHAR WANKHADE"
  };






}
