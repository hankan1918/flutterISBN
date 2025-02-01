import 'package:flutter/material.dart';
import 'package:isbn_recoder/models/book_model.dart';
import 'package:isbn_recoder/services/api_service.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  List<BookModel> books = [];
  bool isLoading = false;
  final TextEditingController _isbncontroller = TextEditingController();

  void searchBooks() async {
    setState(() => isLoading = true);
    try {
      books = await ApiService.fetchBooks(_isbncontroller.text);
    } catch (e) {
      books = [];
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  child: TextField(
                    controller: _isbncontroller,
                    decoration: InputDecoration(labelText: "ISBN"),
                  ),
                ),
                ElevatedButton(
                  onPressed: searchBooks,
                  child: Text("Search"),
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
                    return Card(
                      child: ListTile(
                        title: Text(book.title),
                        subtitle: Text("${book.author} | ${book.page}"),
                        trailing: Text(book.isbn),
                      ),
                    );
                  },
                ))
        ],
      ),
    );
  }
}
