import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_ease/ui/dasboard/dashboard.dart';
import 'package:learn_ease/utils/app_images.dart';
import 'package:lottie/lottie.dart';

import '../login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffafa),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lotty/LottieLogo1.json'),
        ],
      ),
    );
  }
}
