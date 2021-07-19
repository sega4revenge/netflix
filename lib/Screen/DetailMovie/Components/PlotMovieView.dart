import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Config/ConfigBase.dart';
import 'package:netflix/Model/Movie.dart';
import 'package:provider/provider.dart';

class PlotMovieView extends StatelessWidget {
  const PlotMovieView({
    Key? key, required this.movie
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: Constant.DEFAULT_PADDING / 2,
            horizontal: Constant.DEFAULT_PADDING,
          ),
          child: Text(
            "Plot Summary",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constant.DEFAULT_PADDING),
          child: Text(
            movie.overview,
            style: TextStyle(
              color: Color(0xFF737599),
            ),
          ),
        ),
      ],
    );
  }
}