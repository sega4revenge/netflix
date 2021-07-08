
import 'package:netflix/Base/BaseBloc.dart';
import 'package:netflix/Model/Movie.dart';

class DetailMovieBloc extends BaseBloc {
  final Movie movie;
  DetailMovieBloc(this.movie);
}