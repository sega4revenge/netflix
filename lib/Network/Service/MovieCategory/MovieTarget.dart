import 'package:flutter/cupertino.dart';
import 'package:netflix/Model/HomeCategory.dart';

import '../../APIRouteConfigurable.dart';
class GetListMovie implements Target {
  final HomeCategory category;
  GetListMovie(this.category);

  @override
  Map<String, dynamic>? routeParams() {
    return null;
  }

  @override
  String path() {
    return category.path();
  }

  @override
  APIMethod method() {
    return APIMethod.get;
  }

  @override
  bool isQueryParams() {
    return method() == APIMethod.get;
  }
}