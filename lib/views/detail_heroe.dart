import 'package:flutter/material.dart';

class DetailHeroe extends StatelessWidget {
  Map<String, dynamic>? heroe;

  DetailHeroe({super.key, this.heroe});

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

    Map<String, dynamic> comics = heroe["comics"];
    int comicsQuant = comics["available"];

    Map<String, dynamic> series = heroe["series"];
    int seriesQuant = series["available"];
    List seriesList = series["items"];
    if (seriesQuant >= 3) {
      seriesList = seriesList.sublist(0, 3);
    } else {
      seriesList = [
        {"name": "No hay series para mostrar"},
        {"name": "No hay series para mostrar"},
        {"name": "No hay series para mostrar"},
      ];
    }

    Map<String, dynamic> stories = heroe["stories"];
    int storiesQuant = stories["available"];

    Map<String, dynamic> events = heroe["events"];
    int eventsQuant = events["available"];

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
        createIconBar(comicsQuant, seriesQuant, storiesQuant, eventsQuant),
        createExpansion(seriesList),
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

createIconBar(comics, series, stories, events) {
  const color = Color.fromARGB(255, 125, 0, 0);
  return Container(
    margin: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        createIcon(
            "Comics",
            comics,
            const Icon(
              Icons.book,
              color: color,
            )),
        createIcon(
            "Series",
            series,
            const Icon(
              Icons.movie,
              color: color,
            )),
        createIcon(
            "Stories",
            stories,
            const Icon(
              Icons.history,
              color: color,
            )),
        createIcon(
            "Events",
            events,
            const Icon(
              Icons.event,
              color: color,
            )),
      ],
    ),
  );
}

createIcon(text, int quantity, Icon icon) {
  String quant = quantity.toString();
  return Column(
    children: [
      icon,
      Text(text),
      Text(quant,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
    ],
  );
}

createExpansion(seriesList) {
  String firstSerie = seriesList[0]["name"];
  String secondSerie = seriesList[1]["name"];
  String thirdSerie = seriesList[2]["name"];
  const color = Color.fromARGB(255, 125, 0, 0);
  return ExpansionTile(
    iconColor: color,
    textColor: color,
    title: const Text("Tres primeras series del heroe",
        textAlign: TextAlign.center),
    children: [
      Text(firstSerie,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      Text(secondSerie,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      Text(thirdSerie,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
    ],
  );
}
