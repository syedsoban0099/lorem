import 'package:flutter/material.dart';
import 'package:lorem/screens/login.dart';
import 'package:lorem/screens/home.dart';
import 'package:lorem/screens/splash.dart';
import 'package:lorem/widgets/profile.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:home(),
      theme: new ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      )
    );
  }
}