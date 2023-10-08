import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';

class BookRow extends StatelessWidget {
  const BookRow({
    Key? key,
    required this.books,
    required this.title,
  }) : super(key: key);

  final List<Book> books;
  final String title;

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
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton(
                onPressed: () {},
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
                    return Container(
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
                    );
                  },
                ),
        ),
        SizedBox(height: displayHeight * 0.02),
      ],
    );
  }
}
