import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/genre.dart';
import 'package:booksphere/modules/ui_modules/library_module/book_detail/book_detail_screen.dart';
import 'package:booksphere/modules/ui_modules/library_module/genres/genre_screen.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';

class BookRow extends StatelessWidget {
  const BookRow({
    Key? key,
    required this.books,
    required this.genre,
  }) : super(key: key);

  final List<Book> books;
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                genre.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GenreScreen(genre: genre),
                      ));
                },
                child: const Text("See All"),
              ),
            ],
          ),
        ),
        Container(
          // color: theme.colorScheme.secondaryContainer,
          height: displayHeight * 0.3,
          child: books.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: theme.colorScheme.onBackground,
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BookDetailScreen(book: books[index]),
                          ),
                        );
                      },
                      child: Container(
                        width: displayWidth * 0.3,
                        margin: EdgeInsets.symmetric(horizontal: displayWidth * 0.02),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Image.network(
                                books[index].coverImg,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.error),
                                  );
                                },
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                books[index].title,
                                style: Theme.of(context).textTheme.labelMedium,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        SizedBox(height: displayHeight * 0.02),
      ],
    );
  }
}
