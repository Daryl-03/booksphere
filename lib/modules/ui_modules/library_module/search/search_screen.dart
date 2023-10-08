import 'package:booksphere/modules/ui_modules/library_module/search/widgets/genre_grid.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          title: const Text("Search books"),
          backgroundColor: theme.colorScheme.background,
        ),
        body: Column(
          children: [
            SizedBox(
              height: displayHeight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: displayWidth * 0.05),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.red,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusColor: Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: displayHeight * 0.03,
            ),
            const GenreGrid()
          ],
        ));
  }
}
