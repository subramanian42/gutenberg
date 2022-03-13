import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'genre_card_view.dart';

class NormalScreenView extends StatelessWidget {
  const NormalScreenView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/icons/Pattern.svg',
                fit: BoxFit.fill,
                width: constraints.maxWidth,
                height: constraints.maxHeight / 3,
              ),
              Positioned(
                top: 60,
                left: 20,
                child: SizedBox(
                  width: constraints.maxWidth / 1.5,
                  height: 120,
                  child: Text(
                    'Gutenberg Project',
                    softWrap: true,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 20,
                child: SizedBox(
                  width: constraints.maxWidth >= 500
                      ? constraints.maxWidth / 1.5
                      : constraints.maxWidth / 1.25,
                  height: 90,
                  child: Text(
                    'A social cataloging website that allows you to freely search its database of books, annotations, and reviews.',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                child: SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight, //* (2 / 3),
                    child: const GenreCardView()),
              ),
            ],
          ),
        ),
      );
    });
  }
}
