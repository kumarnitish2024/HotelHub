// To parse this JSON data, do
//
//     final stateModels = stateModelsFromJson(jsonString);

import 'dart:convert';

StateModels stateModelsFromJson(String str) => StateModels.fromJson(json.decode(str));

String stateModelsToJson(StateModels data) => json.encode(data.toJson());

class StateModels {
  String? id;
  String? code;
  String? country;
  String? name;
  // DateTime? upDateAt;
  // DateTime? createdAt;
  String? image;

  StateModels({
    this.id,
    this.code,
    this.country,
    this.name,
    // this.upDateAt,
    // this.createdAt,
    this.image,
  });

  factory StateModels.fromJson(Map<String, dynamic> json) => StateModels(
    id: json["id"],
    code: json["code"],
    country: json["country"],
    name: json["name"],
    // upDateAt: json["upDateAt"],
    // createdAt: json["createdAt"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "country": country,
    "name": name,
    // "upDateAt": upDateAt,
    // "createdAt": createdAt,
    "image": image,
  };

}
