import 'package:netflix/Network/TypeDecodable.dart';

class Movie implements Decodable<Movie> {
  String title = '';
  String overview = '';
  String posterPath = '';
  num? voteAvg;
  int? voteCount;

  @override
  Movie decode(dynamic data) {
    title = data['title'] ?? '';
    overview = data['overview'] ?? '';
    posterPath = data['poster_path'] ?? '';
    print(data['vote_average']);
    voteAvg = data['vote_average'];
    voteCount = data['vote_count'];
    return this;
  }
}