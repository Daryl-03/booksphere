import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/ui_modules/commons/widets/BookItem.dart';
import 'package:booksphere/modules/ui_modules/library_module/search/result_event.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';

import 'result_bloc.dart';
import 'result_state.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final _pagingController = PagingController<int, Book>(firstPageKey: 0);
  final _textController = TextEditingController();
  final _resultBloc = ResultBloc();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _resultBloc.add(ResultEventFetch(query: _textController.text, page: pageKey));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return BlocConsumer(
        bloc: _resultBloc,
        listener: (context, ResultState state) {
          if (state.books.isNotEmpty) {
            if(state.hasReachedMax) {
              _pagingController.appendLastPage(state.books);
            } else {
              _pagingController.appendPage(state.books, state.nextPage);
            }
          }
        },
        builder: (BuildContext context, ResultState state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(displayWidth * 0.02),
                  ),
                  fillColor: Colors.red,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(displayWidth * 0.02),
                  ),
                  focusColor: Colors.red,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: displayWidth * 0.02,
                    vertical: displayHeight * 0.01,
                  ),
                ),
                onChanged: (value) {
                  Logger().i(value);
                  _pagingController.refresh();
                  _resultBloc.add(ResultEventFetch(query: value, page: 0));
                },
              ),
            ),
            body: !state.isSearching
                ? const Center(
                    child: Text("Search for a book"),
                  )
                : PagedListView(
                            pagingController: _pagingController,
                            builderDelegate: PagedChildBuilderDelegate<Book>(
                              itemBuilder: (context, book, index) => BookItem(book: book),
                              firstPageErrorIndicatorBuilder: (context) => const Center(
                                child: Text("Error"),
                              ),
                              noItemsFoundIndicatorBuilder: (context) => const Center(
                                child: Text("No items found"),
                              ),
                              noMoreItemsIndicatorBuilder: (context) => const Center(
                                child: Text("No more items"),
                              ),
                              newPageProgressIndicatorBuilder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              firstPageProgressIndicatorBuilder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              newPageErrorIndicatorBuilder: (context) => const Center(
                                child: Text("Error"),
                              ),
                            ),
                          )
          );
        });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _resultBloc.close();
    _textController.dispose();
    super.dispose();
  }
}
