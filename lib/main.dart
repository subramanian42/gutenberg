import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:gutenberg/utils/theme/theme.dart';
import 'package:gutenberg/view/category_view.dart';
//import 'package:gutenberg/view/category_view.dart';
import 'package:gutenberg/view/search_view.dart';

void main() {
  runApp(
    //DevicePreview(enabled: !kReleaseMode, builder: (context) => const Gutenberg())
    const Gutenberg(),
  );
}

class Gutenberg extends StatelessWidget {
  const Gutenberg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.customTheme,
      //useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // home: GestureDetector(
      //     onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      //     child: const Scaffold(
      //       body: Center(
      //           child: BookCard(
      //         title: 'harry potter and the deathly hallows',
      //         author: 'Charles Dickens',
      //       )),
      //     )),

      home: const CategoryView(),
    );
  }
}
