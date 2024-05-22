// To parse this JSON data, do
//
//     final staff = staffFromJson(jsonString);

import 'dart:convert';

Staff staffFromJson(String str) => Staff.fromJson(json.decode(str));

String staffToJson(Staff data) => json.encode(data.toJson());

class Staff {
  int id;
  String name;
  int window;
  int rating;
  String feedback;

  Staff({
    required this.id,
    required this.name,
    required this.window,
    required this.rating,
    required this.feedback,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    id: json["id"],
    name: json["name"],
    window: json["window"],
    rating: json["rating"],
    feedback: json["feedback"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "window": window,
    "rating": rating,
    "feedback": feedback,
  };
}
