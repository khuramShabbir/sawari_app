// To parse this JSON data, do
//
//     final getAllMakesModels = getAllMakesModelsFromJson(jsonString);

import 'dart:convert';

GetAllMakesModels getAllMakesModelsFromJson(String str) =>
    GetAllMakesModels.fromJson(json.decode(str));

String getAllMakesModelsToJson(GetAllMakesModels data) =>
    json.encode(data.toJson());

class GetAllMakesModels {
  bool? error;
  int? errorCode;
  String? message;
  List<Datum>? data;

  GetAllMakesModels({
    this.error,
    this.errorCode,
    this.message,
    this.data,
  });

  factory GetAllMakesModels.fromJson(Map<String, dynamic> json) =>
      GetAllMakesModels(
        error: json["error"],
        errorCode: json["errorCode"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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

class Datum {
  int? id;
  String? companyName;
  String? companyLogo;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? vehicleCategoryId;
  List<VehicleModel>? vehicleModels;

  Datum({
    this.id,
    this.companyName,
    this.companyLogo,
    this.createdAt,
    this.updatedAt,
    this.vehicleCategoryId,
    this.vehicleModels,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        companyName: json["companyName"],
        companyLogo: json["companyLogo"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        vehicleCategoryId: json["vehicleCategoryId"],
        vehicleModels: json["vehicleModels"] == null
            ? []
            : List<VehicleModel>.from(
                json["vehicleModels"]!.map((x) => VehicleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyName": companyName,
        "companyLogo": companyLogo,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "vehicleCategoryId": vehicleCategoryId,
        "vehicleModels": vehicleModels == null
            ? []
            : List<dynamic>.from(vehicleModels!.map((x) => x.toJson())),
      };
}

class VehicleModel {
  int? id;
  String? modelName;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? vehicleTypeId;
  int? vehicleMakeId;
  VehicleType? vehicleType;

  VehicleModel({
    this.id,
    this.modelName,
    this.createdAt,
    this.updatedAt,
    this.vehicleTypeId,
    this.vehicleMakeId,
    this.vehicleType,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        id: json["id"],
        modelName: json["modelName"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        vehicleTypeId: json["vehicleTypeId"],
        vehicleMakeId: json["vehicleMakeId"],
        vehicleType: json["vehicleType"] == null
            ? null
            : VehicleType.fromJson(json["vehicleType"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "modelName": modelName,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "vehicleTypeId": vehicleTypeId,
        "vehicleMakeId": vehicleMakeId,
        "vehicleType": vehicleType?.toJson(),
      };
}

class VehicleType {
  int? id;
  String? typeName;
  String? typeIcon;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  VehicleType({
    this.id,
    this.typeName,
    this.typeIcon,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
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
