import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart CashNote',

      theme: ThemeData(
        primarySwatch: Colors.indigo,

        scaffoldBackgroundColor: Colors.grey[100],

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,

          foregroundColor: Colors.black,

          elevation: 0,

          centerTitle: true,
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF4F46E5),

          foregroundColor: Colors.white,
        ),
      ),

      home: const HomeScreen(),
    );
  }
}
