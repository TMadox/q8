import 'package:q8_task/data/models/address.dart';

class Company {
    Company({
        required this.address,
        required this.department,
        required this.name,
        required this.title,
    });

    final Address address;
    final String department;
    final String name;
    final String title;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        address: Address.fromJson(json["address"]),
        department: json["department"],
        name: json["name"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "department": department,
        "name": name,
        "title": title,
    };
}