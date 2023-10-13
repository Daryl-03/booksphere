import 'package:booksphere/modules/component_modules/library_component/data/model/book_spring_model.dart';
import 'package:booksphere/modules/component_modules/library_component/data/model/paginated_spring_model.dart';
import 'package:booksphere/modules/component_modules/library_component/data/model/user_history_spring_model.dart';
import 'package:booksphere/utils/spring_book_api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/rating_spring_model.dart';

part 'spring_book_api_client.g.dart';

@RestApi(baseUrl: SpringBookApiEndpoints.baseUrl)
abstract class SpringBookApiClient {

  factory SpringBookApiClient(Dio dio, {String baseUrl}) = _SpringBookApiClient;

  // books

  @GET("${SpringBookApiEndpoints.books}/getByGenre/{id}")
  Future<PaginatedSpringModel<BookSpringModel>> getBooksPerGenre(@Path("id") int genreId, @Query("page") int page, @Query("pageSize") int pageSize);

  @GET("${SpringBookApiEndpoints.books}/search/{searchTerm}")
  Future<PaginatedSpringModel<BookSpringModel>> searchBooks(@Path("searchTerm") String searchTerm, @Query("page") int page, [@CancelRequest() CancelToken? cancelToken]);

  @GET("${SpringBookApiEndpoints.books}/searchByAuthor/{searchTerm}")
  Future<PaginatedSpringModel<BookSpringModel>> searchBooksByAuthor(@Path("searchTerm") String searchTerm, @Query("page") int page, [@CancelRequest() CancelToken? cancelToken]);

  @GET("${SpringBookApiEndpoints.books}/searchByTitle/{searchTerm}")
  Future<PaginatedSpringModel<BookSpringModel>> searchBooksByTitle(@Path("searchTerm") String searchTerm, @Query("page") int page, [@CancelRequest() CancelToken? cancelToken]);

  @GET("${SpringBookApiEndpoints.books}/{bookId}")
  Future<BookSpringModel> findBookById(@Path("bookId") String bookId);

  @GET(SpringBookApiEndpoints.books)
  Future<PaginatedSpringModel<BookSpringModel>> getBooks(@Query("page") int page, @Query("pageSize") int pageSize);

  @GET("${SpringBookApiEndpoints.books}/getBooksByIds")
  Future<List<BookSpringModel>> getBooksByIds(@Query("ids") List<String> ids);

  // ratings

  @POST(SpringBookApiEndpoints.ratings)
  Future<void> createRating(@Body() RatingSpringModel rating);

  @PUT(SpringBookApiEndpoints.ratings)
  Future<void> updateRating(@Query("userId") String userId, @Body() RatingSpringModel rating);

  @DELETE("${SpringBookApiEndpoints.ratings}/deleteByUserIdAndBookId")
  Future<void> deleteRatingByUserIdAndBookId(@Query("userId") String userId, @Query("bookId") String bookId);

  @GET("${SpringBookApiEndpoints.ratings}/getByBookIdAndUserId")
  Future<RatingSpringModel?> getRatingByBookIdAndUserId(@Query("bookId") String bookId, @Query("userId") String userId);

  @GET("${SpringBookApiEndpoints.ratings}/getByBookId/{userId}")
  Future<List<RatingSpringModel>> getRatingsByUserId(@Path("userId") String userId);

  // user history

  @POST(SpringBookApiEndpoints.userHistory)
  Future<void> create(@Body() UserHistorySpringModel userHistory);

  @DELETE("${SpringBookApiEndpoints.userHistory}/delete")
  Future<void> delete(@Body() UserHistorySpringModel userHistory);

  @GET("${SpringBookApiEndpoints.userHistory}/getByUserIdAndBookId")
  Future<UserHistorySpringModel?> getUserHistoryByUserIdAndBookId(@Query("userId") String userId, @Query("bookId") String bookId);

  @GET("${SpringBookApiEndpoints.userHistory}/getByUserId")
  Future<List<UserHistorySpringModel>> getUserHistoryByUserId(@Query("userId") String userId);

  // recommended books
  @GET(SpringBookApiEndpoints.recommendedBooks)
  Future<List<BookSpringModel>> getRecommendedBooks(@Query("userId") String userId);
}