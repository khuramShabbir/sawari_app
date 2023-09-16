// To parse this JSON data, do
//
//     final vehicleTypes = vehicleTypesFromJson(jsonString);

import 'dart:convert';

VehicleTypes vehicleTypesFromJson(String str) =>
    VehicleTypes.fromJson(json.decode(str));

String vehicleTypesToJson(VehicleTypes data) => json.encode(data.toJson());

class VehicleTypes {
  bool? error;
  int? errorCode;
  String? message;
  List<Type>? data;

  VehicleTypes({
    this.error,
    this.errorCode,
    this.message,
    this.data,
  });

  factory VehicleTypes.fromJson(Map<String, dynamic> json) => VehicleTypes(
        error: json["error"],
        errorCode: json["errorCode"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Type>.from(json["data"]!.map((x) => Type.fromJson(x))),
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

class Type {
  int? id;
  String? typeName;
  String? typeIcon;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Type({
    this.id,
    this.typeName,
    this.typeIcon,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        typeName: json["typeName"],
        typeIcon: json["typeIcon"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "typeName": typeName,
        "typeIcon": typeIcon,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
