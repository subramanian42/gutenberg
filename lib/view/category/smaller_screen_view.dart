import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gutenberg/view/category/genre_card_view.dart';

class SmallerScreenView extends StatelessWidget {
  const SmallerScreenView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SingleChildScrollView(
            child: SizedBox(
              width: constraints.maxWidth,
              height: 750,
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
                    child: Text(
                      'Gutenberg \nProject',
                      softWrap: true,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 20,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      height: 60,
                      child: constraints.maxWidth < 380
                          ? Text(
                              '''A social cataloging website that allows you to 
freely search its database of books, 
annotations, and reviews.''',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          : Text(
                              '''A social cataloging website that allows you to freely search its database of books, 
annotations, and reviews.''',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                    ),
                  ),
                  Positioned(
                      top: 300,
                      child: SizedBox(
                        width: constraints.maxWidth,
                        height: 750 * (2 / 3),
                        child: const GenreCardView(),
                      )),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
