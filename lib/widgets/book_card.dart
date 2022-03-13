import 'package:flutter/material.dart';
import 'package:gutenberg/model/book_formats.dart';
import 'package:url_launcher/url_launcher.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.formats,
  }) : super(key: key);
  final String title;
  final String author;
  final String imageUrl;
  final BookFormats formats;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 114,
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => redirectPage(context),
            child: Container(
              width: 114,
              height: 162,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 5,
                      spreadRadius: 0,
                      color: Color.fromRGBO(211, 209, 238, 0.5)),
                ],
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.fill),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 2,
            child: Text(
              title.toUpperCase(), //width: 114,
              //height: 35,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          Expanded(
            flex: 1,
            child: Text(
              author.replaceAll(',', ''), // width: 110,
              // height: 20,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }

  void redirectPage(BuildContext context) async {
    if (formats.textHtmlCharsetIso88591 != null) {
      await launch(formats.textHtmlCharsetIso88591!);
    } else if (formats.textHtmlCharsetUsAscii != null) {
      await launch(formats.textHtmlCharsetUsAscii!);
    } else if (formats.textHtmlCharsetUtf8 != null) {
      await launch(formats.textHtmlCharsetUtf8!);
    } else if (formats.textHtml != null) {
      await launch(formats.textHtmlCharsetUtf8!);
    } else if (formats.textPlainCharsetIso88591 != null) {
      await launch(formats.textPlainCharsetIso88591!);
    } else if (formats.textPlainCharsetUsAscii != null) {
      await launch(formats.textPlainCharsetUsAscii!);
    } else if (formats.textPlainCharsetUtf8 != null) {
      await launch(formats.textPlainCharsetUtf8!);
    } else if (formats.applicationPdf != null) {
      await (launch(formats.applicationPdf!));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return Column(
              children: [
                Text(
                  'Error:No valid File Types found',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'OK',
                      style: Theme.of(context).textTheme.button,
                    ))
              ],
            );
          });
    }
  }
}
