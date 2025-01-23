// To parse this JSON data, do
//
//     final getFieldTypeList = getFieldTypeListFromJson(jsonString);

import 'dart:convert';

GetFieldTypeList getFieldTypeListFromJson(String str) => GetFieldTypeList.fromJson(json.decode(str));

String getFieldTypeListToJson(GetFieldTypeList data) => json.encode(data.toJson());

class GetFieldTypeList {
    Boolean? char;
    Boolean? text;
    Boolean? choice;
    Boolean? integer;
    Boolean? dateTime;
    Boolean? date;
    Boolean? time;
    Boolean? duration;
    Boolean? decimal;
    ForeignKey? foreignKey;
    Boolean? boolean;

    GetFieldTypeList({
        this.char,
        this.text,
        this.choice,
        this.integer,
        this.dateTime,
        this.date,
        this.time,
        this.duration,
        this.decimal,
        this.foreignKey,
        this.boolean,
    });

    factory GetFieldTypeList.fromJson(Map<String, dynamic> json) => GetFieldTypeList(
        char: json["Char"] == null ? null : Boolean.fromJson(json["Char"]),
        text: json["Text"] == null ? null : Boolean.fromJson(json["Text"]),
        choice: json["Choice"] == null ? null : Boolean.fromJson(json["Choice"]),
        integer: json["Integer"] == null ? null : Boolean.fromJson(json["Integer"]),
        dateTime: json["DateTime"] == null ? null : Boolean.fromJson(json["DateTime"]),
        date: json["Date"] == null ? null : Boolean.fromJson(json["Date"]),
        time: json["Time"] == null ? null : Boolean.fromJson(json["Time"]),
        duration: json["Duration"] == null ? null : Boolean.fromJson(json["Duration"]),
        decimal: json["Decimal"] == null ? null : Boolean.fromJson(json["Decimal"]),
        foreignKey: json["ForeignKey"] == null ? null : ForeignKey.fromJson(json["ForeignKey"]),
        boolean: json["Boolean"] == null ? null : Boolean.fromJson(json["Boolean"]),
    );

    Map<String, dynamic> toJson() => {
        "Char": char?.toJson(),
        "Text": text?.toJson(),
        "Choice": choice?.toJson(),
        "Integer": integer?.toJson(),
        "DateTime": dateTime?.toJson(),
        "Date": date?.toJson(),
        "Time": time?.toJson(),
        "Duration": duration?.toJson(),
        "Decimal": decimal?.toJson(),
        "ForeignKey": foreignKey?.toJson(),
        "Boolean": boolean?.toJson(),
    };
}

class Boolean {
    String? type;
    bool? required;
    bool? showInView;
    bool? showInReport;
    bool? showInEdit;
    bool? showInFilter;
    bool? showInList;
    bool? showInAdd;
    dynamic booleanDefault;
    int? maxLength;
    int? minLength;
    List<List<dynamic>>? choices;
    bool? readOnly;
    bool? rangeFilter;
    int? maxDigits;
    int? decimalPlaces;

    Boolean({
        this.type,
        this.required,
        this.showInView,
        this.showInReport,
        this.showInEdit,
        this.showInFilter,
        this.showInList,
        this.showInAdd,
        this.booleanDefault,
        this.maxLength,
        this.minLength,
        this.choices,
        this.readOnly,
        this.rangeFilter,
        this.maxDigits,
        this.decimalPlaces,
    });

    factory Boolean.fromJson(Map<String, dynamic> json) => Boolean(
        type: json["type"],
        required: json["required"],
        showInView: json["show_in_view"],
        showInReport: json["show_in_report"],
        showInEdit: json["show_in_edit"],
        showInFilter: json["show_in_filter"],
        showInList: json["show_in_list"],
        showInAdd: json["show_in_add"],
        booleanDefault: json["default"],
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
        "default": booleanDefault,
        "max_length": maxLength,
        "min_length": minLength,
        "choices": choices == null ? [] : List<dynamic>.from(choices!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "read_only": readOnly,
        "range_filter": rangeFilter,
        "max_digits": maxDigits,
        "decimal_places": decimalPlaces,
    };
}

class ForeignKey {
    String? type;
    bool? required;
    bool? showInView;
    bool? showInReport;
    bool? showInEdit;
    bool? showInFilter;
    bool? showInList;
    bool? showInAdd;
    String? to;
    List<String>? readFields;
    FilterData? filterData;
    String? relatedName;
    List<String>? importFields;
    List<String>? exportFields;

    ForeignKey({
        this.type,
        this.required,
        this.showInView,
        this.showInReport,
        this.showInEdit,
        this.showInFilter,
        this.showInList,
        this.showInAdd,
        this.to,
        this.readFields,
        this.filterData,
        this.relatedName,
        this.importFields,
        this.exportFields,
    });

    factory ForeignKey.fromJson(Map<String, dynamic> json) => ForeignKey(
        type: json["type"],
        required: json["required"],
        showInView: json["show_in_view"],
        showInReport: json["show_in_report"],
        showInEdit: json["show_in_edit"],
        showInFilter: json["show_in_filter"],
        showInList: json["show_in_list"],
        showInAdd: json["show_in_add"],
        to: json["to"],
        readFields: json["read_fields"] == null ? [] : List<String>.from(json["read_fields"]!.map((x) => x)),
        filterData: json["filter_data"] == null ? null : FilterData.fromJson(json["filter_data"]),
        relatedName: json["related_name"],
        importFields: json["import_fields"] == null ? [] : List<String>.from(json["import_fields"]!.map((x) => x)),
        exportFields: json["export_fields"] == null ? [] : List<String>.from(json["export_fields"]!.map((x) => x)),
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
        "to": to,
        "read_fields": readFields == null ? [] : List<dynamic>.from(readFields!.map((x) => x)),
        "filter_data": filterData?.toJson(),
        "related_name": relatedName,
        "import_fields": importFields == null ? [] : List<dynamic>.from(importFields!.map((x) => x)),
        "export_fields": exportFields == null ? [] : List<dynamic>.from(exportFields!.map((x) => x)),
    };
}

class FilterData {
    FilterData();

    factory FilterData.fromJson(Map<String, dynamic> json) => FilterData(
    );

    Map<String, dynamic> toJson() => {
    };
}
