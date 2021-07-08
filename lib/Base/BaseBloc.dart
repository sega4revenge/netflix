import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';


class BaseMessage {
  final Error? error;

  BaseMessage.error(this.error);
}

typedef FunctionType<T> = T Function();
class BaseBloc {
  final BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(false);

  void dispose() {
    isLoading.close();
  }
}
