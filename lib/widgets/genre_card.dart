import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({required this.svgAsset, required this.genre, Key? key})
      : super(key: key);
  final String svgAsset;
  final String genre;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth - 40,
        height: 50,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 5,
                spreadRadius: 0,
                color: Color.fromRGBO(211, 209, 238, 0.5)),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          leading: SvgPicture.asset(
            svgAsset,
            width: 30,
          ),
          title: Text(
            genre.toUpperCase(),
            style: Theme.of(context).textTheme.headline3,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/Next.svg',
            ),
          ),
        ),
      );
    });
  }
}
