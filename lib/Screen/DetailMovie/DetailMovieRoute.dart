import 'package:netflix/Base/BaseRoute.dart';
import 'package:netflix/Model/Movie.dart';

class DetailMovieRoute extends BaseRoute {
  static const String routeId = "DetailMovieRoute";
  final int? movieId;
  DetailMovieRoute(this.movieId);
}