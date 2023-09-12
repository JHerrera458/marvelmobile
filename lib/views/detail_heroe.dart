import 'package:flutter/material.dart';

class DetailHeroe extends StatelessWidget {
  final Map<String, dynamic>? heroe;

  const DetailHeroe({super.key, this.heroe});

  @override
  Widget build(BuildContext context) {
    String name = heroe!["name"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Información de $name"),
        backgroundColor: const Color.fromARGB(255, 125, 0, 0),
      ),
      body: createInfo(heroe),
    );
  }

  createInfo(heroe) {
    String description = heroe["description"];
    Map<String, dynamic> thumbnail = heroe["thumbnail"];
    String photoUrl = thumbnail["path"];
    String photoExtension = thumbnail["extension"];
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: createImage(
              photoUrl,
              photoExtension,
            )),
        Container(
          margin: const EdgeInsets.all(10),
          child: (description.isEmpty
              ? const Text("No tiene descripción")
              : Text(
                  description,
                  style: const TextStyle(fontSize: 15),
                )),
        ),
      ],
    );
  }
}

createImage(url, extension) {
  String urlPhoto = ("$url.$extension");
  return Container(
    width: double.infinity,
    height: 393,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(urlPhoto),
      ),
    ),
  );
}
