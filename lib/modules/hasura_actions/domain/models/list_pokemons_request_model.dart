import 'dart:convert';

class ListPokemonsRequestModel {
  final int offset;
  final int limit;

  ListPokemonsRequestModel({this.offset, this.limit});

  Map<String, dynamic> toMap() {
    return {
      'offset': offset,
      'limit': limit,
    };
  }

  factory ListPokemonsRequestModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ListPokemonsRequestModel(
      offset: map['offset'],
      limit: map['limit'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ListPokemonsRequestModel.fromJson(String source) =>
      ListPokemonsRequestModel.fromMap(json.decode(source));
}
