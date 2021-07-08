import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class APIRouteConfigurable {
  RequestOptions getConfig();
}

enum APIMethod {
  get,
  post,
  put,
  patch,
  delete
}

extension APIMethodExt on APIMethod {
  String methodString() {
    switch (this) {
      case APIMethod.get:
        return 'get';
      case APIMethod.post:
        return 'post';
      case APIMethod.put:
        return 'put';
      case APIMethod.patch:
        return 'patch';
      case APIMethod.delete:
        return 'delete';
    }
  }
}

@immutable
abstract class Target {
  Map<String, dynamic>? routeParams();
  String path();
  APIMethod method();
  bool isQueryParams();
}

class Router implements APIRouteConfigurable {

  final Target target;

  Router(this.target);

  @override
  RequestOptions getConfig() {
    if (target.isQueryParams()) {
      return RequestOptions(
          path: target.path(),
          method: target.method().methodString(),
          queryParameters: target.routeParams()
      );
    } else {
      return RequestOptions(
          path: target.path(),
          method: target.method().methodString(),
          data: target.routeParams()
      );
    }
  }
}