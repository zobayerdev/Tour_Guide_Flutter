import 'dart:convert';

class ProfileModel {
    bool? success;
    String? message;
    int? code;
    Data? data;

    ProfileModel({
        this.success,
        this.message,
        this.code,
        this.data,
    });

    factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "code": code,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? name;
    String? username;
    String? email;
    String? phone;
    String? bio;
    String? gender;
    String? dateOfBirth;

    Data({
        this.id,
        this.name,
        this.username,
        this.email,
        this.phone,
        this.bio,
        this.gender,
        this.dateOfBirth,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        bio: json["bio"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "bio": bio,
        "gender": gender,
        "date_of_birth": dateOfBirth,
    };
}
