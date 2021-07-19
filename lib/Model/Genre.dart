
import 'package:netflix/Network/TypeDecodable.dart';

class Genre implements Decodable<Genre> {
  int? id;
  String? name;

  @override
  Genre decode(dynamic data) {
    id = data['id'];
    name = data['name'];
    return this;
  }
}