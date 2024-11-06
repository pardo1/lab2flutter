import 'package:flutter/material.dart';
import 'package:blah2/pages/home_page.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wine Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 182, 78, 71),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Wine Shop Home'),
    );
  }
}
