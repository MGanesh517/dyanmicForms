// To parse this JSON data, do
//
//     final modelValidation = modelValidationFromJson(jsonString);

import 'dart:convert';

ModelValidation modelValidationFromJson(String str) => ModelValidation.fromJson(json.decode(str));

String modelValidationToJson(ModelValidation data) => json.encode(data.toJson());

class ModelValidation {
    String? status;
    String? message;

    ModelValidation({
        this.status,
        this.message,
    });

    factory ModelValidation.fromJson(Map<String, dynamic> json) => ModelValidation(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
