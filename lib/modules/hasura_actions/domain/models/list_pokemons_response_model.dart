import 'dart:convert';

import 'package:collection/collection.dart';

import 'pagination_model.dart';

class ListPokemonsResponseModel {
  final int count;
  final PaginationModel previousPagination;
  final PaginationModel nextPagination;
  final List results;

  const ListPokemonsResponseModel({
    this.count,
    this.previousPagination,
    this.nextPagination,
    this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'previousOffset': previousPagination?.offset,
      'previousLimit': previousPagination?.limit,
      'nextOffset': nextPagination?.offset,
      'nextLimit': nextPagination?.limit,
      'results': results,
    };
  }

  factory ListPokemonsResponseModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ListPokemonsResponseModel(
      count: map['count'],
      results: List.from(map['results']),
      previousPagination: PaginationModel(
        offset: map['previousOffset'],
        limit: map['previousLimit'],
      ),
      nextPagination: PaginationModel(
        offset: map['nextOffset'],
        limit: map['nextLimit'],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListPokemonsResponseModel.fromJson(String source) =>
      ListPokemonsResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ListPokemonsResponseModel(count: $count, previousPagination: $previousPagination, nextPagination: $nextPagination, results: $results)';
  }

  ListPokemonsResponseModel copyWith({
    int count,
    PaginationModel previousPagination,
    PaginationModel nextPagination,
    List results,
  }) {
    return ListPokemonsResponseModel(
      count: count ?? this.count,
      previousPagination: previousPagination ?? this.previousPagination,
      nextPagination: nextPagination ?? this.nextPagination,
      results: results ?? this.results,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is ListPokemonsResponseModel &&
        o.count == count &&
        o.previousPagination == previousPagination &&
        o.nextPagination == nextPagination &&
        listEquals(o.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        previousPagination.hashCode ^
        nextPagination.hashCode ^
        results.hashCode;
  }
}
