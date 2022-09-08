import 'package:q8_task/data/models/coordinates.dart';

class Address {
  Address({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state,
  });

  final String address;
  final String city;
  final Coordinates coordinates;
  final String postalCode;
  final String state;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"] ?? "",
        city: json["city"] ?? "" ?? "",
        coordinates: Coordinates.fromJson(json["coordinates"] ?? ""),
        postalCode: json["postalCode"] ?? "",
        state: json["state"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "coordinates": coordinates.toJson(),
        "postalCode": postalCode,
        "state": state,
      };
}
