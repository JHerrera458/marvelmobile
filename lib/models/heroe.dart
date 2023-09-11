class Heroe {
  late List data;
  late String name;
  Heroe.fromJson(Map<String, dynamic> json) {
    data = json["data"]["results"];
  }
}
