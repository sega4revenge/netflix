
import 'package:netflix/Network/TypeDecodable.dart';
class CreditResponse implements Decodable<CreditResponse> {
  int? id;
  List<Cast>? casts;
  List<Crew>? crews;

  @override
  CreditResponse decode(dynamic data) {
    id = data['id'];
    var listCasts = data['cast'];
    if (listCasts != null) {
      this.casts = (listCasts as List).map((i) => Cast().decode(i)).toList();
    }

    var listCrews = data['crew'];
    if (listCrews != null) {
      this.crews = (listCrews as List).map((i) => Crew().decode(i)).toList();
    }

    return this;
  }
}



class People implements Decodable<People> {
  int? id;
  bool? adult;
  int? gender;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  String? creditId;

  @override
  People decode(dynamic data) {
    id = data['id'];
    adult = data['adult'];
    gender = data['gender'];
    knownForDepartment = data['known_for_department'];
    name = data['name'];
    originalName = data['original_name'];
    popularity = data['popularity'];
    profilePath = data['profile_path'];
    creditId = data['credit_id'];
    return this;
  }
}


class Crew extends People {
  String? department;
  String? job;

  @override
  Crew decode(dynamic data) {
    super.decode(data);
    department = data['department'];
    job = data['job'];
    return this;
  }
}

class Cast extends People {
  int? castId;
  String? character;
  int? order;

  @override
  Cast decode(dynamic data) {
    super.decode(data);
    castId = data['cast_id'];
    character = data['character'];
    order = data['order'];
    return this;
  }
}