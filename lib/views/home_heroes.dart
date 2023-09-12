import "package:flutter/material.dart";
import "package:marvelmobile/controllers/heroe.controller.dart";
import "package:marvelmobile/views/detail_heroe.dart";

class HomeHeroes extends StatefulWidget {
  const HomeHeroes({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeHeroes();
  }
}

class _HomeHeroes extends State<HomeHeroes> {
  final HeroesController _heroesController = HeroesController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _heroesController.getHeroes(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text("CARGANDO...");
          case ConnectionState.done:
            {
              if (snapshot.hasData) {
                dynamic data = snapshot.data!.data;
                return createList(data);
              } else {
                return Text(snapshot.error.toString());
              }
            }
          default:
            return const Text("Ha ocurrido un error");
        }
      },
    );
  }

  createList(data) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return createCard(data[index], context);
        }),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: data.length);
  }

  createCard(heroe, context) {
    String name = heroe["name"];
    // String description = heroe["description"];
    Map<String, dynamic> thumbnail = heroe["thumbnail"];
    String photoUrl = thumbnail["path"];
    String photoExtension = thumbnail["extension"];
    return Column(
      children: [
        createText(name),
        createImage(photoUrl, photoExtension),
        createIconButton(context, heroe)
      ],
    );
  }

  createIconButton(context, heroe) {
    return IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailHeroe(
                heroe: heroe,
              ),
            ),
          );
        },
        icon: const Icon(Icons.info));
  }

  createText(text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 30),
    );
  }

  createImage(url, extension) {
    String urlPhoto = ("$url.$extension");
    return Container(
      width: double.infinity,
      height: 285,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(urlPhoto),
        ),
      ),
    );
  }
}
