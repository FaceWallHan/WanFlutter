import 'dart:convert';

class RegisterResponse {
  bool admin;
  List<dynamic> chapterTops;
  int coinCount;
  List<dynamic> collectIds;
  String email;
  String icon;
  int id;
  String nickname;
  String password;
  String publicName;
  String token;
  int type;
  String username;

  RegisterResponse({
    required this.admin,
    required this.chapterTops,
    required this.coinCount,
    required this.collectIds,
    required this.email,
    required this.icon,
    required this.id,
    required this.nickname,
    required this.password,
    required this.publicName,
    required this.token,
    required this.type,
    required this.username,
  });

  factory RegisterResponse.fromRawJson(String str) =>
      RegisterResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        admin: json["admin"],
        chapterTops: List<dynamic>.from(json["chapterTops"].map((x) => x)),
        coinCount: json["coinCount"],
        collectIds: List<dynamic>.from(json["collectIds"].map((x) => x)),
        email: json["email"],
        icon: json["icon"],
        id: json["id"],
        nickname: json["nickname"],
        password: json["password"],
        publicName: json["publicName"],
        token: json["token"],
        type: json["type"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "admin": admin,
        "chapterTops": List<dynamic>.from(chapterTops.map((x) => x)),
        "coinCount": coinCount,
        "collectIds": List<dynamic>.from(collectIds.map((x) => x)),
        "email": email,
        "icon": icon,
        "id": id,
        "nickname": nickname,
        "password": password,
        "publicName": publicName,
        "token": token,
        "type": type,
        "username": username,
      };
}
