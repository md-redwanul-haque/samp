import 'dart:convert';

class UserData {
  final bool? success;
  final String? message;
  final List<UserDataList>? data;

  UserData({
    this.success,
    this.message,
    this.data,
  });

  factory UserData.fromRawJson(String str) => UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<UserDataList>.from(json["data"]!.map((x) => UserDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class UserDataList {
  final String? id;
  final String? organizationName;
  final String? orgDomain;


  UserDataList({
    this.id,
    this.organizationName,
    this.orgDomain,

  });

  factory UserDataList.fromRawJson(String str) => UserDataList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDataList.fromJson(Map<String, dynamic> json) => UserDataList(
    id: json["_id"],
    organizationName: json["organizationName"],
    orgDomain: json["orgDomain"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "organizationName": organizationName,
    "orgDomain": orgDomain,
  };
}
