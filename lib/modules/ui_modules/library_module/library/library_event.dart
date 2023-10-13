
import 'package:booksphere/modules/component_modules/library_component/domain/entities/filter_type.dart';

abstract class LibraryEvent {}

class InitLibraryState extends LibraryEvent {}

class FilterLibrary extends LibraryEvent {
  final FilterType filterType;

  FilterLibrary(this.filterType);
}