import 'package:flutter/cupertino.dart';
import 'package:netflix/Base/BaseBloc.dart';
import 'package:netflix/Model/HomeCategory.dart';
import 'package:netflix/Model/Movie.dart';
import 'package:netflix/Network/APIResponse.dart';

@immutable
abstract class HomeAction {}

class GetListMovieAction extends HomeAction {
  final HomeCategory category;
  GetListMovieAction(this.category);
}

class SelectMovieAction extends HomeAction {
  final Movie movie;
  SelectMovieAction(this.movie);
}

@immutable
abstract class HomeMessage{}

class GetListMovieMessage extends HomeMessage {
  final List<Movie> listMovie;
  GetListMovieMessage(this.listMovie);
}

class HomeErrorMessage extends HomeMessage {
  final ErrorResponse error;
  HomeErrorMessage(this.error);
}