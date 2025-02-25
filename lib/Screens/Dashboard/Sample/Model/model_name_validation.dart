// To parse this JSON data, do
//
//     final ModelNameValidation = modelValidationFromJson(jsonString);

import 'dart:convert';

ModelNameValidation modelValidationFromJson(String str) => ModelNameValidation.fromJson(json.decode(str));

String modelValidationToJson(ModelNameValidation data) => json.encode(data.toJson());

class ModelNameValidation {
    String? status;
    String? message;

    ModelNameValidation({
        this.status,
        this.message,
    });

    factory ModelNameValidation.fromJson(Map<String, dynamic> json) => ModelNameValidation(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
