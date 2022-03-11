import 'package:flutter/material.dart';

import '../../widgets/genre_card.dart';

class GenreCardView extends StatelessWidget {
  const GenreCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 650) {
        return Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40),
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight * (2 / 3),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 60,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              children: const [
                GenreCard(
                  svgAsset: 'assets/icons/Fiction.svg',
                  genre: 'fiction',
                ),
                GenreCard(
                  svgAsset: 'assets/icons/Drama.svg',
                  genre: 'drama',
                ),
                GenreCard(
                  svgAsset: 'assets/icons/Humour.svg',
                  genre: 'humour',
                ),
                GenreCard(
                  svgAsset: 'assets/icons/Politics.svg',
                  genre: 'politics',
                ),
                GenreCard(
                    svgAsset: 'assets/icons/Philosophy.svg',
                    genre: 'philosophy'),
                GenreCard(
                    svgAsset: 'assets/icons/History.svg', genre: 'history'),
                GenreCard(
                    svgAsset: 'assets/icons/Adventure.svg', genre: 'adventure'),
              ],
            ),
          ),
        );
      } else {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight * (2 / 3),
          child: Column(
            children: const [
              GenreCard(
                svgAsset: 'assets/icons/Fiction.svg',
                genre: 'fiction',
              ),
              GenreCard(
                svgAsset: 'assets/icons/Drama.svg',
                genre: 'drama',
              ),
              GenreCard(
                svgAsset: 'assets/icons/Humour.svg',
                genre: 'humour',
              ),
              GenreCard(
                svgAsset: 'assets/icons/Politics.svg',
                genre: 'politics',
              ),
              GenreCard(
                  svgAsset: 'assets/icons/Philosophy.svg', genre: 'philosophy'),
              GenreCard(svgAsset: 'assets/icons/History.svg', genre: 'history'),
              GenreCard(
                  svgAsset: 'assets/icons/Adventure.svg', genre: 'adventure'),
            ],
          ),
        );
      }
    });
  }
}
