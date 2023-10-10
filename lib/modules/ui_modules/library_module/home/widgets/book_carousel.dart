import 'package:booksphere/modules/component_modules/library_component/domain/entities/book.dart';
import 'package:booksphere/modules/ui_modules/library_module/book_detail/book_detail_screen.dart';
import 'package:booksphere/modules/ui_modules/library_module/home/home_state.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BookCarousel extends StatelessWidget {
  const BookCarousel({
    Key? key,
    required this.topBooks,
  }) : super(key: key);

  final List<Book>? topBooks;

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return CarouselSlider.builder(
      itemCount: topBooks!.isNotEmpty ? topBooks!.length : 5,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: displayWidth * 0.8,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            // color: Colors.primaries[index % Colors.primaries.length],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: topBooks!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookDetailScreen(book: topBooks![index]),
                      ));
                  },
                child: Image.network(
                    topBooks![index].coverImg,
                    fit: BoxFit.fitWidth,
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
        );
      },
      options: CarouselOptions(
        height: displayHeight * 0.45,
        aspectRatio: 16 / 9,
        viewportFraction: 0.6,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        // autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        // enlargeFactor: 10,
      ),
    );
  }
}
