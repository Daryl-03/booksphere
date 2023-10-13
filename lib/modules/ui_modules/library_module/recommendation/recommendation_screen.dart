import 'package:booksphere/modules/ui_modules/commons/widets/BookItem.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'recommendation_bloc.dart';
import 'recommendation_event.dart';
import 'recommendation_state.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({Key? key}) : super(key: key);

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  final _recommendationBloc = RecommendationBloc();

  @override
  void initState() {
    _recommendationBloc.add(GetRecommendedBooksEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return BlocConsumer(
        bloc: _recommendationBloc,
        listener: (context, RecommendationState state) {
          if (state.error != null) {
            // show scaffold snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error!,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: theme.colorScheme.onError,
                  ),
                ),
                backgroundColor: theme.colorScheme.error,
                closeIconColor: theme.colorScheme.onError,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(displayWidth * 0.05),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: displayWidth * 0.05,
                  vertical: displayHeight * 0.02,
                ),
              ),
            );
          }
        },
        builder: (BuildContext context, RecommendationState state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: theme.colorScheme.secondaryContainer,
              automaticallyImplyLeading: true,
              title: Text(
                "Recommendations",
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                _recommendationBloc.add(GetRecommendedBooksEvent());
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
                              child: Text("No books found"),
                            ),
                          ),
                        ])
                      : ListView.builder(
                          itemCount: state.books.length,
                          itemBuilder: (context, index) {
                            return BookItem(
                              book: state.books[index],
                            );
                          },
                        ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _recommendationBloc.close();
    super.dispose();
  }
}
