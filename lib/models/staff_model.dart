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
  String status;

  Staff({
    required this.id,
    required this.name,
    required this.window,
    required this.status,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    id: json["id"],
    name: json["name"],
    window: json["window"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "window": window,
    "status": status,
  };
}
