import 'package:flutter/material.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/update_product_screen.dart';

void main() {
  runApp(const StoreApp());
}
class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        UpdateProudectPage.id: (context) => UpdateProudectPage(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
