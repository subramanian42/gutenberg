import 'package:flutter/material.dart';

import 'normal_screen_view.dart';
import 'smaller_screen_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxHeight < 750) {
        return const SmallerScreenView();
      } else {
        return const NormalScreenView();
      }
    });
  }
}
