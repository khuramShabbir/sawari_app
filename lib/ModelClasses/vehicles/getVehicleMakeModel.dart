// To parse this JSON data, do
//
//     final getVehicleMakeModel = getVehicleMakeModelFromJson(jsonString);

import 'dart:convert';

GetVehicleMakeModel getVehicleMakeModelFromJson(String str) =>
    GetVehicleMakeModel.fromJson(json.decode(str));

String getVehicleMakeModelToJson(GetVehicleMakeModel data) =>
    json.encode(data.toJson());

class GetVehicleMakeModel {
  bool? error;
  int? errorCode;
  String? message;
  List<Make>? data;

  GetVehicleMakeModel({
    this.error,
    this.errorCode,
    this.message,
    this.data,
  });

  factory GetVehicleMakeModel.fromJson(Map<String, dynamic> json) =>
      GetVehicleMakeModel(
        error: json["error"],
        errorCode: json["errorCode"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Make>.from(json["data"]!.map((x) => Make.fromJson(x))),
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

class Make {
  int? id;
  String? companyName;
  String? companyLogo;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? vehicleCategoryId;
  List<VehicleModel>? vehicleModels;
  bool isSelected;
  Make({
    this.id,
    this.companyName,
    this.companyLogo,
    this.createdAt,
    this.updatedAt,
    this.vehicleCategoryId,
    this.vehicleModels,
    this.isSelected = false,
  });

  factory Make.fromJson(Map<String, dynamic> json) => Make(
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
