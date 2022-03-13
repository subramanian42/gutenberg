import 'package:flutter/material.dart';
import 'package:gutenberg/repo/api_result.dart';
import 'package:http/http.dart' as http;
import 'package:gutenberg/utils/theme/theme.dart';
import 'package:gutenberg/view/category/category_view.dart';

import 'model/result.dart';

void main() async {
  runApp(
    const Gutenberg(),
  );
  // String genre = 'Politics';
  // String bookUrl =
  //     'http://skunkworks.ignitesol.com:8000/books?mime_type=image&page=1&topic=$genre';

  // Uri url = Uri.parse(bookUrl);
  // final response = await http.get(url);
  // if (response.statusCode == 200) {
  //   print(response.body.toString());
  // }
}

class Gutenberg extends StatelessWidget {
  const Gutenberg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.customTheme,
      home: const CategoryView(),
    );
  }
}
