import 'package:booksphere/modules/ui_modules/library_module/search/search_screen.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';
import 'library/library_screen.dart';
import 'recommendation/recommendation_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  var _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const RecommendationScreen(),
    const LibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // backgroundColor: theme.colorScheme.primary,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: theme.colorScheme.secondaryContainer,
        fixedColor: theme.colorScheme.onSecondaryContainer,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: theme.colorScheme.onSecondaryContainer.withOpacity(0.5),
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
              // recommendation screen
              icon: Icon(Icons.lightbulb),
              label: "Recommendation"),
          //library screen
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library),
            label: "Library",
          )
        ],
      ),
    );
  }
}
