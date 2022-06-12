// To parse this JSON data, do
//
//     final availDestinationModel = availDestinationModelFromJson(jsonString);

import 'dart:convert';

AvailDestinationModel availDestinationModelFromJson(String str) => AvailDestinationModel.fromJson(json.decode(str));

String availDestinationModelToJson(AvailDestinationModel data) => json.encode(data.toJson());

class AvailDestinationModel {
  AvailDestinationModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  int? code;
  bool? status;
  String? message;
  Data? data;

  factory AvailDestinationModel.fromJson(Map<String, dynamic> json) => AvailDestinationModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.totalPage,
    this.currentPage,
    this.packages,
  });

  int? totalPage;
  int? currentPage;
  List<Package>? packages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalPage: json["total_page"],
    currentPage: json["current_page"],
    packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_page": totalPage,
    "current_page": currentPage,
    "packages": List<dynamic>.from(packages!.map((x) => x.toJson())),
  };
}

class Package {
  Package({
    this.packageId,
    this.name,
    this.price,
    this.currency,
    this.day,
    this.operationTimeIn,
    this.operationTimeOut,
    this.timeZone,
    this.images,
    this.packageTypeId,
    this.packageTypeName,
    this.isInstallment,
    this.destinations,
  });

  int? packageId;
  String? name;
  int? price;
  String? currency;
  int? day;
  String? operationTimeIn;
  String? operationTimeOut;
  String? timeZone;
  List<String>? images;
  int? packageTypeId;
  String? packageTypeName;
  bool? isInstallment;
  List<Destination>? destinations;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    packageId: json["package_id"],
    name: json["name"],
    price: json["price"],
    currency: json["currency"],
    day: json["day"],
    operationTimeIn: json["operation_time_in"],
    operationTimeOut: json["operation_time_out"],
    timeZone: json["time_zone"],
    images: List<String>.from(json["images"].map((x) => x)),
    packageTypeId: json["package_type_id"],
    packageTypeName: json["package_type_name"],
    isInstallment: json["is_installment"],
    destinations: List<Destination>.from(json["destinations"].map((x) => Destination.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "name": name,
    "price": price,
    "currency": currency,
    "day": day,
    "operation_time_in": operationTimeIn,
    "operation_time_out": operationTimeOut,
    "time_zone": timeZone,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "package_type_id": packageTypeId,
    "package_type_name": packageTypeName,
    "is_installment": isInstallment,
    "destinations": List<dynamic>.from(destinations!.map((x) => x.toJson())),
  };
}

class Destination {
  Destination({
    this.destinationId,
    this.name,
  });

  int? destinationId;
  String? name;

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
    destinationId: json["destination_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "destination_id": destinationId,
    "name": name,
  };
}
