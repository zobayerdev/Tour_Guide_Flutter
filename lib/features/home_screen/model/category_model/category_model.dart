import 'dart:convert';

class CategoryModel {
    bool? status;
    String? message;
    int? code;
    List<Datum>? data;

    CategoryModel({
        this.status,
        this.message,
        this.code,
        this.data,
    });

    factory CategoryModel.fromRawJson(String str) => CategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? title;
    String? slug;
    String? image;
    String? status;

    Datum({
        this.id,
        this.title,
        this.slug,
        this.image,
        this.status,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "image": image,
        "status": status,
    };
}
