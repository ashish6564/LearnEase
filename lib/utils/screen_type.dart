import 'package:flutter/material.dart';

import 'constants.dart';

enum Screen {
  desktop,
  tablet,
  handset,
  watch
}

class ScreenType {
  // static const double _desktop = 900;
  static const double _tablet = 550; // 600
  // static const double _handset = 300;
  static double _deviceWidth = 0;

  static late Orientation _orientation;

  static late Brightness _brightness;

  static init(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    _deviceWidth = queryData.size.shortestSide;
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    _orientation = queryData.orientation;
    //Constants.log("_deviceWidth : $_deviceWidth , _orientation : $_orientation");

    // Gives Device Theme (Brightness.dark for dark theme or Brightness.light for light theme)
    _brightness = queryData.platformBrightness;
  }

  static getOrientation() => _orientation;

  static Screen getDeviceType() {
    // if (_deviceWidth > _desktop) return Screen.desktop;
    if (_deviceWidth < _tablet) {
      return Screen.handset;
    } else {
      return Screen.tablet;
    }
  }

  static bool isDarkMode() => _brightness == Brightness.dark;
}


