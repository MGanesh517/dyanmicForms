// To parse this JSON data, do
//
//     final getDynamicList = getDynamicListFromJson(jsonString);

import 'dart:convert';

GetDynamicList getDynamicListFromJson(String str) => GetDynamicList.fromJson(json.decode(str));

String getDynamicListToJson(GetDynamicList data) => json.encode(data.toJson());

class GetDynamicList {
    int? count;
    List<GetDynamicData>? results;

    GetDynamicList({
        this.count,
        this.results,
    });

    factory GetDynamicList.fromJson(Map<String, dynamic> json) => GetDynamicList(
        count: json["count"],
        results: json["results"] == null ? [] : List<GetDynamicData>.from(json["results"]!.map((x) => GetDynamicData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class GetDynamicData {
    int? id;
    String? appLabel;
    String? modelName;
    ResultFields? fields;

    GetDynamicData({
        this.id,
        this.appLabel,
        this.modelName,
        this.fields,
    });

    factory GetDynamicData.fromJson(Map<String, dynamic> json) => GetDynamicData(
        id: json["id"],
        appLabel: json["app_label"],
        modelName: json["model_name"],
        fields: json["fields"] == null ? null : ResultFields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "app_label": appLabel,
        "model_name": modelName,
        "fields": fields?.toJson(),
    };
}

class ResultFields {
    Age? name;
    Age? age;
    Age? type;
    Age? textField;
    Age? fieldsName;
    Age? description;
    Age? gender;
    Age? fieldsAge;
    Age? datetime;
    Age? date;
    Age? time;
    Age? duration;
    Age? radius;
    Createdby? groups;
    Createdby? grp;
    Createdby? createdby;
    Createdby? modifiedby;
    Age? isDeleted;
    Items? items;

    ResultFields({
        this.name,
        this.age,
        this.type,
        this.textField,
        this.fieldsName,
        this.description,
        this.gender,
        this.fieldsAge,
        this.datetime,
        this.date,
        this.time,
        this.duration,
        this.radius,
        this.groups,
        this.grp,
        this.createdby,
        this.modifiedby,
        this.isDeleted,
        this.items,
    });

    factory ResultFields.fromJson(Map<String, dynamic> json) => ResultFields(
        name: json["Name"] == null ? null : Age.fromJson(json["Name"]),
        age: json["Age"] == null ? null : Age.fromJson(json["Age"]),
        type: json["Type"] == null ? null : Age.fromJson(json["Type"]),
        textField: json["TextField"] == null ? null : Age.fromJson(json["TextField"]),
        fieldsName: json["name"] == null ? null : Age.fromJson(json["name"]),
        description: json["description"] == null ? null : Age.fromJson(json["description"]),
        gender: json["gender"] == null ? null : Age.fromJson(json["gender"]),
        fieldsAge: json["age"] == null ? null : Age.fromJson(json["age"]),
        datetime: json["datetime"] == null ? null : Age.fromJson(json["datetime"]),
        date: json["date"] == null ? null : Age.fromJson(json["date"]),
        time: json["time"] == null ? null : Age.fromJson(json["time"]),
        duration: json["duration"] == null ? null : Age.fromJson(json["duration"]),
        radius: json["radius"] == null ? null : Age.fromJson(json["radius"]),
        groups: json["groups"] == null ? null : Createdby.fromJson(json["groups"]),
        grp: json["grp"] == null ? null : Createdby.fromJson(json["grp"]),
        createdby: json["createdby"] == null ? null : Createdby.fromJson(json["createdby"]),
        modifiedby: json["modifiedby"] == null ? null : Createdby.fromJson(json["modifiedby"]),
        isDeleted: json["is_deleted"] == null ? null : Age.fromJson(json["is_deleted"]),
        items: json["items"] == null ? null : Items.fromJson(json["items"]),
    );

    Map<String, dynamic> toJson() => {
        "Name": name?.toJson(),
        "Age": age?.toJson(),
        "Type": type?.toJson(),
        "TextField": textField?.toJson(),
        "name": fieldsName?.toJson(),
        "description": description?.toJson(),
        "gender": gender?.toJson(),
        "age": fieldsAge?.toJson(),
        "datetime": datetime?.toJson(),
        "date": date?.toJson(),
        "time": time?.toJson(),
        "duration": duration?.toJson(),
        "radius": radius?.toJson(),
        "groups": groups?.toJson(),
        "grp": grp?.toJson(),
        "createdby": createdby?.toJson(),
        "modifiedby": modifiedby?.toJson(),
        "is_deleted": isDeleted?.toJson(),
        "items": items?.toJson(),
    };
}

class Age {
    String? type;
    bool? required;
    bool? showInView;
    bool? showInReport;
    bool? showInEdit;
    bool? showInFilter;
    bool? showInList;
    bool? showInAdd;
    dynamic ageDefault;
    int? maxLength;
    int? minLength;
    List<List<dynamic>>? choices;
    bool? readOnly;
    bool? rangeFilter;
    int? maxDigits;
    int? decimalPlaces;

    Age({
        this.type,
        this.required,
        this.showInView,
        this.showInReport,
        this.showInEdit,
        this.showInFilter,
        this.showInList,
        this.showInAdd,
        this.ageDefault,
        this.maxLength,
        this.minLength,
        this.choices,
        this.readOnly,
        this.rangeFilter,
        this.maxDigits,
        this.decimalPlaces,
    });

    factory Age.fromJson(Map<String, dynamic> json) => Age(
        type: json["type"],
        required: json["required"],
        showInView: json["show_in_view"],
        showInReport: json["show_in_report"],
        showInEdit: json["show_in_edit"],
        showInFilter: json["show_in_filter"],
        showInList: json["show_in_list"],
        showInAdd: json["show_in_add"],
        ageDefault: json["default"],
        maxLength: json["max_length"],
        minLength: json["min_length"],
        choices: json["choices"] == null ? [] : List<List<dynamic>>.from(json["choices"]!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        readOnly: json["read_only"],
        rangeFilter: json["range_filter"],
        maxDigits: json["max_digits"],
        decimalPlaces: json["decimal_places"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "required": required,
        "show_in_view": showInView,
        "show_in_report": showInReport,
        "show_in_edit": showInEdit,
        "show_in_filter": showInFilter,
        "show_in_list": showInList,
        "show_in_add": showInAdd,
        "default": ageDefault,
        "max_length": maxLength,
        "min_length": minLength,
        "choices": choices == null ? [] : List<dynamic>.from(choices!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "read_only": readOnly,
        "range_filter": rangeFilter,
        "max_digits": maxDigits,
        "decimal_places": decimalPlaces,
    };
}

class Createdby {
    String? type;
    String? to;
    List<String>? readFields;
    FilterData? filterData;
    bool? required;
    String? relatedName;
    bool? showInView;
    bool? showInReport;
    bool? showInEdit;
    bool? showInFilter;
    bool? showInList;
    bool? showInAdd;
    bool? multipleFilter;

    Createdby({
        this.type,
        this.to,
        this.readFields,
        this.filterData,
        this.required,
        this.relatedName,
        this.showInView,
        this.showInReport,
        this.showInEdit,
        this.showInFilter,
        this.showInList,
        this.showInAdd,
        this.multipleFilter,
    });

    factory Createdby.fromJson(Map<String, dynamic> json) => Createdby(
        type: json["type"],
        to: json["to"],
        readFields: json["read_fields"] == null ? [] : List<String>.from(json["read_fields"]!.map((x) => x)),
        filterData: json["filter_data"] == null ? null : FilterData.fromJson(json["filter_data"]),
        required: json["required"],
        relatedName: json["related_name"],
        showInView: json["show_in_view"],
        showInReport: json["show_in_report"],
        showInEdit: json["show_in_edit"],
        showInFilter: json["show_in_filter"],
        showInList: json["show_in_list"],
        showInAdd: json["show_in_add"],
        multipleFilter: json["multiple_filter"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "to": to,
        "read_fields": readFields == null ? [] : List<dynamic>.from(readFields!.map((x) => x)),
        "filter_data": filterData?.toJson(),
        "required": required,
        "related_name": relatedName,
        "show_in_view": showInView,
        "show_in_report": showInReport,
        "show_in_edit": showInEdit,
        "show_in_filter": showInFilter,
        "show_in_list": showInList,
        "show_in_add": showInAdd,
        "multiple_filter": multipleFilter,
    };
}

class FilterData {
    FilterData();

    factory FilterData.fromJson(Map<String, dynamic> json) => FilterData(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Items {
    String? type;
    ItemsFields? fields;

    Items({
        this.type,
        this.fields,
    });

    factory Items.fromJson(Map<String, dynamic> json) => Items(
        type: json["type"],
        fields: json["fields"] == null ? null : ItemsFields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "fields": fields?.toJson(),
    };
}

class ItemsFields {
    Age? name;
    Age? description;
    Age? gender;
    Age? age;
    Age? datetime;
    Age? date;
    Age? time;
    Age? duration;
    Age? radius;
    Createdby? groups;
    Createdby? grp;
    Createdby? createdby;
    Createdby? modifiedby;
    Age? isDeleted;

    ItemsFields({
        this.name,
        this.description,
        this.gender,
        this.age,
        this.datetime,
        this.date,
        this.time,
        this.duration,
        this.radius,
        this.groups,
        this.grp,
        this.createdby,
        this.modifiedby,
        this.isDeleted,
    });

    factory ItemsFields.fromJson(Map<String, dynamic> json) => ItemsFields(
        name: json["name"] == null ? null : Age.fromJson(json["name"]),
        description: json["description"] == null ? null : Age.fromJson(json["description"]),
        gender: json["gender"] == null ? null : Age.fromJson(json["gender"]),
        age: json["age"] == null ? null : Age.fromJson(json["age"]),
        datetime: json["datetime"] == null ? null : Age.fromJson(json["datetime"]),
        date: json["date"] == null ? null : Age.fromJson(json["date"]),
        time: json["time"] == null ? null : Age.fromJson(json["time"]),
        duration: json["duration"] == null ? null : Age.fromJson(json["duration"]),
        radius: json["radius"] == null ? null : Age.fromJson(json["radius"]),
        groups: json["groups"] == null ? null : Createdby.fromJson(json["groups"]),
        grp: json["grp"] == null ? null : Createdby.fromJson(json["grp"]),
        createdby: json["createdby"] == null ? null : Createdby.fromJson(json["createdby"]),
        modifiedby: json["modifiedby"] == null ? null : Createdby.fromJson(json["modifiedby"]),
        isDeleted: json["is_deleted"] == null ? null : Age.fromJson(json["is_deleted"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "description": description?.toJson(),
        "gender": gender?.toJson(),
        "age": age?.toJson(),
        "datetime": datetime?.toJson(),
        "date": date?.toJson(),
        "time": time?.toJson(),
        "duration": duration?.toJson(),
        "radius": radius?.toJson(),
        "groups": groups?.toJson(),
        "grp": grp?.toJson(),
        "createdby": createdby?.toJson(),
        "modifiedby": modifiedby?.toJson(),
        "is_deleted": isDeleted?.toJson(),
    };
}
