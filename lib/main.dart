import 'package:flutter/material.dart';
import 'package:news/moduels/routes/app_routes.dart';
import 'package:news/moduels/routes/app_routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutesName.splash,
     routes: AppRoutes.routes,

    );
  }
}


