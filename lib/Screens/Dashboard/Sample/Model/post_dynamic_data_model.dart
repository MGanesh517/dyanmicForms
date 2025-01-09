// To parse this JSON data, do
//
//     final postDynamicData = postDynamicDataFromJson(jsonString);

import 'dart:convert';

PostDynamicData postDynamicDataFromJson(String str) => PostDynamicData.fromJson(json.decode(str));

String postDynamicDataToJson(PostDynamicData data) => json.encode(data.toJson());

class PostDynamicData {
    String? appLabel;
    String? modelName;
    String? fields;

    PostDynamicData({
        this.appLabel,
        this.modelName,
        this.fields,
    });

    factory PostDynamicData.fromJson(Map<String, dynamic> json) => PostDynamicData(
        appLabel: json["app_label"],
        modelName: json["model_name"],
        fields: json["fields"],
    );

    Map<String, dynamic> toJson() => {
        "app_label": appLabel,
        "model_name": modelName,
        "fields": fields,
    };
}
