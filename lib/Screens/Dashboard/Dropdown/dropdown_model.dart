// To parse this JSON data, do
//
//     final dropdownModel = dropdownModelFromJson(jsonString);

import 'dart:convert';

DropdownModel dropdownModelFromJson(String str) => DropdownModel.fromJson(json.decode(str));

String dropdownModelToJson(DropdownModel data) => json.encode(data.toJson());

class DropdownModel {
    String? appName;
    String? modelName;
    String? verboseName;
    String? verboseNamePlural;
    String? tableName;
    List<DropdownModelData>? fields;

    DropdownModel({
        this.appName,
        this.modelName,
        this.verboseName,
        this.verboseNamePlural,
        this.tableName,
        this.fields,
    });

    factory DropdownModel.fromJson(Map<String, dynamic> json) => DropdownModel(
        appName: json["app_name"],
        modelName: json["model_name"],
        verboseName: json["verbose_name"],
        verboseNamePlural: json["verbose_name_plural"],
        tableName: json["table_name"],
        fields: json["fields"] == null ? [] : List<DropdownModelData>.from(json["fields"]!.map((x) => DropdownModelData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "app_name": appName,
        "model_name": modelName,
        "verbose_name": verboseName,
        "verbose_name_plural": verboseNamePlural,
        "table_name": tableName,
        "fields": fields == null ? [] : List<dynamic>.from(fields!.map((x) => x.toJson())),
    };
}

class DropdownModelData {
    String? name;
    String? verboseName;
    String? dataType;
    bool? concrete;
    bool? editable;
    bool? fieldNull;
    String? ins;
    RelatedModel? relatedModel;

    DropdownModelData({
        this.name,
        this.verboseName,
        this.dataType,
        this.concrete,
        this.editable,
        this.fieldNull,
        this.ins,
        this.relatedModel,
    });

    factory DropdownModelData.fromJson(Map<String, dynamic> json) => DropdownModelData(
        name: json["name"],
        verboseName: json["verbose_name"],
        dataType: json["data_type"],
        concrete: json["concrete"],
        editable: json["editable"],
        fieldNull: json["null"],
        ins: json["INS"],
        relatedModel: json["related_model"] == null ? null : RelatedModel.fromJson(json["related_model"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "verbose_name": verboseName,
        "data_type": dataType,
        "concrete": concrete,
        "editable": editable,
        "null": fieldNull,
        "INS": ins,
        "related_model": relatedModel?.toJson(),
    };
}

class RelatedModel {
    String? appName;
    String? modelName;
    String? verboseName;
    List<dynamic>? fields;

    RelatedModel({
        this.appName,
        this.modelName,
        this.verboseName,
        this.fields,
    });

    factory RelatedModel.fromJson(Map<String, dynamic> json) => RelatedModel(
        appName: json["app_name"],
        modelName: json["model_name"],
        verboseName: json["verbose_name"],
        fields: json["fields"] == null ? [] : List<dynamic>.from(json["fields"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "app_name": appName,
        "model_name": modelName,
        "verbose_name": verboseName,
        "fields": fields == null ? [] : List<dynamic>.from(fields!.map((x) => x)),
    };
}
