import 'package:flutter/material.dart';
import 'package:smita_portfolio/feature/presentation/view/web_app_icon.dart';
import 'package:smita_portfolio/feature/presentation/view/widget/home_page.dart';

void main() {
    setFavicon('assets/project/smita.png');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smita Karki',
      theme: ThemeData(
   
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

