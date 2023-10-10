import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'book_detail_bloc.dart';
import 'book_detail_event.dart';
import 'book_detail_state.dart';
import 'widgets/BookLibraryInput.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  final genres = [
    'Action',
    'Adventure',
    'Drama',
    'Fantasy',
    'Sci-Fi',
    'Thriller'
  ];
  final _bookDetailBloc = BookDetailBloc();

  @override
  void initState() {
    _bookDetailBloc.add(InitBookDetailState(widget.book.bookId));
    super.initState();
  }

  void _onAddToLibrary() async {
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return const BookLibraryInput(
              userHistory: null,
              rating: null,
              book: Book(
                title: 'The Hunger Games',
                genres: [],
                bookId: '1',
                description: '',
                coverImg: '',
                isbn: '',
                pages: 200,
                rating: 0,
                numRatings: 0,
                authors: [],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return BlocConsumer(
        bloc: _bookDetailBloc,
        listener: (BuildContext context, BookDetailState state) {},
        builder: (context, BookDetailState state) {
          return Scaffold(
            backgroundColor: theme.colorScheme.primary,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: theme.colorScheme.secondaryContainer,
              foregroundColor: theme.colorScheme.onSecondaryContainer,
            ),
            body: Column(children: [
              SizedBox(
                width: displayWidth,
                height: displayHeight * 0.4,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: theme.colorScheme.secondaryContainer,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: displayWidth,
                            color: theme.colorScheme.primary,
                            //  book description
                          ),
                        ),
                      ],
                    ),
                    // book cover image
                    Positioned(
                      top: displayHeight * 0.015,
                      left: displayWidth * 0.5 - displayWidth * 0.2,
                      child: Container(
                        width: displayWidth * 0.4,
                        height: displayHeight * 0.3,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(displayWidth * 0.02),
                          image: DecorationImage(
                            image: Image.network(
                              'https://fr.web.img5.acsta.net/medias/nmedia/18/64/34/28/18771027.jpg',
                            ).image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // book title
                    Positioned(
                      top: displayHeight * 0.33,
                      child: SizedBox(
                        width: displayWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'The Hunger Games',
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: theme.colorScheme.primary,
                width: displayWidth,
                height: displayHeight * 0.5,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: displayHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Suzanne Collins',
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: displayHeight * 0.02,
                        ),
                        //        isbn and number of pages
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ISBN : 9780439023481 | 374 pages',
                              style: theme.textTheme.labelLarge!.copyWith(
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: displayHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBarIndicator(
                              rating: 4.5,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: displayWidth * 0.065,
                              unratedColor: theme.colorScheme.onPrimary,
                            ),
                            SizedBox(
                              width: displayWidth * 0.02,
                            ),
                            // number of ratings
                            Text(
                              "(2 ratings)",
                              style: theme.textTheme.labelSmall!.copyWith(
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: displayHeight * 0.02,
                        ),
                        Divider(
                          color: theme.colorScheme.secondaryContainer,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: displayHeight * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              'Description',
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: displayHeight * 0.02,
                        ),
                        Divider(
                          color: theme.colorScheme.secondaryContainer,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: displayHeight * 0.02,
                        ),
                        // genres tags
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                              horizontal: displayWidth * 0.03),
                          child: Row(
                            children: genres
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
                      ]),
                ),
              ),
            ]),
            bottomNavigationBar: Container(
              height: displayHeight * 0.1,
              color: theme.colorScheme.secondaryContainer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // add to library button
                  ElevatedButton(
                    onPressed: _onAddToLibrary,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(displayWidth * 0.02),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: theme.colorScheme.onPrimary,
                        ),
                        SizedBox(
                          width: displayWidth * 0.02,
                        ),
                        Text(
                          'Add to library',
                          style: theme.textTheme.labelSmall!.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'The Hunger Games',
// style: theme.textTheme.titleLarge,
// ),
// SizedBox(height: displayHeight * 0.02),
// Text(
// 'Suzanne Collins',
// style: theme.textTheme.titleSmall,
// ),
// SizedBox(height: displayHeight * 0.02),
// ])),
