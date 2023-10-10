import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/ui_modules/library_module/book_detail/book_detail_screen.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(book: book),
          ));
      },
      child: Container(
        height: displayHeight * 0.26,
        margin: EdgeInsets.all(displayWidth * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(displayWidth * 0.02),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: displayWidth * 0.27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(displayWidth * 0.02),
                image: DecorationImage(
                  image: NetworkImage(
                    book.coverImg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(displayWidth * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      book.title,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: displayHeight * 0.01,
                    ),
                    //authors
                    Row(
                      children: [
                        Text(
                          "by : ",
                          style: theme.textTheme.labelLarge,
                        ),
                        Expanded(
                          child: Text(
                            book.authors.join(", "),
                            style: theme.textTheme.labelLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: displayHeight * 0.01,
                    ),
                    // rating
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: book.rating,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: displayWidth * 0.065,
                        ),
                        SizedBox(
                          width: displayWidth * 0.02,
                        ),
                        // number of ratings
                        Text(
                          "(${book.numRatings} ratings)",
                          style: theme.textTheme.labelSmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: displayHeight * 0.01,
                    ),
                    // genres tags
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: book.genres
                            .map(
                              (genre) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Chip(
                                    label: Text(
                                      genre,
                                      style: theme.textTheme.labelSmall,
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayWidth * 0.02,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
