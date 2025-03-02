import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_images.dart';


class Utils {
  static BuildContext? _dialogContext;

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: Colors.black, textColor: Colors.white);
  }

  static void showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _dialogContext = context;
        return WillPopScope(
          onWillPop: () async => false,
          child:  Center(child:  CircularProgressIndicator()),
        );
      },
    );
  }

  static void hideLoader() {
    Navigator.pop(_dialogContext!);
  }
}
