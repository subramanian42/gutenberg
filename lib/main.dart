import 'package:flutter/material.dart';

import 'package:gutenberg/utils/theme/theme.dart';
import 'package:gutenberg/view/category/category_view.dart';

void main() async {
  runApp(
    const Gutenberg(),
  );
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
