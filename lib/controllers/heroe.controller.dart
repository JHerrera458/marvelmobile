import 'dart:convert';

import 'package:marvelmobile/controllers/http_service.dart';
import 'package:marvelmobile/models/heroe.dart';

class HeroesController {
  HttpService httpService = HttpService();

  Future<Heroe> getHeroes() async {
    String ts = "1";
    String apikey = "21a4da889edbe77bc6cb0a69e352ec87";
    String hash = "84fbb30897280ab8b56fcdd59fb4ffe2";
    String url =
        "https://gateway.marvel.com/v1/public/characters?limit=20&offset=0&ts=$ts&apikey=$apikey&hash=$hash";
    dynamic response = await httpService.get(Uri.parse(url));
    Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;
    Heroe heroe = Heroe.fromJson(json);
    return heroe;
  }
}
