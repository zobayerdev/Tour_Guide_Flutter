import 'dart:convert';

class ProfileImageModel {
  dynamic avatar;

  ProfileImageModel({
    this.avatar,
  });

  factory ProfileImageModel.fromRawJson(String str) =>
      ProfileImageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileImageModel.fromJson(Map<String, dynamic> json) =>
      ProfileImageModel(
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
      };
}
