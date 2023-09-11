import "package:flutter/material.dart";
import "package:marvelmobile/controllers/heroe.controller.dart";

class HomeHeroes extends StatefulWidget {
  const HomeHeroes({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeHeroes();
  }
}

class _HomeHeroes extends State<HomeHeroes> {
  HeroesController _heroesController = HeroesController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _heroesController.getHeroes(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text("CARGANDO...");
            case ConnectionState.done:
              {
                if (snapshot.hasData) {
                  String frase = snapshot.data!.data.toString();
                  print(frase);
                  return const Text("CONSULTA COMPLETA");
                } else {
                  return Text(snapshot.error.toString());
                }
              }
            default:
              return const Text("Ha ocurrido un error");
          }
        },
      ),
    );
  }
}
