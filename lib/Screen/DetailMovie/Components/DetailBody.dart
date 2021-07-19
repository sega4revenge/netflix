import 'package:flutter/cupertino.dart';
import 'package:netflix/Config/ConfigBase.dart';
import 'package:netflix/Model/Movie.dart';
import 'package:netflix/Screen/DetailMovie/Components/CastAndCrew.dart';
import 'package:netflix/Screen/DetailMovie/Components/GenresList.dart';
import 'package:netflix/Screen/DetailMovie/Components/TopRatingView.dart';

import 'PlotMovieView.dart';
import 'TitleInfoView.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    // it will provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TopRatingView(size: size, movie: movie),
          SizedBox(height: Constant.DEFAULT_PADDING / 2),
          TitleInfoView(movie: movie),
          SizedBox(height: Constant.DEFAULT_PADDING / 2),
          GenresList(movie: movie),
          PlotMovieView(movie: movie),
          CastAndCrew()
        ],
      ),
    );
  }
}