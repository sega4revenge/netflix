import 'package:netflix/Base/BaseBloc.dart';
import 'package:netflix/Config/Result.dart';
import 'package:netflix/Model/Crew.dart';
import 'package:netflix/Model/Movie.dart';
import 'package:netflix/Network/Service/MovieCategory/MovieRepo.dart';
import 'package:netflix/Screen/DetailMovie/DetailMovieState.dart';
import 'package:rxdart/rxdart.dart';

class DetailMovieBloc extends BaseBloc {
  MovieRepo repo = MovieRepo();

  final PublishSubject<DetailMovieAction> action =
      PublishSubject<DetailMovieAction>();

  final BehaviorSubject<Movie> movie = BehaviorSubject<Movie>();
  final BehaviorSubject<CreditResponse> creditResponse = BehaviorSubject<CreditResponse>();

  DetailMovieBloc(int movieId) {
    action.listen((DetailMovieAction event) {
      var _event = event;
      if (_event is GetMovieAction) {
        repo
            .detailMovie(movieId)
            .doOnListen(() => {isLoading.add(true)})
            .doOnData((_) => isLoading.add(false))
            .listen((result) {
          var _result = result;
          if (_result is SuccessState && _result.value is Movie) {
            Movie _movie = _result.value as Movie;
            movie.add(_movie);
          } else {
            var error = result as ErrorState;
            this.error.add(error);
          }
        });
      } else if (_event is GetCreditAction) {
        repo
            .creditMovie(movieId)
            .doOnListen(() => {isLoading.add(true)})
            .doOnData((_) => isLoading.add(false))
            .listen((result) {
          var _result = result;
          if (_result is SuccessState && _result.value is CreditResponse) {
            CreditResponse _creditResponse = _result.value as CreditResponse;
            creditResponse.add(_creditResponse);
          } else {
            var error = result as ErrorState;
            this.error.add(error);
          }
        });
      }

    });
  }

  @override
  void dispose() {
    super.dispose();
    movie.close();
    action.close();
    creditResponse.close();
  }
}
