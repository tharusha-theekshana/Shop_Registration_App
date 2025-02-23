import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_registration/providers/image_provider.dart';
import 'package:shop_registration/providers/shop_register_provider.dart';
import 'package:shop_registration/screens/register_flow/owner_details_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShopRegisterProvider()),
        ChangeNotifierProvider(create: (context) => ImagePickerProvider()), // Renamed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Registration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Quicksand",
          splashFactory: NoSplash.splashFactory,
          colorScheme: const ColorScheme.light()),
      darkTheme: ThemeData(
          useMaterial3: true,
          fontFamily: "Quicksand",
          colorScheme: const ColorScheme.dark()),
      themeMode: ThemeMode.system,
      home: OwnerDetailsScreen()
    );
  }
}
