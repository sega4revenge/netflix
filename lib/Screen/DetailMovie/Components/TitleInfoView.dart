

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Config/ConfigBase.dart';
import 'package:netflix/Model/Movie.dart';
import 'package:provider/provider.dart';

import '../DetailMovieBloc.dart';

class TitleInfoView extends StatelessWidget {
  const TitleInfoView({
    Key? key, required this.movie
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<DetailMovieBloc>(context);
    return StreamBuilder<Movie>(
        stream: bloc.movie,
        builder: (context, stateData) {
      var movie = stateData.data;
      if (movie == null) {
        return Container();
      } else {
        return Padding(
          padding: EdgeInsets.all(Constant.DEFAULT_PADDING),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: Constant.DEFAULT_PADDING / 2),
                    Row(
                      children: <Widget>[
                        Text(
                          '${movie.releaseDate}',
                          style: TextStyle(color: ColorConstant.TEXT_LIGHT),
                        ),
                        SizedBox(width: Constant.DEFAULT_PADDING),
                        Text(
                          "PG-13",
                          style: TextStyle(color: ColorConstant.TEXT_LIGHT),
                        ),
                        SizedBox(width: Constant.DEFAULT_PADDING),
                        Text(
                          movie.durationMovie(),
                          style: TextStyle(color: ColorConstant.TEXT_LIGHT),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 64,
                width: 64,
                child: FlatButton(
                  onPressed: () {},
                  color: ColorConstant.MAIN_COLOR,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.add,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        );
      }});
  }
}