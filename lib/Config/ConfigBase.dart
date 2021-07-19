
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigBase {
  static const String API_KEY = "4d0830d750f5ae621325e0907baa5d3b";
  static const String BASE_IMAGE_URL = "https://image.tmdb.org/t/p/w500";
  static const String BASE_URL = "http://api.themoviedb.org/3/";

}

class Constant {
  static const double DEFAULT_PADDING = 20;
  static const DEFAULT_SHADOW = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 4,
    color: Colors.black26,
  );
}

extension NullSafeBlock<T> on T? {
  void let(Function(T it) runnable) {
    final instance = this;
    if (instance != null) {
      runnable(instance);
    }
  }
}

class ColorConstant {
  static const TEXT_LIGHT = Colors.black;
  static const ADULT_COLOR = Colors.red;
  static const CHILD_COLOR = Colors.green;
  static const MAIN_COLOR = Colors.red;

}