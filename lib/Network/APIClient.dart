import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Config/ConfigBase.dart';
import 'package:netflix/Config/Result.dart';
import 'package:netflix/Network/APILogInterceptor.dart';


import 'APIResponse.dart';
import 'APIRouteConfigurable.dart';
import 'AuthInterceptor.dart';
import 'TypeDecodable.dart';

abstract class BaseAPIClient {

  Future<Result> request<T>({
    @required APIRouteConfigurable route,
    Create<T>? create,
    dynamic data,
  });

}
class APIClient implements BaseAPIClient {

  final BaseOptions options = BaseOptions(baseUrl: ConfigBase.BASE_URL);
  Dio? instance;

  APIClient() {
    instance = Dio(options)..interceptors.add(AuthInterceptor())..interceptors.add(APILogInterceptor());
  }

  @override
  Future<Result> request<T>({
    @required APIRouteConfigurable? route,
    Create<T>? create,
    dynamic data,
  }) async {

    final config = route?.getConfig();
    if (config == null)  {
      final error = ErrorResponse(
          message: 'Config Null', statusCode: 400
      );
      return Result.error(error);
    }
    config.baseUrl = options.baseUrl;
      try {
        final response = await instance?.fetch(config);
        if (response == null) {
          final error = ErrorResponse(
              message: 'Response Null', statusCode: 400
          );
          return Result.error(error);
        }
        final responseData = response.data;
        if (null is T) {
          return Result.success(response.toString());
        } else {
          ResponseWrapper responseWrapper = configResponse(create == null ? null : create as Create<Decodable>, responseData);
          return Result.success(responseWrapper.response);
        }
      } on DioError catch (e) {
        final responseData = e.response?.data;
        final error = ErrorResponse(
            message: e.message, statusCode: 999
        );
        return Result.error(error);
        ResponseWrapper responseWrapper = configResponse(create == null ? null : create as Create<Decodable>, responseData);
        if (null is T) {
          final error = ErrorResponse(
              message: e.response.toString(), statusCode: e.response?.statusCode ?? 400
          );
          return Result.error(error);
        } else {
          return Result.error(responseWrapper.response);
        }
      }
  }

  ResponseWrapper configResponse(Create<Decodable>? create,Map<String, dynamic> json) {
    if (create != null) {
      return ResponseWrapper.init(create: create, json: json);
    } else {
      return ResponseWrapper.init(json: json);
    }
  }
}

class Data implements Decodable<Data> {
  @override
  Data decode(dynamic data) {
    return this;
  }
}