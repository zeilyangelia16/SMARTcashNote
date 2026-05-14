import 'package:flutter/material.dart';
import 'package:smartcashnote/screens/home_screen.dart';
import 'package:smartcashnote/screens/login_screen.dart';
import 'package:smartcashnote/services/session_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  late final Future<bool> _loginFuture;

  @override
  void initState() {
    super.initState();
    _loginFuture = SessionService.isLoggedIn();
  }

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) =>
            HomeScreen(toggleTheme: toggleTheme, isDarkMode: isDarkMode),
      },
      home: FutureBuilder<bool>(
        future: _loginFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasData && snapshot.data == true) {
            return HomeScreen(toggleTheme: toggleTheme, isDarkMode: isDarkMode);
          }

          return const LoginScreen();
        },
      ),
    );
  }
}
