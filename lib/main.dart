import 'package:flutter/material.dart';
import './pages/login.dart';
import './pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(title: 'Authorization'),
        '/dashboard': (context) => const Dashboard(),
      },
    );
  }
}
