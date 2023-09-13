import 'package:flutter/material.dart';
import 'package:marvelmobile/views/detail_heroe.dart';
import 'package:marvelmobile/views/home_heroes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: createHome(),
      routes: {
        "HeroDetails": (context) => DetailHeroe(),
      },
    );
  }
}

createHome() {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Marvel MOBILE"),
      backgroundColor: const Color.fromARGB(255, 125, 0, 0),
    ),
    body: const HomeHeroes(),
  );
}

createBanner() {
  return const Image(image: AssetImage("assets/images/banner.jpg"));
}
