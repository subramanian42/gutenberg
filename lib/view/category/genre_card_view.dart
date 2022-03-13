import 'package:flutter/material.dart';

import 'package:gutenberg/utils/constants.dart';
import 'package:gutenberg/view/search/search_view.dart';

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
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 60,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final svgAsset = genreList[index].svgAsset;
                    final genre = genreList[index].genre;
                    return GenreCard(
                        svgAsset: svgAsset,
                        genre: genre,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchView(
                                title: genre,
                              ),
                            ),
                          );
                        });
                  })),
        );
      } else {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight * (2 / 3),
          child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                final svgAsset = genreList[index].svgAsset;
                final genre = genreList[index].genre;
                return GenreCard(
                    svgAsset: svgAsset,
                    genre: genre,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchView(
                            title: genre,
                          ),
                        ),
                      );
                    });
              }),
        );
      }
    });
  }
}
