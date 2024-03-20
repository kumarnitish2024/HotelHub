// To parse this JSON data, do
//
//     final hotelModel = hotelModelFromJson(jsonString);

import 'dart:convert';

HotelModel hotelModelFromJson(String str) => HotelModel.fromJson(json.decode(str));

String hotelModelToJson(HotelModel data) => json.encode(data.toJson());

class HotelModel {
  String name;
  String address;
  String price;
  List<String> imageUrl;

  HotelModel({
    required this.name,
    required this.address,
    required this.price,
    required this.imageUrl,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
    name: json["name"],
    address: json["address"],
    price: json["price"],
    imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "price": price,
    "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
  };
}
