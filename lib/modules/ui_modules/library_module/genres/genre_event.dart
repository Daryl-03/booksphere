
import 'package:booksphere/modules/component_modules/library_component/domain/entities/genre.dart';

abstract class GenreEvent{}

class GenreEventFetch extends GenreEvent{
  final Genre genre;
  final int page;
  GenreEventFetch({required this.genre, required this.page});
}