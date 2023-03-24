import 'package:breaker_pro/view/screens/allocating_part.dart';
import 'package:breaker_pro/view/screens/customise_part.dart';
import 'package:breaker_pro/view/screens/home_screen.dart';
import 'package:breaker_pro/view/screens/login_screen.dart';
import 'package:breaker_pro/view/screens/manage_part.dart';
import 'package:breaker_pro/view/screens/vehicle_details_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
