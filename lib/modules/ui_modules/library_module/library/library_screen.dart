import 'package:booksphere/modules/component_modules/library_component/domain/entities/filter_type.dart';
import 'package:booksphere/modules/ui_modules/library_module/book_detail/book_detail_screen.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'library_bloc.dart';
import 'library_event.dart';
import 'library_state.dart';
import 'widgets/book_library_item.dart';
import 'widgets/filterbottomsheet.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final _libraryBloc = LibraryBloc();

  @override
  void initState() {
    _libraryBloc.add(InitLibraryState());
    super.initState();
  }

  Future<FilterType> _showFilterBottomSheet() async {
    return await showModalBottomSheet(
      context: context,
      builder: (context) {
        return FilterBottomSheet(
          activeFilter: _libraryBloc.state.filterType,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return BlocConsumer(
      bloc: _libraryBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return VisibilityDetector(
          key: const Key('library_screen'),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction > 0) {
              _libraryBloc.add(InitLibraryState());
            }
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: theme.colorScheme.secondaryContainer,
              title: const Text('Library'),
              actions: [
                IconButton(
                  onPressed: () async {
                    var filterType = await _showFilterBottomSheet();
                    _libraryBloc.add(FilterLibrary(filterType));
                  },
                  icon: const Icon(Icons.filter_list),
                ),
              ],
            ),
            body: BlocConsumer(
              bloc: _libraryBloc,
              listener: (BuildContext context, state) {},
              builder: (BuildContext context, LibraryState state) {
                return RefreshIndicator(
                  onRefresh: () async {
                    _libraryBloc.add(InitLibraryState());
                  },
                  child: state.isFetching
                      ? const CustomScrollView(slivers: [
                          SliverFillRemaining(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ])
                      : state.books.isEmpty
                          ? const CustomScrollView(slivers: [
                              SliverFillRemaining(
                                child: Center(
                                  child: Text('No books in your library'),
                                ),
                              ),
                            ])
                          : Container(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.6,
                                ),
                                itemCount: _libraryBloc
                                    .state.filteredUserLibrary.length,
                                itemBuilder: (context, index) {
                                  var book =
                                      _libraryBloc.state.filteredBooks[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BookDetailScreen(
                                              book: book,
                                            ),
                                          ),
                                        );
                                      },
                                      child: BookLibraryItem(book: book),
                                    ),
                                  );
                                },
                              ),
                            ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _libraryBloc.close();
    super.dispose();
  }
}
