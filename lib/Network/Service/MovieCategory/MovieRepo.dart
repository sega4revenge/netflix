

import 'package:netflix/Config/Result.dart';
import 'package:netflix/Model/HomeCategory.dart';

import 'MovieService.dart';

class MovieRepo {
  MovieService service = MovieService();

  Stream<Result> getListMovie(HomeCategory category) {
    return Stream.fromFuture(service.getListMovie(category));
  }

  Stream<Result> detailMovie(int movieId) {
    return Stream.fromFuture(service.detailMovie(movieId));
  }

  Stream<Result> creditMovie(int movieId) {
    return Stream.fromFuture(service.creditMovie(movieId));
  }
}