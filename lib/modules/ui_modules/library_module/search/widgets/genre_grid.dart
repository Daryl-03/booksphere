import 'package:booksphere/modules/component_modules/library_component/domain/entities/genre.dart';
import 'package:booksphere/modules/ui_modules/library_module/genres/genre_screen.dart';
import 'package:booksphere/utils/book_genre_utils.dart';
import 'package:flutter/material.dart';

class GenreGrid extends StatelessWidget {
  const GenreGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Genre> genres = BookGenreUtils.getAppGenres();

    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        children: genres
            .map(
              (genre) => Card(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GenreScreen(genre: genre),
                      ));
                  },
                  child: Center(
                    child: Text(
                      genre.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
