import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Model/Movie.dart';
import 'package:netflix/Screen/DetailMovie/DetailMovieBloc.dart';
import 'package:netflix/Screen/DetailMovie/DetailMovieState.dart';
import 'package:provider/provider.dart';
import 'Components/DetailBody.dart';

class DetailMovieScreen extends StatefulWidget {
  DetailMovieScreen({Key? key}) : super(key: key);

  @override
  DetailMovieState createState() => DetailMovieState();
}

class DetailMovieState extends State<DetailMovieScreen> {
  @override
  void didChangeDependencies() {
    final bloc = Provider.of<DetailMovieBloc>(context);
    bloc.action.add(GetMovieAction());
    bloc.action.add(GetCreditAction());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<DetailMovieBloc>(context);
    return Scaffold(
      body: StreamBuilder<Movie>(
          stream: bloc.movie,
          builder: (context, stateData) {
            var movie = stateData.data;
            if (movie == null) {
              return Container();
            } else {
              return DetailBody(movie: movie);
            }
          }),
    );

  }
}
