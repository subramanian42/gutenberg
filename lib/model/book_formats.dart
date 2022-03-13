import 'dart:convert';

class BookFormats {
  BookFormats({
    this.applicationXMobipocketEbook,
    this.applicationPdf,
    this.textPlainCharsetUsAscii,
    this.textPlainCharsetUtf8,
    this.applicationRdfXml,
    this.applicationZip,
    this.applicationEpubZip,
    this.textHtmlCharsetUtf8,
    this.textPlainCharsetIso88591,
    required this.imageJpeg,
    this.textPlain,
    this.textHtmlCharsetUsAscii,
    this.textHtml,
    this.textRtf,
    this.textHtmlCharsetIso88591,
    this.applicationPrsTex,
  });

  String? applicationXMobipocketEbook;
  String? applicationPdf;
  String? textPlainCharsetUsAscii;
  String? textPlainCharsetUtf8;
  String? applicationRdfXml;
  String? applicationZip;
  String? applicationEpubZip;
  String? textHtmlCharsetUtf8;
  String? textPlainCharsetIso88591;
  String imageJpeg;
  String? textPlain;
  String? textHtmlCharsetUsAscii;
  String? textHtml;
  String? textRtf;
  String? textHtmlCharsetIso88591;
  String? applicationPrsTex;

  factory BookFormats.fromRawJson(String str) =>
      BookFormats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookFormats.fromJson(Map<String, dynamic> json) => BookFormats(
        applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
        applicationPdf: json["application/pdf"],
        textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"],
        textPlainCharsetUtf8: json["text/plain; charset=utf-8"],
        applicationRdfXml: json["application/rdf+xml"],
        applicationZip: json["application/zip"],
        applicationEpubZip: json["application/epub+zip"],
        textHtmlCharsetUtf8: json["text/html; charset=utf-8"],
        textPlainCharsetIso88591: json["text/plain; charset=iso-8859-1"],
        imageJpeg: json["image/jpeg"],
        textPlain: json["text/plain"],
        textHtmlCharsetUsAscii: json["text/html; charset=us-ascii"],
        textHtml: json["text/html"],
        textRtf: json["text/rtf"],
        textHtmlCharsetIso88591: json["text/html; charset=iso-8859-1"],
        applicationPrsTex: json["application/prs.tex"],
      );

  Map<String, dynamic> toJson() => {
        "application/x-mobipocket-ebook": applicationXMobipocketEbook,
        "application/pdf": applicationPdf,
        "text/plain; charset=us-ascii": textPlainCharsetUsAscii,
        "text/plain; charset=utf-8": textPlainCharsetUtf8,
        "application/rdf+xml": applicationRdfXml,
        "application/zip": applicationZip,
        "application/epub+zip": applicationEpubZip,
        "text/html; charset=utf-8": textHtmlCharsetUtf8,
        "text/plain; charset=iso-8859-1": textPlainCharsetIso88591,
        "image/jpeg": imageJpeg,
        "text/plain": textPlain,
        "text/html; charset=us-ascii": textHtmlCharsetUsAscii,
        "text/html": textHtml,
        "text/rtf": textRtf,
        "text/html; charset=iso-8859-1": textHtmlCharsetIso88591,
        "application/prs.tex": applicationPrsTex,
      };
}
