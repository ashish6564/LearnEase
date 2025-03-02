import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_textstyles.dart';
import '../../utils/size_config.dart';
import '../../widgets/custom_button.dart';
import '../dasboard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffafa),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Center(
                  child: Lottie.asset('assets/lotty/login.json',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 30,),
               Text('Email/Phone Number',style: CustomTextStyles.loginText12,),
              const SizedBox(height: 5,),
              TextField(
                controller: mobileNumberController,
                decoration:  InputDecoration(
                  hintText: 'Enter/Phone Mobile Number',
                  hintStyle:TextStyle(color:AppColors.buttonColor,fontWeight: FontWeight.normal),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.buttonColor,width: 1)
                  ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: AppColors.buttonColor,width: 1)
                    )
                ),
              ),
              const SizedBox(height: 15,),
               Text('Password', style: CustomTextStyles.loginText12,),
              const SizedBox(height: 5,),
              TextField(
                controller: passwordController,
                decoration:  InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle:TextStyle(color: AppColors.buttonColor,fontWeight: FontWeight.normal),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: AppColors.buttonColor,width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: AppColors.buttonColor,width: 1)
                    )
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: SizeConfig.screenWidth,
                child:  Text(
                  'Forgot Password?',textAlign:TextAlign.end,
                  style: TextStyle(
                    decoration: TextDecoration.underline,color: AppColors.buttonColor,decorationColor: AppColors.buttonColor
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: CustomButton(
                  horizontalPadding: 50,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard()));
                  },
                  text: 'Sign In',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppColors.buttonColor,),
                  ),
                  SizedBox(width: 5,),
                  Text('or',style: TextStyle(color: AppColors.buttonColor),),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppColors.buttonColor,),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Lottie.asset('assets/lotty/google.json',width: 55,height: 55),
                Lottie.asset('assets/lotty/facebook.json',width: 55,height: 55),
                ],
              ),
              Center(child: Text("Don't have an account Sign Up",style: TextStyle(color: AppColors.buttonColor),))
            ],
          ),
        ),
      ),
    );
  }
}
