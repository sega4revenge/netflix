
import 'package:netflix/Config/Result.dart';
import 'package:netflix/Model/Crew.dart';
import 'package:netflix/Model/HomeCategory.dart';
import 'package:netflix/Model/Movie.dart';
import 'package:netflix/Network/APIResponse.dart';

import '../../APIClient.dart';
import '../../APIRouteConfigurable.dart';
class MovieService {
  final APIClient client = APIClient();

  Future<Result> getListMovie(HomeCategory category) async {
    Router router = Router(Target(null, category.path(), APIMethod.get));
    var result = await client.request<APIListResponse<Movie>>(
        route: router,
        create: () => APIListResponse(create: () => Movie())
    );
    return result;
  }

  Future<Result> detailMovie(int movieId) async {
    Router router = Router(Target(null, 'movie/$movieId', APIMethod.get));
    var result = await client.request<Movie>(
        route: router,
        create: () => Movie()
    );
    return result;
  }

  Future<Result> creditMovie(int movieId) async {
    Router router = Router(Target(null, 'movie/$movieId/credits', APIMethod.get));
    var result = await client.request<CreditResponse>(
        route: router,
        create: () => CreditResponse()
    );
    return result;
  }
}