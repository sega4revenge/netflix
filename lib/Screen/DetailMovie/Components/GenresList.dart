

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Config/ConfigBase.dart';
import 'package:netflix/Model/Movie.dart';

class GenresList extends StatelessWidget {
  const GenresList({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Constant.DEFAULT_PADDING / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie.genres.length,
          itemBuilder: (context, index) => GenreCard(
            genre: movie.genres[index].name ?? "",
          ),
        ),
      ),
    );
  }
}

class GenreCard extends StatelessWidget {
  final String genre;

  const GenreCard({Key? key, required this.genre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: Constant.DEFAULT_PADDING),
      padding: EdgeInsets.symmetric(
        horizontal: Constant.DEFAULT_PADDING,
        vertical: Constant.DEFAULT_PADDING / 4, // 5 padding top and bottom
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre,
        style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 16),
      ),
    );
  }
}