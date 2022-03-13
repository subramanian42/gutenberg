const booksUrl = 'http://skunkworks.ignitesol.com:8000/books';
const booksGenreUrl =
    'http://skunkworks.ignitesol.com:8000/books?mime_type=image&topic=';

class Genre {
  String svgAsset;
  String genre;
  Genre(this.svgAsset, this.genre);
}

final genreList = [
  Genre('assets/icons/Fiction.svg', 'Fiction'),
  Genre('assets/icons/Drama.svg', 'Drama'),
  Genre('assets/icons/Humour.svg', 'Humour'),
  Genre('assets/icons/Politics.svg', 'Politics'),
  Genre('assets/icons/Philosophy.svg', 'Philosophy'),
  Genre('assets/icons/History.svg', 'History'),
  Genre('assets/icons/Adventure.svg', 'Adventure'),
];
