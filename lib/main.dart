import 'package:flutter/material.dart';
import 'package:marvelmobile/views/detail_heroe.dart';
import 'package:marvelmobile/views/list_heroes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    body: Column(
      children: [
        createBanner(),
        const Expanded(child: HomeHeroes()),
      ],
    ),
  );
}

createBanner() {
  return const Image(image: AssetImage("assets/images/banner.png"));
}
