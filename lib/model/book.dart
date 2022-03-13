import 'dart:convert';

import 'package:gutenberg/model/author.dart';

import 'book_formats.dart';

class Book {
  Book({
    this.id,
    this.authors,
    this.bookshelves,
    this.downloadCount,
    this.formats,
    this.mediaType,
    this.subjects,
    required this.title,
  });

  int? id;
  List<Author>? authors;
  List<String>? bookshelves;
  int? downloadCount;
  BookFormats? formats;

  MediaType? mediaType;
  List<String>? subjects;
  String title;

  factory Book.fromRawJson(String str) => Book.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        authors:
            List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
        downloadCount: json["download_count"],
        formats: BookFormats.fromJson(json["formats"]),
        mediaType: mediaTypeValues.map[json["media_type"]] ?? MediaType.text,
        subjects: List<String>.from(json["subjects"].map((x) => x)),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "authors": List<dynamic>.from(authors!.map((x) => x.toJson())),
        "bookshelves": List<dynamic>.from(bookshelves!.map((x) => x)),
        "download_count": downloadCount,
        "formats": formats!.toJson(),
        "media_type": mediaTypeValues.reverse[mediaType],
        "subjects": List<dynamic>.from(subjects!.map((x) => x)),
        "title": title,
      };
}

enum MediaType { text }

final mediaTypeValues = EnumValues({"Text": MediaType.text});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return reverseMap ??= map.map((k, v) => MapEntry(v, k));
  }
}
