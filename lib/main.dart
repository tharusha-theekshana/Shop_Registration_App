import 'package:flutter/material.dart';
import 'package:shop_registration/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Registration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true
      ),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}


