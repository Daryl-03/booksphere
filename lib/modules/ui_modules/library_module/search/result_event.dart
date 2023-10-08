
abstract class ResultEvent{}

class ResultEventFetch extends ResultEvent{
  final String query;
  final int page;

  ResultEventFetch({required this.query, required this.page});
}