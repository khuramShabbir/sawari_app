// To parse this JSON data, do
//
//     final getAllRegisteredVehicle = getAllRegisteredVehicleFromJson(jsonString);

import 'dart:convert';

GetAllRegisteredVehicle getAllRegisteredVehicleFromJson(String str) =>
    GetAllRegisteredVehicle.fromJson(json.decode(str));

String getAllRegisteredVehicleToJson(GetAllRegisteredVehicle data) =>
    json.encode(data.toJson());

class GetAllRegisteredVehicle {
  bool? error;
  int? errorCode;
  String? message;
  List<Datum>? data;

  GetAllRegisteredVehicle({
    this.error,
    this.errorCode,
    this.message,
    this.data,
  });

  factory GetAllRegisteredVehicle.fromJson(Map<String, dynamic> json) =>
      GetAllRegisteredVehicle(
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
  String? plateNumber;
  String? color;
  bool? isActive;
  bool? isDriving;
  bool? isRejected;
  String? registrationYear;
  String? certificateImageFront;
  String? certificateImageBack;
  String? vehiclePhoto;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  dynamic approvedBy;
  int? vehicleMakeId;
  int? vehicleModelId;
  int? vehicleCategoryId;
  VehicleMake? vehicleMake;
  VehicleModel? vehicleModel;
  VehicleCategory? vehicleCategory;

  Datum({
    this.id,
    this.plateNumber,
    this.color,
    this.isActive,
    this.isDriving,
    this.isRejected,
    this.registrationYear,
    this.certificateImageFront,
    this.certificateImageBack,
    this.vehiclePhoto,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.approvedBy,
    this.vehicleMakeId,
    this.vehicleModelId,
    this.vehicleCategoryId,
    this.vehicleMake,
    this.vehicleModel,
    this.vehicleCategory,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        plateNumber: json["plateNumber"],
        color: json["color"],
        isActive: json["isActive"],
        isDriving: json["isDriving"],
        isRejected: json["isRejected"],
        registrationYear: json["registrationYear"],
        certificateImageFront: json["certificateImageFront"],
        certificateImageBack: json["certificateImageBack"],
        vehiclePhoto: json["vehiclePhoto"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        approvedBy: json["approvedBy"],
        vehicleMakeId: json["vehicleMakeId"],
        vehicleModelId: json["vehicleModelId"],
        vehicleCategoryId: json["vehicleCategoryId"],
        vehicleMake: json["vehicleMake"] == null
            ? null
            : VehicleMake.fromJson(json["vehicleMake"]),
        vehicleModel: json["vehicleModel"] == null
            ? null
            : VehicleModel.fromJson(json["vehicleModel"]),
        vehicleCategory: json["vehicleCategory"] == null
            ? null
            : VehicleCategory.fromJson(json["vehicleCategory"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "plateNumber": plateNumber,
        "color": color,
        "isActive": isActive,
        "isDriving": isDriving,
        "isRejected": isRejected,
        "registrationYear": registrationYear,
        "certificateImageFront": certificateImageFront,
        "certificateImageBack": certificateImageBack,
        "vehiclePhoto": vehiclePhoto,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "userId": userId,
        "approvedBy": approvedBy,
        "vehicleMakeId": vehicleMakeId,
        "vehicleModelId": vehicleModelId,
        "vehicleCategoryId": vehicleCategoryId,
        "vehicleMake": vehicleMake?.toJson(),
        "vehicleModel": vehicleModel?.toJson(),
        "vehicleCategory": vehicleCategory?.toJson(),
      };
}

class VehicleCategory {
  int? id;
  String? categoryName;
  String? vehicleLogo;
  DateTime? createdAt;
  DateTime? updatedAt;

  VehicleCategory({
    this.id,
    this.categoryName,
    this.vehicleLogo,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleCategory.fromJson(Map<String, dynamic> json) =>
      VehicleCategory(
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

class VehicleMake {
  int? id;
  String? companyName;
  String? companyLogo;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? vehicleCategoryId;

  VehicleMake({
    this.id,
    this.companyName,
    this.companyLogo,
    this.createdAt,
    this.updatedAt,
    this.vehicleCategoryId,
  });

  factory VehicleMake.fromJson(Map<String, dynamic> json) => VehicleMake(
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyName": companyName,
        "companyLogo": companyLogo,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "vehicleCategoryId": vehicleCategoryId,
      };
}

class VehicleModel {
  int? id;
  String? modelName;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? vehicleTypeId;
  int? vehicleMakeId;

  VehicleModel({
    this.id,
    this.modelName,
    this.createdAt,
    this.updatedAt,
    this.vehicleTypeId,
    this.vehicleMakeId,
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "modelName": modelName,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "vehicleTypeId": vehicleTypeId,
        "vehicleMakeId": vehicleMakeId,
      };
}
