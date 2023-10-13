import 'package:booksphere/modules/ui_modules/library_module/home/home_bloc.dart';
import 'package:booksphere/modules/ui_modules/library_module/home/home_event.dart';
import 'package:booksphere/modules/ui_modules/library_module/home/home_state.dart';
import 'package:booksphere/modules/ui_modules/library_module/home/widgets/book_carousel.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:booksphere/utils/book_genre_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

import 'widgets/book_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    var loadingWidget = const Center(
      child: CircularProgressIndicator(),
    );

    return BlocConsumer(
      bloc: _homeBloc,
      builder: (BuildContext context, HomeState state) {
        if (state.isLoading) {
          return loadingWidget;
        }
        return Scaffold(
          backgroundColor: theme.colorScheme.primary,
          appBar: AppBar(
            title: Text(
              "Hi, ${state.user != null ? state.user!.username : "Reader"}",
            ),
            actions: [
              const IconButton(
                onPressed: null,
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  _homeBloc.add(HomeLogOutEvent());
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              _homeBloc.add(HomeInitialEvent());
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: displayHeight * 0.04,
                      bottom: displayHeight * 0.02,
                    ),
                    height: displayHeight * 0.5,
                    child: BookCarousel(topBooks: state.topBooks),
                  ),
                  SizedBox(height: displayHeight * 0.02),
                  for(var genre in BookGenreUtils.getAppGenres())
                    BookRow(
                      key: ObjectKey(genre),
                      books: state.map![genre] ?? [],
                      genre: genre,
                    ),

                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, HomeState? state) {
        // if (state?.topBooks != null) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text("Top books loaded"),
        //     ),
        //   );
        // }
        // if (state?.map != null) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text("Category ${state!.map!.keys.length.toString()} loaded"),
        //     ),
        //   );
        // }
      },
    );
  }
}
