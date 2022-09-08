import 'package:q8_task/data/models/address.dart';
import 'package:q8_task/data/models/bank.dart';
import 'package:q8_task/data/models/company.dart';
import 'package:q8_task/data/models/hair.dart';

class Player {
    Player({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.maidenName,
        required this.age,
        required this.gender,
        required this.email,
        required this.phone,
        required this.username,
        required this.password,
        required this.birthDate,
        required this.image,
        required this.bloodGroup,
        required this.height,
        required this.weight,
        required this.eyeColor,
        required this.hair,
        required this.domain,
        required this.ip,
        required this.address,
        required this.macAddress,
        required this.university,
        required this.bank,
        required this.company,
        required this.ein,
        required this.ssn,
        required this.userAgent,
    });

    final int id;
    final String firstName;
    final String lastName;
    final String maidenName;
    final int age;
    final String gender;
    final String email;
    final String phone;
    final String username;
    final String password;
    final DateTime birthDate;
    final String image;
    final String bloodGroup;
    final int height;
    final double weight;
    final String eyeColor;
    final Hair hair;
    final String domain;
    final String ip;
    final Address address;
    final String macAddress;
    final String university;
    final Bank bank;
    final Company company;
    final String ein;
    final String ssn;
    final String userAgent;

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        maidenName: json["maidenName"],
        age: json["age"],
        gender:json["gender"],
        email: json["email"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        birthDate: DateTime.parse(json["birthDate"]),
        image: json["image"],
        bloodGroup: json["bloodGroup"],
        height: json["height"],
        weight: json["weight"].toDouble(),
        eyeColor: json["eyeColor"],
        hair: Hair.fromJson(json["hair"]),
        domain: json["domain"],
        ip: json["ip"],
        address: Address.fromJson(json["address"]),
        macAddress: json["macAddress"],
        university: json["university"],
        bank: Bank.fromJson(json["bank"]),
        company: Company.fromJson(json["company"]),
        ein: json["ein"],
        ssn: json["ssn"],
        userAgent: json["userAgent"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "maidenName": maidenName,
        "age": age,
        "gender": gender,
        "email": email,
        "phone": phone,
        "username": username,
        "password": password,
        "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "image": image,
        "bloodGroup": bloodGroup,
        "height": height,
        "weight": weight,
        "eyeColor": eyeColor,
        "hair": hair.toJson(),
        "domain": domain,
        "ip": ip,
        "address": address.toJson(),
        "macAddress": macAddress,
        "university": university,
        "bank": bank.toJson(),
        "company": company.toJson(),
        "ein": ein,
        "ssn": ssn,
        "userAgent": userAgent,
    };
}