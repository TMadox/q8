// To parse this JSON data, do
//
//     final playerResponse = playerResponseFromJson(jsonString);

import 'dart:convert';

import 'package:q8_task/data/models/player.dart';

PlayerResponse playerResponseFromJson(String str) =>
    PlayerResponse.fromJson(json.decode(str));

String playerResponseToJson(PlayerResponse data) => json.encode(data.toJson());

class PlayerResponse {
  PlayerResponse({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<Player> users;
  final int total;
  final int skip;
  final int limit;

  factory PlayerResponse.fromJson(Map<String, dynamic> json) => PlayerResponse(
        users: List<Player>.from(json["users"].map((x) => Player.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}
