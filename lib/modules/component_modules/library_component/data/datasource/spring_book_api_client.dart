import 'package:booksphere/modules/component_modules/library_component/data/model/book_spring_model.dart';
import 'package:booksphere/modules/component_modules/library_component/data/model/user_history_spring_model.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/rating.dart';
import 'package:booksphere/modules/component_modules/library_component/domain/entities/user_history.dart';
import 'package:booksphere/utils/spring_book_api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/rating_spring_model.dart';

part 'spring_book_api_client.g.dart';

@RestApi(baseUrl: SpringBookApiEndpoints.baseUrl)
abstract class SpringBookApiClient {

  factory SpringBookApiClient(Dio dio, {String baseUrl}) = _SpringBookApiClient;


  @GET("${SpringBookApiEndpoints.books}/getByGenre/{id}")
  Future<List<BookSpringModel>> getBooksPerGenre(@Path("id") int genreId, @Query("page") int page, @Query("pageSize") int pageSize);

  @GET("${SpringBookApiEndpoints.books}/search/{searchTerm}")
  Future<List<BookSpringModel>> searchBooks(@Path("searchTerm") String searchTerm, @Query("page") int page);

  @GET("${SpringBookApiEndpoints.books}/{bookId}")
  Future<BookSpringModel> findBookById(@Path("bookId") String bookId);

  @GET(SpringBookApiEndpoints.books)
  Future<List<BookSpringModel>> getBooks(@Query("page") int page, @Query("pageSize") int pageSize);

  @POST(SpringBookApiEndpoints.ratings)
  Future<void> createRating(@Body() RatingSpringModel rating);

  @PUT(SpringBookApiEndpoints.ratings)
  Future<void> updateRating(@Query("userId") String userId, @Body() RatingSpringModel rating);

  @DELETE("${SpringBookApiEndpoints.ratings}/deleteByUserIdAndBookId")
  Future<void> deleteRatingByUserIdAndBookId(@Query("userId") String userId, @Query("bookId") String bookId);

  @POST(SpringBookApiEndpoints.userHistory)
  Future<void> create(@Body() UserHistorySpringModel userHistory);

  @DELETE("${SpringBookApiEndpoints.userHistory}/delete")
  Future<void> delete(@Body() UserHistorySpringModel userHistory);

  @GET("${SpringBookApiEndpoints.userHistory}/getByUserIdAndBookId")
  Future<UserHistorySpringModel> getUserHistoryByUserIdAndBookId(@Query("userId") String userId, @Query("bookId") String bookId);

}