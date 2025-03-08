import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:isbn_recoder/models/book_model.dart';
import 'package:isbn_recoder/services/api_service_proxy.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<BookModel> books = [];
  bool isLoading = false;
  String currentSearchType = "title";
  final TextEditingController _isbncontroller = TextEditingController();

  Future<void> scanBarcode() async {
    String previousSearchType = currentSearchType;
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        _isbncontroller.text = result.rawContent;
        currentSearchType = "isbn";
        searchBooks();
      });
    } catch (e) {
      setState(() {
        _isbncontroller.text = "";
      });
    } finally {
      currentSearchType = previousSearchType;
    }
  }

  void searchBooks() async {
    setState(() => isLoading = true);
    try {
      books = await ApiServiceProxy.fetchBooks(
          _isbncontroller.text, currentSearchType);
    } catch (e) {
      books = [];
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; // 화면 높이 가져오기
    double imageHeight = screenHeight * 0.5; // 화면 높이의 50%로 설정

    return Scaffold(
      appBar: AppBar(
        title: Text("ISBN RECORDER"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                DropdownButton(
                  value: currentSearchType,
                  items: [
                    DropdownMenuItem(value: "title", child: Text("도서명")),
                    DropdownMenuItem(value: "isbn", child: Text("ISBN")),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        currentSearchType = value;
                      });
                    }
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _isbncontroller,
                    decoration: InputDecoration(labelText: "도서 검색"),
                    onSubmitted: (value) => searchBooks(),
                  ),
                ),
                ElevatedButton(
                  onPressed: searchBooks,
                  child: Text("Search"),
                ),
                ElevatedButton(
                  onPressed: scanBarcode,
                  child: Text("Scan"),
                ),
              ],
            ),
          ),
          isLoading
              ? CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return Column(
                      children: [
                        Image.network(
                          "http://localhost:52839/image-proxy?url=${book.image}",
                          height: imageHeight,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'default_image.png',
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                        Card(
                          child: ListTile(
                            title: Text(book.title),
                            subtitle:
                                Text("${book.author} | ${book.publisher}"),
                            trailing: Text(book.isbn),
                          ),
                        ),
                      ],
                    );
                  },
                ))
        ],
      ),
    );
  }
}
