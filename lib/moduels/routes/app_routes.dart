import 'package:flutter/material.dart';
import 'package:news/moduels/Home/home_screen.dart';
import 'package:news/moduels/routes/app_routes_name.dart';
import 'package:news/moduels/splash/splash_screen.dart';

class AppRoutes{
   static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutesName.splash:(_)=>SplashScreen(),
    AppRoutesName.home:(_)=>HomeScreen(),

  } ;
}