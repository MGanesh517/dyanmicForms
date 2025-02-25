// To parse this JSON data, do
//
//     final modelsDetailsKeys = modelsDetailsKeysFromJson(jsonString);

import 'dart:convert';

ModelsDetailsKeys modelsDetailsKeysFromJson(String str) => ModelsDetailsKeys.fromJson(json.decode(str));

String modelsDetailsKeysToJson(ModelsDetailsKeys data) => json.encode(data.toJson());

class ModelsDetailsKeys {
    String? status;
    ModelsDetailsKeysData? model;

    ModelsDetailsKeys({
        this.status,
        this.model,
    });

    factory ModelsDetailsKeys.fromJson(Map<String, dynamic> json) => ModelsDetailsKeys(
        status: json["status"],
        model: json["model"] == null ? null : ModelsDetailsKeysData.fromJson(json["model"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "model": model?.toJson(),
    };
}

class ModelsDetailsKeysData {
    String? appName;
    String? modelName;
    String? verboseName;
    String? verboseNamePlural;
    String? tableName;
    List<Field>? fields;

    ModelsDetailsKeysData({
        this.appName,
        this.modelName,
        this.verboseName,
        this.verboseNamePlural,
        this.tableName,
        this.fields,
    });

    factory ModelsDetailsKeysData.fromJson(Map<String, dynamic> json) => ModelsDetailsKeysData(
        appName: json["app_name"],
        modelName: json["model_name"],
        verboseName: json["verbose_name"],
        verboseNamePlural: json["verbose_name_plural"],
        tableName: json["table_name"],
        fields: json["fields"] == null ? [] : List<Field>.from(json["fields"]!.map((x) => Field.fromJson(x))),
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

class Field {
    String? name;
    String? verboseName;
    String? dataType;
    bool? concrete;
    bool? editable;
    bool? fieldNull;
    RelatedModel? relatedModel;

    Field({
        this.name,
        this.verboseName,
        this.dataType,
        this.concrete,
        this.editable,
        this.fieldNull,
        this.relatedModel,
    });

    factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        verboseName: json["verbose_name"],
        dataType: json["data_type"],
        concrete: json["concrete"],
        editable: json["editable"],
        fieldNull: json["null"],
        relatedModel: json["related_model"] == null ? null : RelatedModel.fromJson(json["related_model"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "verbose_name": verboseName,
        "data_type": dataType,
        "concrete": concrete,
        "editable": editable,
        "null": fieldNull,
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
