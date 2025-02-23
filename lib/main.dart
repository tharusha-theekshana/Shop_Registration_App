import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_registration/providers/shop_register_provider.dart';
import 'package:shop_registration/screens/register_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => ShopRegisterProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Registration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: RegisterScreen(),
    );
  }
}
