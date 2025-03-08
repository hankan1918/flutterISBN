// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:isbn_recoder/models/book_model.dart';
import 'package:http/http.dart' as http;

class ApiServiceProxy {
  static Future<List<BookModel>> fetchBooks(
      String term, String searchType) async {
    final url = Uri.parse(
        "http://localhost:52839/proxy?searchType=$searchType&term=$term");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      if (jsonData.isNotEmpty) {
        return jsonData.map((json) => BookModel.fromJson(json)).toList();
      }
      return [];
    } else {
      throw Exception("Failed to load books");
    }
  }
}
