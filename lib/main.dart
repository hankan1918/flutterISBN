import 'package:flutter/material.dart';
import 'package:isbn_recoder/screens/book_list_screen.dart';
import 'package:isbn_recoder/screens/home_screen.dart';
import 'package:isbn_recoder/screens/test_screen.dart';
import 'package:isbn_recoder/widgets/ticket_painter.dart';
import 'package:isbn_recoder/widgets/ticket_ui.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 2;
  final List<Widget> _screens = [
    HomeScreen(),
    BookListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.recycling), label: "Test"),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        // body: _screens[_currentIndex],
        body: TicketUiScreen(),
      ),
    );
  }
}
