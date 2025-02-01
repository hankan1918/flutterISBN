class BookModel {
  final String title;
  final String author;
  final String page;
  final String isbn;

  BookModel({
    required this.title,
    required this.author,
    required this.page,
    required this.isbn,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json["TITLE"] ?? "Unknown Title",
      author: json["AUTHOR"] ?? "Unknown Author",
      page: json["PAGE"] ?? "0",
      isbn: json["SET_ISBN"] ?? "0",
    );
  }
}
