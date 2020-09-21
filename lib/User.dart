import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.name,
    this.password,
  });

  String name;
  String password;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    name: json["name"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
  };
}
