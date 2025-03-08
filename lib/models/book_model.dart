class BookModel {
  final String title;
  final String image;
  final String author;
  final String discount;
  final String publisher;
  final String pubdate;
  final String isbn;
  final String description;

  BookModel({
    required this.title,
    required this.image,
    required this.author,
    required this.discount,
    required this.publisher,
    required this.pubdate,
    required this.isbn,
    required this.description,
  });

  factory BookModel.fromJson(Map<String, dynamic> item) {
    return BookModel(
      title: item["title"] ?? "Unknown title",
      image: item["image"] ?? "Unknown image",
      author: item["author"] ?? "Unknown author",
      discount: item["discount"] ?? "Unknown discount",
      publisher: item["publisher"] ?? "Unknown publisher",
      pubdate: item["pubdate"] ?? "Unknown pubdate",
      isbn: item["isbn"] ?? "Unknown isbn",
      description: item["description"] ?? "Unknown description",
    );
  }
}
