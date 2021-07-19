import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Config/ConfigBase.dart';
import 'package:netflix/Model/Crew.dart';
import 'package:provider/provider.dart';

import '../DetailMovieBloc.dart';
import 'CastView.dart';

class CastAndCrew extends StatelessWidget {
  const CastAndCrew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<DetailMovieBloc>(context);
    return StreamBuilder<CreditResponse>(
        stream: bloc.creditResponse,
        builder: (context, stateData) {
          var casts = stateData.data?.casts;
          if (casts == null) {
            return Container();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(Constant.DEFAULT_PADDING),
                  child: Text(
                    "Cast & Crew",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: Constant.DEFAULT_PADDING),
                    scrollDirection: Axis.horizontal,
                    itemCount: casts.length,
                    itemBuilder: (context, index) => CastCard(cast: casts[index]),
                  ),
                )
              ],
            );
          };
        });
  }
}
