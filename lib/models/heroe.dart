class Heroe {
  late String data;

  Heroe.fromJson(Map<String, dynamic> json) {
    data = json["status"];
  }
}
