import 'package:flutter/material.dart';
import 'package:isbn_recoder/screens/book_list_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BookListScreen(),
      ),sdf
    );
  }
}
