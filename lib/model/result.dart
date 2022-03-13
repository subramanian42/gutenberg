import 'dart:convert';

import 'package:gutenberg/model/book.dart';

class BookListFromJson {
  BookListFromJson({
    required this.count,
    this.next,
    this.previous,
    this.books,
  });

  int count;
  String? next;
  String? previous;
  List<Book>? books;

  factory BookListFromJson.fromRawJson(String str) =>
      BookListFromJson.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookListFromJson.fromJson(Map<String, dynamic> json) =>
      BookListFromJson(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        books: List<Book>.from(json["results"].map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(books!.map((x) => x.toJson())),
      };
}
