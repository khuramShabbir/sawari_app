// To parse this JSON data, do
//
//     final createUser = createUserFromJson(jsonString);

import 'dart:convert';

CreateUser createUserFromJson(String str) =>
    CreateUser.fromJson(json.decode(str));

String createUserToJson(CreateUser data) => json.encode(data.toJson());

class CreateUser {
  bool? error;
  String? message;
  String? token;
  Data? data;

  CreateUser({
    this.error,
    this.message,
    this.token,
    this.data,
  });

  factory CreateUser.fromJson(Map<String, dynamic> json) => CreateUser(
        error: json["error"],
        message: json["message"],
        token: json["token"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "token": token,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? name;
  dynamic mobileNumber;
  String? loginId;
  bool? isSocialLogin;
  String? socialType;
  String? profileImage;
  bool? isActive;
  bool? isBlocked;
  bool? isSuspended;
  dynamic userType;
  int? amount;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.mobileNumber,
    this.loginId,
    this.isSocialLogin,
    this.socialType,
    this.profileImage,
    this.isActive,
    this.isBlocked,
    this.isSuspended,
    this.userType,
    this.amount,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        mobileNumber: json["mobileNumber"],
        loginId: json["loginId"],
        isSocialLogin: json["isSocialLogin"],
        socialType: json["socialType"],
        profileImage: json["profileImage"],
        isActive: json["isActive"],
        isBlocked: json["isBlocked"],
        isSuspended: json["isSuspended"],
        userType: json["userType"],
        amount: json["amount"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobileNumber": mobileNumber,
        "loginId": loginId,
        "isSocialLogin": isSocialLogin,
        "socialType": socialType,
        "profileImage": profileImage,
        "isActive": isActive,
        "isBlocked": isBlocked,
        "isSuspended": isSuspended,
        "userType": userType,
        "amount": amount,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
