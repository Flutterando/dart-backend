import 'dart:convert';

class PaginationModel {
  final int offset;
  final int limit;
  const PaginationModel({this.offset, this.limit});

  PaginationModel copyWith({int offset, int limit}) {
    return PaginationModel(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return {'offset': offset, 'limit': limit};
  }

  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return PaginationModel(offset: map['offset'], limit: map['limit']);
  }

  String toJson() => json.encode(toMap());

  factory PaginationModel.fromJson(String source) =>
      PaginationModel.fromMap(json.decode(source));

  @override
  String toString() => 'PaginationModel(offset: $offset, limit: $limit)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is PaginationModel && o.offset == offset && o.limit == limit;
  }

  @override
  int get hashCode => offset.hashCode ^ limit.hashCode;
}
