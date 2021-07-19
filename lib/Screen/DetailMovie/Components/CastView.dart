
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Config/ConfigBase.dart';
import 'package:netflix/Model/Crew.dart';

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard({Key? key, required this.cast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Constant.DEFAULT_PADDING),
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "${ConfigBase.BASE_IMAGE_URL}${cast.profilePath}"),
              ),
            ),
          ),
          SizedBox(height: Constant.DEFAULT_PADDING / 2),
          Text(
            cast.name ?? "",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          SizedBox(height: Constant.DEFAULT_PADDING / 4),
          Text(
            cast.character ?? "",
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorConstant.TEXT_LIGHT),
          ),
        ],
      ),
    );
  }
}