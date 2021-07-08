import 'dart:convert';

import 'package:netflix/Base/BaseBloc.dart';
import 'package:netflix/Config/Result.dart';
import 'package:netflix/Model/HomeCategory.dart';
import 'package:netflix/Model/Movie.dart';
import 'package:netflix/Network/APIResponse.dart';
import 'package:netflix/Network/Service/MovieCategory/MovieRepo.dart';
import 'package:rxdart/rxdart.dart';

import 'HomeState.dart';

class HomeBloc extends BaseBloc {
  //Initial
  HomeMessage initialState = GetListMovieMessage([]);

  //Input
  final PublishSubject<HomeAction> action = PublishSubject<HomeAction>();
  final BehaviorSubject<HomeMessage> response = BehaviorSubject<HomeMessage>();

  final BehaviorSubject<List<Movie>> listMovie = BehaviorSubject<List<Movie>>.seeded([]);
  final BehaviorSubject<HomeCategory> catgorySelected = BehaviorSubject<HomeCategory>.seeded(HomeCategory.nowPlaying);
  final BehaviorSubject<int> movieSelectedIndex = BehaviorSubject<int>.seeded(0);

  HomeBloc(MovieRepo repo) {
    //Init current state
    response.add(initialState);

    //Listen stream
    action.listen((HomeAction event) {
      var _event = event;
      if (_event is GetListMovieAction) {
        catgorySelected.add(_event.category);
        var data = repo.getListMovie(_event.category)
            .doOnListen(() => {
          isLoading.add(true)
        })
            .doOnData((_) => isLoading.add(false))
            .map(_responseToMovieMessage);
        data.listen((data) {
          response.add(data);
        });
      } else if (_event is SelectMovieAction) {
        movieSelectedIndex.add(listMovie.value.indexOf(_event.movie));
      }
    });
  }

  HomeMessage _responseToMovieMessage(Result result) {
    var _result = result;
    if (_result is SuccessState && _result.value is APIListResponse<Movie>) {
      APIListResponse<Movie> response = _result.value as APIListResponse<Movie>;
      listMovie.add(response.data!);
      movieSelectedIndex.add(0);
      return GetListMovieMessage(response.data!);
    } else  {
      var error = result as ErrorState;
      return HomeErrorMessage(error.error);
    }
  }
  @override
  void dispose() {
    super.dispose();
    response.close();
    action.close();
    catgorySelected.close();
    movieSelectedIndex.close();
    listMovie.close();
  }
}