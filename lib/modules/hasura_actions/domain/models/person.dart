import 'dart:convert';

class Person {
  final double weight;
  final double height;

  Person({this.weight, this.height});

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'height': height,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Person(
      weight: map['person']['weight'].toDouble(),
      height: map['person']['height'].toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));
}
