import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:workshop/business_logic/auth/login/login_cubit.dart';
import 'package:workshop/constants/app_assets.dart';
import 'package:workshop/presentation/screens/login/login_screen.dart';

import '../../../constants/app_colors.dart';
import '../../views/app_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;


  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      if (value.getString("TOKEN") != null) {
        isLogin = true;
      }});
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Image.asset(
            AppAssets.odcImagePng,
            height: MediaQuery.of(context).size.height / 11,
            width: MediaQuery.of(context).size.width / 1.5,
            fit: BoxFit.cover,
          ),

          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 7.0,
              animationDuration: 2500,
              percent: 1,
              barRadius: const Radius.circular(50),
              progressColor: AppColors.primaryColor,
              onAnimationEnd: () {
                /// TODO : check user access token
               isLogin?Navigator.pushAndRemoveUntil(
                 context,
                 MaterialPageRoute(
                   builder: (context) => AppLayout(),
                 ),
                     (Route<dynamic> route) => false,
               ): Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
