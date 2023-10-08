
import 'package:booksphere/modules/component_modules/library_component/domain/entities/genre.dart';

class BookGenreUtils {
  static List<Genre> getAppGenres(){
    return [
      const Genre(id: 2, name: "Fiction"),
      const Genre(id: 6, name: "Romance"),
      const Genre(id: 78, name: "Mystery"),
      const Genre(id: 87, name: "Thriller"),
      const Genre(id: 4, name: "Fantasy"),
      const Genre(id: 5, name: "Science Fiction"),
      const Genre(id: 15, name: "Classics"),
      const Genre(id: 1, name: "Young Adult"),

      const Genre(id: 70, name: "Horror"),
      const Genre(id: 38, name: "Poetry"),
      const Genre(id: 107, name: "History"),
      const Genre(id: 103, name: "Biography"),
      const Genre(id: 201, name: "Science"),
      const Genre(id: 101, name: "Nonfiction"),
      const Genre(id: 8, name: "Adventure"),
      const Genre(id: 175, name: "Humor")
    ];
  }
}