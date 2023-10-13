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
  // final genres = [
  //   'Action',
  //   'Adventure',
  //   'Drama',
  //   'Fantasy',
  //   'Sci-Fi',
  //   'Thriller'
  // ];
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
          return BlocProvider.value(
            value: _bookDetailBloc,
            child: BookLibraryInput(
                userHistory: _bookDetailBloc.state.userHistory,
                rating: _bookDetailBloc.state.rating,
                book: widget.book),
          );
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
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: theme.colorScheme.secondaryContainer,
              foregroundColor: theme.colorScheme.onSecondaryContainer,
            ),
            body: Column(mainAxisSize: MainAxisSize.max, children: [
              SizedBox(
                width: displayWidth,
                height: displayHeight * 0.45,
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
                              widget.book.coverImg,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ).image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    // book title
                    Positioned(
                      top: displayHeight * 0.33,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: displayWidth * 0.01,
                        ),
                        width: displayWidth,
                        child: Wrap(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              widget.book.title,
                              style: theme.textTheme.titleLarge!.copyWith(
                                color: theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: theme.colorScheme.primary,
                  width: displayWidth,
                  height: displayHeight * 0.6,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: displayHeight * 0.02,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: displayWidth * 0.01,
                            ),
                            width: displayWidth,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              direction: Axis.horizontal,
                              children: [
                                Text(
                                  widget.book.authors.join(' | '),
                                  style: theme.textTheme.titleSmall!.copyWith(
                                    color: theme.colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: displayHeight * 0.02,
                          ),
                          //        isbn and number of pages
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ISBN: ${widget.book.isbn} | ${widget.book.pages} pages',
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
                                rating: widget.book.rating,
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
                                "(${widget.book.numRatings} rating(s))",
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: displayWidth * 0.05),
                            child: Wrap(
                              children: [
                                Text(
                                  widget.book.description,
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      color: theme.colorScheme.onPrimary),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ],
                            ),
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
                              children: widget.book.genres
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
                    onPressed: state.isFetching ? null : _onAddToLibrary,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(displayWidth * 0.02),
                      ),
                    ),
                    child: state.isFetching
                        ? SizedBox(
                            height: displayHeight * 0.02,
                            width: displayHeight * 0.02,
                            child: CircularProgressIndicator(
                              color: theme.colorScheme.onPrimary,
                            ),
                          )
                        : Row(
                            children: [
                              Icon(
                                state.isInHistory ? Icons.check : Icons.add,
                                color: theme.colorScheme.onPrimary,
                              ),
                              SizedBox(
                                width: displayWidth * 0.02,
                              ),
                              Text(
                                state.isInHistory
                                    ? 'Added to library'
                                    : 'Add to library',
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

  @override
  void dispose() {
    _bookDetailBloc.close();
    super.dispose();
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
