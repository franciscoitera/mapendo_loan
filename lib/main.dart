import 'package:flutter/material.dart';
import 'package:mapendo/screens/first_screen.dart';
import 'package:mapendo/screens/auth/login_screen.dart';
import 'package:mapendo/screens/auth/verify.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black))),
      // home: FirstScreen(),
      initialRoute: 'home',
      routes: {
        'home': (context) => FirstScreen(),
        'phone': (context) => const MyPhone(),
        'verify': (context) => const MyVerify()
      },
    );
  }
}
