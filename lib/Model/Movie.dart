import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:netflix/Config/ConfigBase.dart';
import 'package:netflix/Config/TimeExt.dart';
import 'package:netflix/Network/TypeDecodable.dart';

import 'Genre.dart';

class Movie implements Decodable<Movie> {
  int? id;
  bool adult = false;
  String title = '';
  String overview = '';
  String posterPath = '';
  String backdropPath = '';
  String releaseDate = '';
  num? voteAvg;
  int? voteCount;
  int? runTime;
  List<Genre> genres = [];

  @override
  Movie decode(dynamic data) {
    id = data['id'];
    adult = data['adult'] ?? false;
    title = data['title'] ?? '';
    overview = data['overview'] ?? '';
    posterPath = data['poster_path'] ?? '';
    backdropPath = data['backdrop_path'] ?? '';
    voteAvg = data['vote_average'];
    voteCount = data['vote_count'];
    releaseDate = data['release_date'];
    runTime = data['runtime'];
    var genres = data['genres'];
    if (genres != null) {
      this.genres = (genres as List).map((i) => Genre().decode(i)).toList();
    }
    return this;
  }

  Color scoreColor() {
    var vote = voteAvg;
    if (vote != null) {
      if (vote < 5.0) {
        return ColorConstant.ADULT_COLOR;
      } else if (vote < 8.0) {
        return CupertinoColors.systemYellow;
      } else {
        return ColorConstant.CHILD_COLOR;
      }
    } else {
      return ColorConstant.ADULT_COLOR;
    }
  }

  String durationMovie() {
    return TimeExt.minuteToHour(runTime ?? 0);
  }
}