

import 'package:flutter/cupertino.dart';

@immutable
abstract class DetailMovieAction {}

class GetMovieAction extends DetailMovieAction {
  GetMovieAction();
}

class GetCreditAction extends DetailMovieAction {
  GetCreditAction();
}