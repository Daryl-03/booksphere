import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';

class BookLibraryItem extends StatelessWidget {
  const BookLibraryItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return Container(
      width: displayWidth * 0.3,
      margin: EdgeInsets.symmetric(horizontal: displayWidth * 0.02),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              book.coverImg,
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
              book.title,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
