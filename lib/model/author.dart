import 'dart:convert';

class Author {
  Author({
    this.birthYear,
    this.deathYear,
    required this.name,
  });

  final int? birthYear;
  final int? deathYear;
  final String name;

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        birthYear: json["birth_year"],
        deathYear: json["death_year"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "birth_year": birthYear,
        "death_year": deathYear,
        "name": name,
      };
}
