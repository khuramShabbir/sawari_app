// To parse this JSON data, do
//
//     final getAllVehicleCategories = getAllVehicleCategoriesFromJson(jsonString);

import 'dart:convert';

GetAllVehicleCategories getAllVehicleCategoriesFromJson(String str) =>
    GetAllVehicleCategories.fromJson(json.decode(str));

String getAllVehicleCategoriesToJson(GetAllVehicleCategories data) =>
    json.encode(data.toJson());

class GetAllVehicleCategories {
  bool? error;
  int? errorCode;
  String? message;
  List<Category>? data;

  GetAllVehicleCategories({
    this.error,
    this.errorCode,
    this.message,
    this.data,
  });

  factory GetAllVehicleCategories.fromJson(Map<String, dynamic> json) =>
      GetAllVehicleCategories(
        error: json["error"],
        errorCode: json["errorCode"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Category>.from(
                json["data"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "errorCode": errorCode,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Category {
  int? id;
  String? categoryName;
  String? vehicleLogo;
  DateTime? createdAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.categoryName,
    this.vehicleLogo,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        categoryName: json["categoryName"],
        vehicleLogo: json["vehicleLogo"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "vehicleLogo": vehicleLogo,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
