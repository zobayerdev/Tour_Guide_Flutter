import 'dart:convert';

class SignInResponse {
  bool? status;
  String? message;
  int? code;
  Data? data;

  SignInResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory SignInResponse.fromRawJson(String str) =>
      SignInResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data?.toJson(),
      };
}

class Data {
  Token? token;
  User? user;

  Data({
    this.token,
    this.user,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token?.toJson(),
        "user": user?.toJson(),
      };
}

class Token {
  Headers? headers;
  Original? original;
  dynamic exception;

  Token({
    this.headers,
    this.original,
    this.exception,
  });

  factory Token.fromRawJson(String str) => Token.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        headers:
            json["headers"] == null ? null : Headers.fromJson(json["headers"]),
        original: json["original"] == null
            ? null
            : Original.fromJson(json["original"]),
        exception: json["exception"],
      );

  Map<String, dynamic> toJson() => {
        "headers": headers?.toJson(),
        "original": original?.toJson(),
        "exception": exception,
      };
}

class Headers {
  Headers();

  factory Headers.fromRawJson(String str) => Headers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Headers.fromJson(Map<String, dynamic> json) => Headers();

  Map<String, dynamic> toJson() => {};
}

class Original {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Original({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  factory Original.fromRawJson(String str) =>
      Original.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}

class User {
  int? id;
  dynamic name;
  String? username;
  dynamic phone;
  String? email;
  dynamic avatar;
  dynamic dateOfBirth;
  dynamic gender;
  dynamic city;
  dynamic country;
  DateTime? emailVerifiedAt;
  String? role;
  String? status;
  dynamic otp;
  dynamic otpCreatedAt;
  String? language;
  dynamic lat;
  dynamic lng;
  dynamic bio;
  dynamic age;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? timezone;

  User({
    this.id,
    this.name,
    this.username,
    this.phone,
    this.email,
    this.avatar,
    this.dateOfBirth,
    this.gender,
    this.city,
    this.country,
    this.emailVerifiedAt,
    this.role,
    this.status,
    this.otp,
    this.otpCreatedAt,
    this.language,
    this.lat,
    this.lng,
    this.bio,
    this.age,
    this.createdAt,
    this.updatedAt,
    this.timezone,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        avatar: json["avatar"],
        dateOfBirth: json["date_of_birth"],
        gender: json["gender"],
        city: json["city"],
        country: json["country"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        role: json["role"],
        status: json["status"],
        otp: json["otp"],
        otpCreatedAt: json["otp_created_at"],
        language: json["language"],
        lat: json["lat"],
        lng: json["lng"],
        bio: json["bio"],
        age: json["age"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "phone": phone,
        "email": email,
        "avatar": avatar,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "city": city,
        "country": country,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "role": role,
        "status": status,
        "otp": otp,
        "otp_created_at": otpCreatedAt,
        "language": language,
        "lat": lat,
        "lng": lng,
        "bio": bio,
        "age": age,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "timezone": timezone,
      };
}
