import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/book_state.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:booksphere/modules/ui_modules/library_module/book_detail/book_detail_bloc.dart';
import 'package:booksphere/modules/ui_modules/library_module/book_detail/book_detail_event.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:booksphere/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logger/logger.dart';

class BookLibraryInput extends StatefulWidget {
  const BookLibraryInput({
    Key? key,
    required this.userHistory,
    required this.rating,
    required this.book,
  }) : super(key: key);

  final UserHistory? userHistory;
  final Rating? rating;
  final Book book;

  @override
  State<BookLibraryInput> createState() => _BookLibraryInputState();
}

class _BookLibraryInputState extends State<BookLibraryInput> {
  final _formKey = GlobalKey<FormState>();
  var _selectedBookState = BookState.values[0];
  var _selectedRating = 0.0;
  var _selectedBookmark = 1;
  var _isInHistory = false;

  @override
  void initState() {
    // Logger().i(widget.book);
    if (widget.userHistory != null) {
      _selectedBookState = widget.userHistory!.bookState;
      _selectedBookmark = widget.userHistory!.bookmark ?? 1;
      _isInHistory = true;
    }
    if (widget.rating != null) {
      _selectedRating = widget.rating!.rating;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return Container(
      width: displayWidth,
      // height: displayHeight * 0.2,
      padding: EdgeInsets.symmetric(
        horizontal: displayWidth * 0.05,
        vertical: displayHeight * 0.02,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(
          displayWidth * 0.02,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: displayWidth * 0.05,
          vertical: displayHeight * 0.02,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Title(
                color: theme.colorScheme.onPrimary,
                child: Text(
                  'Add to library',
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: displayHeight * 0.025,
              ),
              // status
              Container(
                constraints: BoxConstraints(
                  maxWidth: displayWidth * 0.8,
                ),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Status',
                    labelStyle: theme.textTheme.labelMedium!.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        displayWidth * 0.02,
                      ),
                      borderSide: BorderSide(
                        color: theme.colorScheme.onPrimary,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        displayWidth * 0.02,
                      ),
                      borderSide: BorderSide(
                        color: theme.colorScheme.onPrimary,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                  ),
                  dropdownColor: theme.colorScheme.primary,
                  iconEnabledColor: theme.colorScheme.onPrimary,
                  items: BookState.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.toString(),
                              style: theme.textTheme.labelLarge!.copyWith(
                                color: theme.colorScheme.onPrimary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ))
                      .toList(),
                  onChanged: (BookState? value) {
                    setState(() {
                      _selectedBookState = value!;
                    });
                  },
                  value: _selectedBookState,
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a status';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: displayHeight * 0.025,
              ),
              // bookmark
              if (_selectedBookState == BookState.reading)
                TextFormField(
                  initialValue: _selectedBookmark.toString(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Bookmark',
                    labelStyle: theme.textTheme.labelMedium!.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        displayWidth * 0.02,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        displayWidth * 0.02,
                      ),
                      borderSide: BorderSide(
                        color: theme.colorScheme.onPrimary,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        displayWidth * 0.02,
                      ),
                      borderSide: BorderSide(
                        color: theme.colorScheme.onPrimary,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                  cursorColor: theme.colorScheme.onPrimary,
                  validator: (value) {
                    if (_selectedBookState != BookState.reading) {
                      return null;
                    }
                    if (value == null || value.isEmpty) {
                      return 'Please enter a bookmark';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    if (int.parse(value) >= widget.book.pages ||
                        int.parse(value) < 1) {
                      return 'Please enter a page number less than ${widget.book.pages}';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (_selectedBookState == BookState.reading) {
                      _selectedBookmark = int.parse(value!);
                    }
                  },
                ),
              SizedBox(
                height: displayHeight * 0.025,
              ),
              // rating
              if (_selectedBookState == BookState.read)
                RatingBar(
                  initialRating: _selectedRating,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: displayWidth * 0.1,
                  itemPadding:
                      EdgeInsets.symmetric(horizontal: displayWidth * 0.01),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _selectedRating = rating;
                    });
                  },
                  ratingWidget: RatingWidget(
                    full: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    half: const Icon(
                      Icons.star_half,
                      color: Colors.amber,
                    ),
                    empty: const Icon(
                      Icons.star_border_outlined,
                      color: Colors.amber,
                    ),
                  ),
                ),
              SizedBox(
                height: displayHeight * 0.03,
              ),
              // submit
              Row(
                mainAxisAlignment: _isInHistory
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        var userHistory = _isInHistory
                            ? widget.userHistory!.copyWith(
                                bookState: _selectedBookState,
                                bookmark: _selectedBookmark,
                              )
                            : UserHistory(
                                userId: signedInUserId!,
                                bookId: widget.book.bookId,
                                bookState: _selectedBookState,
                                bookmark: _selectedBookmark,
                              );
                        var rating = widget.rating != null
                            ? widget.rating!.copyWith(rating: _selectedRating)
                            : Rating(
                                bookId: widget.book.bookId,
                                userId: signedInUserId!,
                                rating: _selectedRating,
                              );
                        BlocProvider.of<BookDetailBloc>(context)
                            .add(UpdateHistory(userHistory, rating));
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.secondaryContainer,
                    ),
                    child: Text(
                      'Submit',
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: theme.colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: displayWidth * 0.05,
                  ),
                  if (_isInHistory)
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<BookDetailBloc>(context)
                            .add(RemoveFromLibrary());
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.secondaryContainer,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                          SizedBox(
                            width: displayWidth * 0.01,
                          ),
                          Text(
                            'Remove',
                            style: theme.textTheme.labelMedium!.copyWith(
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
