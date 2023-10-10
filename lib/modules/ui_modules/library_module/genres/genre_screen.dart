import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/genre.dart';
import 'package:booksphere/modules/ui_modules/commons/widets/BookItem.dart';
import 'package:booksphere/modules/ui_modules/library_module/genres/genre_event.dart';
import 'package:booksphere/modules/ui_modules/library_module/search/result_event.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';

import 'genre_bloc.dart';
import 'genre_state.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({
    Key? key,
    required this.genre,
  }) : super(key: key);

  final Genre genre;

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  final _pagingController = PagingController<int, Book>(firstPageKey: 0);
  final _genreBloc = GenreBloc();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _genreBloc.add(GenreEventFetch(genre: widget.genre, page: pageKey));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return BlocConsumer(
        bloc: _genreBloc,
        listener: (context, GenreState state) {
          if (state.books.isNotEmpty) {
            if (state.hasReachedMax) {
              _pagingController.appendLastPage(state.books);
            } else {
              _pagingController.appendPage(state.books, state.nextPage);
            }
          }
        },
        builder: (BuildContext context, GenreState state) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
                title: Text(widget.genre.name),
              ),
              body: PagedListView(
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate<Book>(
                        itemBuilder: (context, book, index) =>
                            BookItem(book: book),
                        firstPageErrorIndicatorBuilder: (context) =>
                            const Center(
                          child: Text("Error"),
                        ),
                        noItemsFoundIndicatorBuilder: (context) => const Center(
                          child: Text("No items found"),
                        ),
                        noMoreItemsIndicatorBuilder: (context) => const Center(
                          child: Text("No more items"),
                        ),
                        newPageProgressIndicatorBuilder: (context) =>
                            const Center(
                          child: CircularProgressIndicator(),
                        ),
                        firstPageProgressIndicatorBuilder: (context) =>
                            const Center(
                          child: CircularProgressIndicator(),
                        ),
                        newPageErrorIndicatorBuilder: (context) => const Center(
                          child: Text("Error"),
                        ),
                      ),
                    ));
        });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _genreBloc.close();
    super.dispose();
  }
}
