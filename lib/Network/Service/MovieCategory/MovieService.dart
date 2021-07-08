
import 'package:netflix/Config/Result.dart';
import 'package:netflix/Model/HomeCategory.dart';
import 'package:netflix/Model/Movie.dart';
import 'package:netflix/Network/APIResponse.dart';
import 'package:netflix/Network/Service/MovieCategory/MovieTarget.dart';

import '../../APIClient.dart';
import '../../APIRouteConfigurable.dart';
class MovieService {
  final APIClient client = APIClient();

  Future<Result> getListMovie(HomeCategory category) async {
    Router router = Router(GetListMovie(category));
    var result = await client.request<APIListResponse<Movie>>(
        route: router,
        create: () => APIListResponse(create: () => Movie())
    );
    return result;
  }
}