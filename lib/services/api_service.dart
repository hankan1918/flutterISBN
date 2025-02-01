import 'dart:convert';

import 'package:isbn_recoder/apis/keys.dart';
import 'package:isbn_recoder/models/book_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<BookModel>> fetchBooks(String isbn) async {
    final key = ISBNKey;
    // final isbn = "9788925588735";
    final baseUrl =
        "https://www.nl.go.kr/seoji/SearchApi.do?cert_key=$key&result_style=json&page_no=1&page_size=10&isbn=$isbn";

    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      if (jsonData.containsKey("docs") && jsonData["docs"] is List) {
        final List<dynamic> docs = jsonData["docs"];
        return docs.map((json) => BookModel.fromJson(json)).toList();
      }
      return [];
    } else {
      throw Exception("Failed to load books");
    }
  }
}
