// To parse this JSON data, do
//
//     final dynamicModelsNameList = dynamicModelsNameListFromJson(jsonString);

import 'dart:convert';

DynamicModelsNameList dynamicModelsNameListFromJson(String str) => DynamicModelsNameList.fromJson(json.decode(str));

String dynamicModelsNameListToJson(DynamicModelsNameList data) => json.encode(data.toJson());

class DynamicModelsNameList {
    String? status;
    int? count;
    List<DynamicModelsNameData>? models;

    DynamicModelsNameList({
        this.status,
        this.count,
        this.models,
    });

    factory DynamicModelsNameList.fromJson(Map<String, dynamic> json) => DynamicModelsNameList(
        status: json["status"],
        count: json["count"],
        models: json["models"] == null ? [] : List<DynamicModelsNameData>.from(json["models"]!.map((x) => DynamicModelsNameData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "models": models == null ? [] : List<dynamic>.from(models!.map((x) => x.toJson())),
    };
}

class DynamicModelsNameData {
    String? appName;
    String? modelName;
    String? verboseName;
    String? verboseNamePlural;
    String? tableName;

    DynamicModelsNameData({
        this.appName,
        this.modelName,
        this.verboseName,
        this.verboseNamePlural,
        this.tableName,
    });

    factory DynamicModelsNameData.fromJson(Map<String, dynamic> json) => DynamicModelsNameData(
        appName: json["app_name"],
        modelName: json["model_name"],
        verboseName: json["verbose_name"],
        verboseNamePlural: json["verbose_name_plural"],
        tableName: json["table_name"],
    );

    Map<String, dynamic> toJson() => {
        "app_name": appName,
        "model_name": modelName,
        "verbose_name": verboseName,
        "verbose_name_plural": verboseNamePlural,
        "table_name": tableName,
    };
}
