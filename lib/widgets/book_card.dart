import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key, required this.title, required this.author})
      : super(key: key);
  final String title;
  final String author;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onSecondary,
      width: 114,
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 114,
            height: 162,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 5,
                    spreadRadius: 0,
                    color: Color.fromRGBO(211, 209, 238, 0.5)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2.1),
            child: Text(
              title.toUpperCase(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            author,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
