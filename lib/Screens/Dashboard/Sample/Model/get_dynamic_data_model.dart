// // To parse this JSON data, do
// //
// //     final getDynamicList = getDynamicListFromJson(jsonString);

// import 'dart:convert';

// GetDynamicList getDynamicListFromJson(String str) => GetDynamicList.fromJson(json.decode(str));

// String getDynamicListToJson(GetDynamicList data) => json.encode(data.toJson());

// class GetDynamicList {
//     int? count;
//     List<GetDynamicData>? results;

//     GetDynamicList({
//         this.count,
//         this.results,
//     });

//     factory GetDynamicList.fromJson(Map<String, dynamic> json) => GetDynamicList(
//         count: json["count"],
//         results: json["results"] == null ? [] : List<GetDynamicData>.from(json["results"]!.map((x) => GetDynamicData.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "count": count,
//         "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
//     };
// }

// class GetDynamicData {
//     int? id;
//     String? appLabel;
//     String? modelName;
//     Fields? fields;

//     GetDynamicData({
//         this.id,
//         this.appLabel,
//         this.modelName,
//         this.fields,
//     });

//     factory GetDynamicData.fromJson(Map<String, dynamic> json) => GetDynamicData(
//         id: json["id"],
//         appLabel: json["app_label"],
//         modelName: json["model_name"],
//         fields: json["fields"] == null ? null : Fields.fromJson(json["fields"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "app_label": appLabel,
//         "model_name": modelName,
//         "fields": fields?.toJson(),
//     };
// }

// class Fields {
//   final CharField? char;
//   final TextField? text;
//   final ChoiceField? choice;
//   final IntegerField? integer;
//   final DateTimeField? dateTime;
//   final DateField? date;
//   final TimeField? time;
//   final DurationField? duration;
//   final DecimalField? decimal;
//   final ForeignKeyField? foreignKey;
//   final BooleanField? boolean;

//   Fields({
//     this.char,
//     this.text,
//     this.choice,
//     this.integer,
//     this.dateTime,
//     this.date,
//     this.time,
//     this.duration,
//     this.decimal,
//     this.foreignKey,
//     this.boolean,
//   });

//   factory Fields.fromJson(Map<String, dynamic> json) => Fields(
//         char: json["Char"] == null ? null : CharField.fromJson(json["Char"]),
//         text: json["Text"] == null ? null : TextField.fromJson(json["Text"]),
//         choice: json["Choice"] == null ? null : ChoiceField.fromJson(json["Choice"]),
//         integer: json["Integer"] == null ? null : IntegerField.fromJson(json["Integer"]),
//         dateTime: json["DateTime"] == null ? null : DateTimeField.fromJson(json["DateTime"]),
//         date: json["Date"] == null ? null : DateField.fromJson(json["Date"]),
//         time: json["Time"] == null ? null : TimeField.fromJson(json["Time"]),
//         duration: json["Duration"] == null ? null : DurationField.fromJson(json["Duration"]),
//         decimal: json["Decimal"] == null ? null : DecimalField.fromJson(json["Decimal"]),
//         foreignKey: json["ForeignKey"] == null ? null : ForeignKeyField.fromJson(json["ForeignKey"]),
//         boolean: json["Boolean"] == null ? null : BooleanField.fromJson(json["Boolean"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "Char": char?.toJson(),
//         "Text": text?.toJson(),
//         "Choice": choice?.toJson(),
//         "Integer": integer?.toJson(),
//         "DateTime": dateTime?.toJson(),
//         "Date": date?.toJson(),
//         "Time": time?.toJson(),
//         "Duration": duration?.toJson(),
//         "Decimal": decimal?.toJson(),
//         "ForeignKey": foreignKey?.toJson(),
//         "Boolean": boolean?.toJson(),
//       };
// }

// class BaseField {
//   final String type;
//   final bool required;
//   final bool showInView;
//   final bool showInReport;
//   final bool showInEdit;
//   final bool showInFilter;
//   final bool showInList;
//   final bool showInAdd;

//   BaseField({
//     required this.type,
//     required this.required,
//     required this.showInView,
//     required this.showInReport,
//     required this.showInEdit,
//     required this.showInFilter,
//     required this.showInList,
//     required this.showInAdd,
//   });

//   factory BaseField.fromJson(Map<String, dynamic> json) => BaseField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//       );

//   Map<String, dynamic> toJson() => {
//         "type": type,
//         "required": required,
//         "show_in_view": showInView,
//         "show_in_report": showInReport,
//         "show_in_edit": showInEdit,
//         "show_in_filter": showInFilter,
//         "show_in_list": showInList,
//         "show_in_add": showInAdd,
//       };
// }

// class CharField extends BaseField {
//   final int maxLength;
//   final int minLength;

//   CharField({
//     required super.type,
//     required super.required,
//     required super.showInView,
//     required super.showInReport,
//     required super.showInEdit,
//     required super.showInFilter,
//     required super.showInList,
//     required super.showInAdd,
//     required this.maxLength,
//     required this.minLength,
//   });

//   factory CharField.fromJson(Map<String, dynamic> json) => CharField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//         maxLength: json["max_length"] ?? 0,
//         minLength: json["min_length"] ?? 0,
//       );

//   @override
//   Map<String, dynamic> toJson() => {
//         ...super.toJson(),
//         "max_length": maxLength,
//         "min_length": minLength,
//       };
// }

// class TextField extends BaseField {
//   final int maxLength;
//   final int minLength;

//   TextField({
//     required super.type,
//     required super.required,
//     required super.showInView,
//     required super.showInReport,
//     required super.showInEdit,
//     required super.showInFilter,
//     required super.showInList,
//     required super.showInAdd,
//     required this.maxLength,
//     required this.minLength,
//   });

//   factory TextField.fromJson(Map<String, dynamic> json) => TextField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//         maxLength: json["max_length"] ?? 0,
//         minLength: json["min_length"] ?? 0,
//       );

//   @override
//   Map<String, dynamic> toJson() => {
//         ...super.toJson(),
//         "max_length": maxLength,
//         "min_length": minLength,
//       };
// }

// class ChoiceField extends BaseField {
//   final int defaultValue;
//   final List<List<dynamic>> choices;

//   ChoiceField({
//     required super.type,
//     required super.required,
//     required super.showInView,
//     required super.showInReport,
//     required super.showInEdit,
//     required super.showInFilter,
//     required super.showInList,
//     required super.showInAdd,
//     required this.defaultValue,
//     required this.choices,
//   });

//   factory ChoiceField.fromJson(Map<String, dynamic> json) => ChoiceField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//         defaultValue: json["default"] ?? 0,
//         choices: List<List<dynamic>>.from(json["choices"]?.map((x) => List<dynamic>.from(x.map((x) => x))) ?? []),
//       );

//   @override
//   Map<String, dynamic> toJson() => {
//         ...super.toJson(),
//         "default": defaultValue,
//         "choices": List<dynamic>.from(choices.map((x) => List<dynamic>.from(x.map((x) => x)))),
//       };
// }

// class IntegerField extends BaseField {
//   final int defaultValue;

//   IntegerField({
//     required super.type,
//     required super.required,
//     required super.showInView,
//     required super.showInReport,
//     required super.showInEdit,
//     required super.showInFilter,
//     required super.showInList,
//     required super.showInAdd,
//     required this.defaultValue,
//   });

//   factory IntegerField.fromJson(Map<String, dynamic> json) => IntegerField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//         defaultValue: json["default"] ?? 0,
//       );

//   @override
//   Map<String, dynamic> toJson() => {
//         ...super.toJson(),
//         "default": defaultValue,
//       };
// }

// class DateTimeField extends BaseField {
//   final bool readOnly;
//   final bool rangeFilter;

//   DateTimeField({
//     required super.type,
//     required super.required,
//     required super.showInView,
//     required super.showInReport,
//     required super.showInEdit,
//     required super.showInFilter,
//     required super.showInList,
//     required super.showInAdd,
//     required this.readOnly,
//     required this.rangeFilter,
//   });

//   factory DateTimeField.fromJson(Map<String, dynamic> json) => DateTimeField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//         readOnly: json["read_only"] ?? false,
//         rangeFilter: json["range_filter"] ?? false,
//       );

//   @override
//   Map<String, dynamic> toJson() => {
//         ...super.toJson(),
//         "read_only": readOnly,
//         "range_filter": rangeFilter,
//       };
// }

// class DateField extends DateTimeField {
//   DateField({
//     required super.type,
//     required super.required,
//     required super.showInView,
//     required super.showInReport,
//     required super.showInEdit,
//     required super.showInFilter,
//     required super.showInList,
//     required super.showInAdd,
//     required super.readOnly,
//     required super.rangeFilter,
//   });

//   factory DateField.fromJson(Map<String, dynamic> json) => DateField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//         readOnly: json["read_only"] ?? false,
//         rangeFilter: json["range_filter"] ?? false,
//       );
// }

// class TimeField extends BaseField {
//   final bool readOnly;

//   TimeField({
//     required super.type,
//     required super.required,
//     required super.showInView,
//     required super.showInReport,
//     required super.showInEdit,
//     required super.showInFilter,
//     required super.showInList,
//     required super.showInAdd,
//     required this.readOnly,
//   });

//   factory TimeField.fromJson(Map<String, dynamic> json) => TimeField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//         readOnly: json["read_only"] ?? false,
//       );

//   @override
//   Map<String, dynamic> toJson() => {
//         ...super.toJson(),
//         "read_only": readOnly,
//       };
// }

// class DurationField extends BaseField {
//   final bool readOnly;

//   DurationField({
//     required super.type,
//     required super.required,
//     required super.showInView,
//     required super.showInReport,
//     required super.showInEdit,
//     required super.showInFilter,
//     required super.showInList,
//     required super.showInAdd,
//     required this.readOnly,
//   });

//   factory DurationField.fromJson(Map<String, dynamic> json) => DurationField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//         readOnly: json["read_only"] ?? false,
//       );

//   @override
//   Map<String, dynamic> toJson() => {
//         ...super.toJson(),
//         "read_only": readOnly,
//       };
// }

// class DecimalField extends BaseField {
//   final int maxDigits;
//   final int decimalPlaces;
//   final int defaultValue;

//   DecimalField({
//     required super.type,
//     required super.required,
//     required super.showInView,
//     required super.showInReport,
//     required super.showInEdit,
//     required super.showInFilter,
//     required super.showInList,
//     required super.showInAdd,
//     required this.maxDigits,
//     required this.decimalPlaces,
//     required this.defaultValue,
//   });

//   factory DecimalField.fromJson(Map<String, dynamic> json) => DecimalField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//         maxDigits: json["max_digits"] ?? 0,
//         decimalPlaces: json["decimal_places"] ?? 0,
//         defaultValue: json["default"] ?? 0,
//       );

// @override
//   Map<String, dynamic> toJson() => {
//         ...super.toJson(),
//         "max_digits": maxDigits,
//         "decimal_places": decimalPlaces,
//         "default": defaultValue,
//       };
// }

// class ForeignKeyField extends BaseField {
//   final String to;
//   final List<String> readFields;
//   final Map<String, dynamic> filterData;
//   final String relatedName;
//   final List<String> importFields;
//   final List<String> exportFields;

//   ForeignKeyField({
//     required super.type,
//     required super.required,
//     required super.showInView,
//     required super.showInReport,
//     required super.showInEdit,
//     required super.showInFilter,
//     required super.showInList,
//     required super.showInAdd,
//     required this.to,
//     required this.readFields,
//     required this.filterData,
//     required this.relatedName,
//     required this.importFields,
//     required this.exportFields,
//   });

//   factory ForeignKeyField.fromJson(Map<String, dynamic> json) => ForeignKeyField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//         to: json["to"] ?? "",
//         readFields: List<String>.from(json["read_fields"] ?? []),
//         filterData: json["filter_data"] ?? {},
//         relatedName: json["related_name"] ?? "",
//         importFields: List<String>.from(json["import_fields"] ?? []),
//         exportFields: List<String>.from(json["export_fields"] ?? []),
//       );

//   @override
//   Map<String, dynamic> toJson() => {
//         ...super.toJson(),
//         "to": to,
//         "read_fields": readFields,
//         "filter_data": filterData,
//         "related_name": relatedName,
//         "import_fields": importFields,
//         "export_fields": exportFields,
//       };
// }

// class BooleanField extends BaseField {
//   final bool defaultValue;

//   BooleanField({
//     required super.type,
//     required super.required,
//     required super.showInView,
//     required super.showInReport,
//     required super.showInEdit,
//     required super.showInFilter,
//     required super.showInList,
//     required super.showInAdd,
//     required this.defaultValue,
//   });

//   factory BooleanField.fromJson(Map<String, dynamic> json) => BooleanField(
//         type: json["type"] ?? "",
//         required: json["required"] ?? false,
//         showInView: json["show_in_view"] ?? false,
//         showInReport: json["show_in_report"] ?? false,
//         showInEdit: json["show_in_edit"] ?? false,
//         showInFilter: json["show_in_filter"] ?? false,
//         showInList: json["show_in_list"] ?? false,
//         showInAdd: json["show_in_add"] ?? false,
//         defaultValue: json["default"] ?? false,
//       );

//   @override
//   Map<String, dynamic> toJson() => {
//         ...super.toJson(),
//         "default": defaultValue,
//       };
// }






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
    Abso? cdscfd;
    Abso? character;
    Abso? text;
    Abso? choice;
    Assad? integer;
    Abso? dateTime;
    Abso? date;
    Abso? time;
    Abso? duration;
    Abso? decimal;
    ForeignKey? manyToMany;
    ForeignKey? foreignKey;
    Abso? boolean;
    Abso? children;
    Abso? fieldsData;
    Abso? fgv;
    Abso? abso;
    Abso? adsasd;
    Abso? casdf;
    Abso? fgDsf;
    Absolin? team;
    Absolin? sad;
    Absolin? huffy;
    Abso? items;
    Abso? dropdown;
    Absolin? fgfdg;
    Absolin? absolin;
    Assad? assad;
    Assad? assadS;
    Assad? asdasa;
    Assad? sdf;
    Assad? dfgfdg;
    Assad? dfgdfgdfgdfgdfg;
    Assad? dodd;
    Assad? asdfsfd;
    Assad? adds;
    Assad? dfdsfd;
    Assad? sdfds;
    Assad? ghddfg;
    Assad? fdsfdsfsdff;
    Assad? asdasdad;
    Assad? dfgdfgfd;
    Assad? heheh;
    Assad? fdsfsd;
    Assad? safdar;

    ResultFields({
        this.cdscfd,
        this.character,
        this.text,
        this.choice,
        this.integer,
        this.dateTime,
        this.date,
        this.time,
        this.duration,
        this.decimal,
        this.manyToMany,
        this.foreignKey,
        this.boolean,
        this.children,
        this.fieldsData,
        this.fgv,
        this.abso,
        this.adsasd,
        this.casdf,
        this.fgDsf,
        this.team,
        this.sad,
        this.huffy,
        this.items,
        this.dropdown,
        this.fgfdg,
        this.absolin,
        this.assad,
        this.assadS,
        this.asdasa,
        this.sdf,
        this.dfgfdg,
        this.dfgdfgdfgdfgdfg,
        this.dodd,
        this.asdfsfd,
        this.adds,
        this.dfdsfd,
        this.sdfds,
        this.ghddfg,
        this.fdsfdsfsdff,
        this.asdasdad,
        this.dfgdfgfd,
        this.heheh,
        this.fdsfsd,
        this.safdar,
    });

    factory ResultFields.fromJson(Map<String, dynamic> json) => ResultFields(
        cdscfd: json["cdscfd"] == null ? null : Abso.fromJson(json["cdscfd"]),
        character: json["Character"] == null ? null : Abso.fromJson(json["Character"]),
        text: json["Text"] == null ? null : Abso.fromJson(json["Text"]),
        choice: json["Choice"] == null ? null : Abso.fromJson(json["Choice"]),
        integer: json["Integer"] == null ? null : Assad.fromJson(json["Integer"]),
        dateTime: json["DateTime"] == null ? null : Abso.fromJson(json["DateTime"]),
        date: json["Date"] == null ? null : Abso.fromJson(json["Date"]),
        time: json["Time"] == null ? null : Abso.fromJson(json["Time"]),
        duration: json["Duration"] == null ? null : Abso.fromJson(json["Duration"]),
        decimal: json["Decimal"] == null ? null : Abso.fromJson(json["Decimal"]),
        manyToMany: json["ManyToMany"] == null ? null : ForeignKey.fromJson(json["ManyToMany"]),
        foreignKey: json["ForeignKey"] == null ? null : ForeignKey.fromJson(json["ForeignKey"]),
        boolean: json["Boolean"] == null ? null : Abso.fromJson(json["Boolean"]),
        children: json["Children"] == null ? null : Abso.fromJson(json["Children"]),
        fieldsData: json["Fields Data"] == null ? null : Abso.fromJson(json["Fields Data"]),
        fgv: json["fgv"] == null ? null : Abso.fromJson(json["fgv"]),
        abso: json["Abso"] == null ? null : Abso.fromJson(json["Abso"]),
        adsasd: json["adsasd"] == null ? null : Abso.fromJson(json["adsasd"]),
        casdf: json["casdf"] == null ? null : Abso.fromJson(json["casdf"]),
        fgDsf: json["fg dsf"] == null ? null : Abso.fromJson(json["fg dsf"]),
        team: json["Team"] == null ? null : Absolin.fromJson(json["Team"]),
        sad: json["sad"] == null ? null : Absolin.fromJson(json["sad"]),
        huffy: json["huffy"] == null ? null : Absolin.fromJson(json["huffy"]),
        items: json["items"] == null ? null : Abso.fromJson(json["items"]),
        dropdown: json["Dropdown"] == null ? null : Abso.fromJson(json["Dropdown"]),
        fgfdg: json["fgfdg"] == null ? null : Absolin.fromJson(json["fgfdg"]),
        absolin: json["Absolin"] == null ? null : Absolin.fromJson(json["Absolin"]),
        assad: json["Assad"] == null ? null : Assad.fromJson(json["Assad"]),
        assadS: json["Assad’s"] == null ? null : Assad.fromJson(json["Assad’s"]),
        asdasa: json["asdasa"] == null ? null : Assad.fromJson(json["asdasa"]),
        sdf: json["sdf"] == null ? null : Assad.fromJson(json["sdf"]),
        dfgfdg: json["dfgfdg"] == null ? null : Assad.fromJson(json["dfgfdg"]),
        dfgdfgdfgdfgdfg: json["dfgdfgdfgdfgdfg"] == null ? null : Assad.fromJson(json["dfgdfgdfgdfgdfg"]),
        dodd: json["Dodd"] == null ? null : Assad.fromJson(json["Dodd"]),
        asdfsfd: json["asdfsfd"] == null ? null : Assad.fromJson(json["asdfsfd"]),
        adds: json["adds"] == null ? null : Assad.fromJson(json["adds"]),
        dfdsfd: json["dfdsfd"] == null ? null : Assad.fromJson(json["dfdsfd"]),
        sdfds: json["sdfds"] == null ? null : Assad.fromJson(json["sdfds"]),
        ghddfg: json["ghddfg"] == null ? null : Assad.fromJson(json["ghddfg"]),
        fdsfdsfsdff: json["fdsfdsfsdff"] == null ? null : Assad.fromJson(json["fdsfdsfsdff"]),
        asdasdad: json["asdasdad"] == null ? null : Assad.fromJson(json["asdasdad"]),
        dfgdfgfd: json["dfgdfgfd"] == null ? null : Assad.fromJson(json["dfgdfgfd"]),
        heheh: json["heheh"] == null ? null : Assad.fromJson(json["heheh"]),
        fdsfsd: json["fdsfsd"] == null ? null : Assad.fromJson(json["fdsfsd"]),
        safdar: json["safdar"] == null ? null : Assad.fromJson(json["safdar"]),
    );

    Map<String, dynamic> toJson() => {
        "cdscfd": cdscfd?.toJson(),
        "Character": character?.toJson(),
        "Text": text?.toJson(),
        "Choice": choice?.toJson(),
        "Integer": integer?.toJson(),
        "DateTime": dateTime?.toJson(),
        "Date": date?.toJson(),
        "Time": time?.toJson(),
        "Duration": duration?.toJson(),
        "Decimal": decimal?.toJson(),
        "ManyToMany": manyToMany?.toJson(),
        "ForeignKey": foreignKey?.toJson(),
        "Boolean": boolean?.toJson(),
        "Children": children?.toJson(),
        "Fields Data": fieldsData?.toJson(),
        "fgv": fgv?.toJson(),
        "Abso": abso?.toJson(),
        "adsasd": adsasd?.toJson(),
        "casdf": casdf?.toJson(),
        "fg dsf": fgDsf?.toJson(),
        "Team": team?.toJson(),
        "sad": sad?.toJson(),
        "huffy": huffy?.toJson(),
        "items": items?.toJson(),
        "Dropdown": dropdown?.toJson(),
        "fgfdg": fgfdg?.toJson(),
        "Absolin": absolin?.toJson(),
        "Assad": assad?.toJson(),
        "Assad’s": assadS?.toJson(),
        "asdasa": asdasa?.toJson(),
        "sdf": sdf?.toJson(),
        "dfgfdg": dfgfdg?.toJson(),
        "dfgdfgdfgdfgdfg": dfgdfgdfgdfgdfg?.toJson(),
        "Dodd": dodd?.toJson(),
        "asdfsfd": asdfsfd?.toJson(),
        "adds": adds?.toJson(),
        "dfdsfd": dfdsfd?.toJson(),
        "sdfds": sdfds?.toJson(),
        "ghddfg": ghddfg?.toJson(),
        "fdsfdsfsdff": fdsfdsfsdff?.toJson(),
        "asdasdad": asdasdad?.toJson(),
        "dfgdfgfd": dfgdfgfd?.toJson(),
        "heheh": heheh?.toJson(),
        "fdsfsd": fdsfsd?.toJson(),
        "safdar": safdar?.toJson(),
    };
}

class Abso {
    String? type;
    bool? required;
    bool? showInView;
    bool? showInReport;
    bool? showInEdit;
    bool? showInFilter;
    bool? showInList;
    bool? showInAdd;
    dynamic fields;
    dynamic absoDefault;
    int? maxLength;
    int? minLength;
    List<List<dynamic>>? choices;
    bool? readOnly;
    bool? rangeFilter;
    int? maxDigits;
    int? decimalPlaces;

    Abso({
        this.type,
        this.required,
        this.showInView,
        this.showInReport,
        this.showInEdit,
        this.showInFilter,
        this.showInList,
        this.showInAdd,
        this.fields,
        this.absoDefault,
        this.maxLength,
        this.minLength,
        this.choices,
        this.readOnly,
        this.rangeFilter,
        this.maxDigits,
        this.decimalPlaces,
    });

    factory Abso.fromJson(Map<String, dynamic> json) => Abso(
        type: json["type"],
        required: json["required"],
        showInView: json["show_in_view"],
        showInReport: json["show_in_report"],
        showInEdit: json["show_in_edit"],
        showInFilter: json["show_in_filter"],
        showInList: json["show_in_list"],
        showInAdd: json["show_in_add"],
        fields: json["fields"],
        absoDefault: json["default"],
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
        "fields": fields,
        "default": absoDefault,
        "max_length": maxLength,
        "min_length": minLength,
        "choices": choices == null ? [] : List<dynamic>.from(choices!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "read_only": readOnly,
        "range_filter": rangeFilter,
        "max_digits": maxDigits,
        "decimal_places": decimalPlaces,
    };
}

class FilterDataClass {
    FilterDataClass();

    factory FilterDataClass.fromJson(Map<String, dynamic> json) => FilterDataClass(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Absolin {
    String? type;
    String? fields;

    Absolin({
        this.type,
        this.fields,
    });

    factory Absolin.fromJson(Map<String, dynamic> json) => Absolin(
        type: json["type"],
        fields: json["fields"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "fields": fields,
    };
}

class Assad {
    String? type;
    bool? required;
    bool? rangeFilter;
    bool? showInView;
    bool? showInReport;
    bool? showInEdit;
    bool? showInFilter;
    bool? showInList;
    bool? showInAdd;
    int? assadDefault;
    List<List<dynamic>>? choices;
    int? maxLength;
    int? minLength;

    Assad({
        this.type,
        this.required,
        this.rangeFilter,
        this.showInView,
        this.showInReport,
        this.showInEdit,
        this.showInFilter,
        this.showInList,
        this.showInAdd,
        this.assadDefault,
        this.choices,
        this.maxLength,
        this.minLength,
    });

    factory Assad.fromJson(Map<String, dynamic> json) => Assad(
        type: json["type"],
        required: json["required"],
        rangeFilter: json["range_filter"],
        showInView: json["show_in_view"],
        showInReport: json["show_in_report"],
        showInEdit: json["show_in_edit"],
        showInFilter: json["show_in_filter"],
        showInList: json["show_in_list"],
        showInAdd: json["show_in_add"],
        assadDefault: json["default"],
        choices: json["choices"] == null ? [] : List<List<dynamic>>.from(json["choices"]!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        maxLength: json["max_length"],
        minLength: json["min_length"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "required": required,
        "range_filter": rangeFilter,
        "show_in_view": showInView,
        "show_in_report": showInReport,
        "show_in_edit": showInEdit,
        "show_in_filter": showInFilter,
        "show_in_list": showInList,
        "show_in_add": showInAdd,
        "default": assadDefault,
        "choices": choices == null ? [] : List<dynamic>.from(choices!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "max_length": maxLength,
        "min_length": minLength,
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
    FilterDataClass? filterData;
    String? relatedName;
    List<String>? importFields;
    List<String>? exportFields;
    bool? multipleFilter;

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
        this.multipleFilter,
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
        filterData: json["filter_data"] == null ? null : FilterDataClass.fromJson(json["filter_data"]),
        relatedName: json["related_name"],
        importFields: json["import_fields"] == null ? [] : List<String>.from(json["import_fields"]!.map((x) => x)),
        exportFields: json["export_fields"] == null ? [] : List<String>.from(json["export_fields"]!.map((x) => x)),
        multipleFilter: json["multiple_filter"],
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
        "multiple_filter": multipleFilter,
    };
}
