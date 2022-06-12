// To parse this JSON data, do
//
//     final destinationModel = destinationModelFromJson(jsonString);

import 'dart:convert';

DestinationModel destinationModelFromJson(String str) => DestinationModel.fromJson(json.decode(str));

String destinationModelToJson(DestinationModel data) => json.encode(data.toJson());

class DestinationModel {
  DestinationModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  int? code;
  bool? status;
  String? message;
  List<Datum>? data;

  factory DestinationModel.fromJson(Map<String, dynamic> json) => DestinationModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
    Datum({
      this.destinationId,
      this.typeSource,
      this.typeName,
      this.name,
      this.packageTypeId,
    });

    int? destinationId;
    String? typeSource;
    String? typeName;
    String? name;
    int? packageTypeId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      destinationId: json["destination_id"],
      typeSource: json["type_source"],
      typeName: json["type_name"],
      name: json["name"],
      packageTypeId: json["package_type_id"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "destination_id": destinationId,
        "type_source": typeSource,
        "type_name": typeName,
        "name": name,
        "package_type_id": packageTypeId ?? 0,
    };
}



