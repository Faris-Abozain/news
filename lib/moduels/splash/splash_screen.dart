import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news/moduels/core/AppColors/app_colors.dart';

import '../routes/app_routes_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Column(
            children: [
              Spacer(),
              FadeInDown(
                  child: Image.asset("assets/logos/splash_logo.png")),
              Spacer(),
              BounceInUp(
                  delay: Duration(seconds: 2),
                  onFinish: (direction) {
                    Navigator.pushNamed(context, AppRoutesName.home);
                  },
                  child: Image.asset("assets/logos/route.png",height: 85,width: 215,))
            ]


          ),
      ),


    );
  }
}
