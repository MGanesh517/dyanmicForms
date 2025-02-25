
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvancedFilterController extends GetxController {
  var filters = FilterNode();
  var isRequired = false.obs;
  void updateReportOnly(bool value) => isRequired.value = value;
  RxString selectedVariable = ''.obs;
  RxString selectedDataType = ''.obs;

  void clearFilters() {
    filters = FilterNode();
    update();
  }

  // final Map<String, String> mixedValues = {
  //   'Name': 'string',
  //   'Age': 'int',
  //   'Decimal': 'float',
  //   'Boolean': 'bool',
  //   'Gender': 'choices',
  //   'Groups': 'foreignkey'
  // };
//   List<MapEntry<String, String>> getFilteredMixedValues(String operator) {
//   if (!operatorDataTypes.containsKey(operator)) {
//     return [];
//   }
//   Set<String> allowedTypes = operatorDataTypes[operator]!;
//   return mixedValues.entries
//       .where((entry) => allowedTypes.contains(entry.value))
//       .toList();
// }
// static final Map<String, Set<String>> operatorDataTypes = {
//   'EQ': {'str', 'int', 'float', 'bool', 'null'},
//   'NEQ': {'str', 'int', 'float', 'bool', 'null'},
//   'GT': {'int', 'float', 'str'},
//   'GTE': {'int', 'float', 'str'},
//   'LT': {'int', 'float', 'str'},
//   'LTE': {'int', 'float', 'str'},
//   'CONTAINS': {'str'},
//   'ICONTAINS': {'str'},
//   'STARTSWITH': {'str'},
//   'ISTARTSWITH': {'str'},
//   'ENDSWITH': {'str'},
//   'IENDSWITH': {'str'},
//   'REGEX': {'str'},
//   'IREGEX': {'str'},
//   'YEAR': {'int'},
//   'MONTH': {'int'},
//   'DAY': {'int'},
//   'WEEK_DAY': {'int'},
//   'HOUR': {'int'},
//   'MINUTE': {'int'},
//   'SECOND': {'int'},
//   'ISNULL': {'bool'},
// };
// String getValueType(dynamic value) {
//   if (value == null) return 'null';
//   if (value is int) return 'int';
//   if (value is double) return 'float';
//   if (value is String) return 'str';
//   if (value is bool) return 'bool';
//   return 'unknown';
// }
// String fieldConditions(String operator, dynamic value) {
//   String valueType = getValueType(value);
//   if (operatorDataTypes.containsKey(operator) &&
//       operatorDataTypes[operator]!.contains(valueType)) {
//     return valueType;
//   }
//   return 'unknown';
// }


  // List<MapEntry<String, String>> getFilteredMixedValues(String operator) {
  //   switch (operator) {
  //     case 'EQ':
  //     case 'NEQ':
  //       // return mixedValues.entries.toList();
  //       return mixedValues
  //           .where((e) => e['data_type'] == 'int' || e['data_type'] == 'float' || e['data_type'] == 'str' || e['data_type'] == 'bool')
  //           .map((e) => MapEntry(e['verbose_name'] as String, e['data_type'] as String))
  //           .toList();
  //     case 'GT':
  //     case 'GTE':
  //     case 'LT':
  //     case 'LTE':
  //       return mixedValues
  //           .where((e) => e['data_type'] == 'int' || e['data_type'] == 'float' || e['data_type'] == 'str')
  //           .map((e) => MapEntry(e['verbose_name'] as String, e['data_type'] as String))
  //           .toList();
  //     case 'CONTAINS':
  //     case 'ICONTAINS':
  //     case 'STARTSWITH':
  //     case 'ISTARTSWITH':
  //     case 'ENDSWITH':
  //     case 'DATE':
  //     case 'IENDSWITH':
  //     case 'REGEX':
  //     case 'IREGEX':
  //       return mixedValues
  //           .where((e) => e['data_type'] == 'str')
  //           .map((e) => MapEntry(e['verbose_name'] as String, e['data_type'] as String))
  //           .toList();
  //     // case 'IN':
  //     // case 'NOT_IN':
  //     // case 'CONTAINED_BY':
  //     // case 'CONTAINS_ANY':
  //     // case 'RANGE':
  //     //   return mixedValues.entries
  //     //       .where((e) => e.value == 'choices' || e.value == 'foreignkey')
  //     //       .toList();
  //     case 'YEAR':
  //     case 'MONTH':
  //     case 'DAY':
  //     case 'WEEK_DAY':
  //     case 'HOUR':
  //     case 'MINUTE':
  //     case 'SECOND':
  //       return mixedValues
  //           .where((e) => e['data_type'] == 'int')
  //           .map((e) => MapEntry(e['verbose_name'] as String, e['data_type'] as String))
  //           .toList();
  //     case 'ISNULL':
  //       return mixedValues
  //           .where((e) => e['data_type'] == 'bool')
  //           .map((e) => MapEntry(e['verbose_name'] as String, e['data_type'] as String))
  //           .toList();
  //     default:
  //       return [];
  //   }
  // }

// @override
//   void onClose() {
//     appLabel.dispose();
//     fieldNameController.dispose();
//     maxLengthController.dispose();
//     relatedNameController.dispose();
//     minLengthController.dispose();
//     maxDigitsController.dispose();
//     decimalPlacesController.dispose();
//     choiceController.dispose();
//     // modelName.removeListener(validateModelNameRealTime);
//     modelName.dispose();
//     super.onClose();
//   }

  final List<Map<String, Object>>  mixedValues = [
    {
          "name": "productioninitems",
          "verbose_name": "",
          "data_type": "ForeignKey",
          "concrete": false,
          "editable": false,
          "null": true,
          "INS": "ManyToOneRel",
          "related_model": {
              "app_name": "Production",
              "model_name": "productioninitem",
              "verbose_name": "Production In Item",
              "fields": []
          }
      },
      {
          "name": "productionout",
          "verbose_name": "",
          "data_type": "ForeignKey",
          "concrete": false,
          "editable": false,
          "null": true,
          "INS": "ManyToOneRel",
          "related_model": {
              "app_name": "Production",
              "model_name": "productionout",
              "verbose_name": "Production Out",
              "fields": []
          }
      },
      {
          "name": "id",
          "verbose_name": "Id",
          "data_type": "UUIDField",
          "concrete": true,
          "editable": false,
          "null": false,
          "INS": "UUIDField"
      },
      {
          "name": "erp_id",
          "verbose_name": "Erp Id",
          "data_type": "int",
          "concrete": true,
          "editable": true,
          "null": true,
          "INS": "int"
      },
      {
          "name": "erp_code",
          "verbose_name": "Erp Code",
          "data_type": "string",
          "concrete": true,
          "editable": true,
          "null": true,
          "INS": "string"
      },
      {
          "name": "created_by",
          "verbose_name": "Created By",
          "data_type": "ForeignKey",
          "concrete": true,
          "editable": true,
          "null": true,
          "INS": "ForeignKey",
          "related_model": {
              "app_name": "Users",
              "model_name": "user",
              "verbose_name": "User",
              "fields": []
          }
      },
      {
          "name": "created_on",
          "verbose_name": "Created On",
          "data_type": "DateTimeField",
          "concrete": true,
          "editable": false,
          "null": false,
          "INS": "DateTimeField"
      },
      {
          "name": "modified_by",
          "verbose_name": "Modified By",
          "data_type": "ForeignKey",
          "concrete": true,
          "editable": true,
          "null": true,
          "INS": "ForeignKey",
          "related_model": {
              "app_name": "Users",
              "model_name": "user",
              "verbose_name": "User",
              "fields": []
          }
      },
      {
          "name": "modified_on",
          "verbose_name": "Modified On",
          "data_type": "DateTimeField",
          "concrete": true,
          "editable": false,
          "null": true,
          "INS": "DateTimeField"
      },
      {
          "name": "is_deleted",
          "verbose_name": "Is Deleted",
          "data_type": "bool",
          "concrete": true,
          "editable": true,
          "null": true,
          "INS": "bool"
      },
      {
          "name": "code",
          "verbose_name": "Code",
          "data_type": "string",
          "concrete": true,
          "editable": true,
          "null": false,
          "INS": "string"
      },
      {
          "name": "date",
          "verbose_name": "Date",
          "data_type": "DateField",
          "concrete": true,
          "editable": true,
          "null": true,
          "INS": "DateField"
      },
      {
          "name": "narration",
          "verbose_name": "Narration",
          "data_type": "TextField",
          "concrete": true,
          "editable": true,
          "null": true,
          "INS": "TextField"
      },
      {
          "name": "productiontype",
          "verbose_name": "Productiontype",
          "data_type": "int",
          "concrete": true,
          "editable": true,
          "null": true,
          "INS": "int"
      },
      {
          "name": "location",
          "verbose_name": "Location",
          "data_type": "ForeignKey",
          "concrete": true,
          "editable": true,
          "null": true,
          "INS": "ForeignKey",
          "related_model": {
              "app_name": "Masters",
              "model_name": "location",
              "verbose_name": "Location",
              "fields": []
          }
      },
      {
          "name": "status",
          "verbose_name": "Status",
          "data_type": "int",
          "concrete": true,
          "editable": true,
          "null": true,
          "INS": "int"
      },
      {
          "name": "type",
          "verbose_name": "Type",
          "data_type": "int",
          "concrete": true,
          "editable": true,
          "null": true,
          "INS": "int"
      }
  ];

  // List<MapEntry<String, String>> getFilteredMixedValues(String operator) {
  //   return mixedValues
  //       .where((e) => e['data_type'] == 'int' || e['data_type'] == 'float' || e['data_type'] == 'string' || e['data_type'] == 'bool')
  //       .map((e) {
  //         String name = e['name'] as String;
  //         String verboseName = (e['verbose_name'] as String).isNotEmpty ? e['verbose_name'] as String : name;
  //         return MapEntry(name, verboseName);
  //       })
  //       .toList();
  // }
  List<MapEntry<String, String>> getFilteredMixedValues(String operator) {
  final Map<String, Set<String>> operatorDataTypes = {
    'EQ': {'string', 'int', 'float', 'bool', 'null'},
    'NEQ': {'string', 'int', 'float', 'bool', 'null'},
    'GT': {'int', 'float'},
    'GTE': {'int', 'float'},
    'LT': {'int', 'float'},
    'LTE': {'int', 'float'},
    'CONTAINS': {'string'},
  };

//Checkingthe operator exists
  if (!operatorDataTypes.containsKey(operator)) return [];

  return mixedValues
      .where((e) => operatorDataTypes[operator]!.contains(e['data_type']))
      .map((e) {
        String name = e['name'] as String;
        String verboseName = (e['verbose_name'] as String).isNotEmpty ? e['verbose_name'] as String : name;
        return MapEntry(name, verboseName);
      })
      .toList();
}


  String fieldConditionsMap(String operator, dynamic value) {
    final Map<String, Set<Type>> validTypes = {
      'EQ': {String, int, double, bool, Null},
      'NEQ': {String, int, double, bool, Null},
      'GT': {int, double},
      'GTE': {int, double},
      'LT': {int, double},
      'LTE': {int, double},
      'ISNULL': {Null},
    };

//checking operatorexists
  if (validTypes.containsKey(operator)) {
    // Check if the value's type is in the valid set
    for (var type in validTypes[operator]!) {
      if (value == null && type == Null) return 'null';
      if (value.runtimeType == type) {
        return type.toString().toLowerCase();
      }
    }
  }

  return 'unknown';
}

void main() {
  print(fieldConditions('EQ', 'Hello'));  // Output: string
  print(fieldConditions('EQ', 100));      // Output: int
  print(fieldConditions('EQ', 3.14));     // Output: double
  print(fieldConditions('EQ', true));     // Output: bool
  print(fieldConditions('EQ', null));     // Output: null
  print(fieldConditions('GT', 50));       // Output: int
  print(fieldConditions('GT', 2.5));      // Output: double
  print(fieldConditions('GT', 'text'));   // Output: unknown
  print(fieldConditions('ISNULL', null)); // Output: null
}


  String fieldConditions(String operator, dynamic value) {
    if (isFieldConditionOperator(operator) && value is int) {
      return 'int';
    } else if (isFieldConditionOperator(operator) && value is String) {
      return 'string';
    } else if (isFieldConditionOperator(operator) && value is double) {
      return 'float';
    } else if ((operator == 'QE' || operator == 'NEQ' || operator == 'ISNULL') && value is bool) {
      return 'bool';
    }
    return 'unknown';
  }

  bool isFieldConditionOperator(String operator) {
    return ['QE', 'NEQ', 'GT', 'GTE', 'LT', 'LTE'].contains(operator);
  }

  String getValueType(dynamic value) {
    if (value == null) return 'null';
    if (value is int) return 'int';
    if (value is double) return 'float';
    if (value is String) return 'string';
    if (value is bool) return 'bool';
    return 'unknown';
  }

  void updateSelectedVariable(String variable) {
    selectedVariable.value = variable;
    selectedDataType.value = mixedValues.firstWhere((element) => element['name'] == variable)['data_type'] as String;
  }

  final operatorMap = {
    'EQ': '=',
    'NEQ': '!=',
    'GT': '>',
    'GTE': '>=',
    'LT': '<',
    'LTE': '<=',
    'CONTAINS': '%',
    'AND': 'AND',
    'OR': 'OR',
    'NAG': 'NAG'
  };


  final operatorTypes = [
    'AND',
    'OR',
    'NAG',
    'EQ',
    'NEQ',
    'GT',
    'GTE',
    'LT',
    'LTE',
    'CONTAINS',
    'ICONTAINS',
    'STARTSWITH',
    'ISTARTSWITH',
    'ENDSWITH',
    'DATE',
    'IENDSWITH',
    'REGEX',
    'IREGEX',
    'ISNULL',
    'YEAR',
    'MONTH',
    'DAY',
    'WEEK_DAY',
    'HOUR',
    'MINUTE',
    'SECOND'
  ];

  final TextEditingController keyTextField = TextEditingController();
  final TextEditingController valueTextField = TextEditingController();

  final RxBool _submit = false.obs;
  bool get submit => _submit.value;
  set submit(value) => _submit.value = value;

  final RxBool _isRefresh = false.obs;
  bool get isRefresh => _isRefresh.value;
  set isRefresh(value) => _isRefresh.value = value;

  String getOperatorSymbol(String operator) {
    return operatorMap[operator] ?? operator;
  }

  bool isLogicalOperator(String operator) {
    return ['AND', 'OR', 'NAG'].contains(operator);
  }

  bool isConditionFieldsOperator(String operator) {
    return isLogicalOperator(operator) || operator.isEmpty;
  }

  void addFilterNode(FilterNode? parent) {
    final newNode = FilterNode();
    if (parent != null) {
      parent.children.add(newNode);
      update();
    } else {
      filters = newNode;
    }
  }

  void removeFilterNode(FilterNode node, FilterNode? parent) {
    if (parent != null) {
      parent.children.remove(node);
      update();
    }
  }

  Map<String, dynamic> generateQuery(FilterNode node) {
    if (node.operator.value.isEmpty) return {};
    return formatNode(node);
  }

  Map<String, dynamic> formatNode(FilterNode node) {
    if (node.operator.value.isEmpty) return {};

    // NAG operator
    if (node.operator.value == 'NAG') {
      return handleNAGNode(node);
    }
////// Handle comparison operators
    if (!isLogicalOperator(node.operator.value)) {
      return createOperatorNode(node);
    }
// Handle logical operators with children
    if (node.children.isNotEmpty) {
      return createLogicalNode(node);
    }

    return {};
  }

  Map<String, dynamic> createOperatorNode(FilterNode node) {
    return {
      getOperatorSymbol(node.operator.value): {
        "KEY": node.key.value.trim(),
        "VAL": node.value.value.trim(),
      }
    };
  }

  Map<String, dynamic> createLogicalNode(FilterNode node) {
    List<Map<String, dynamic>> childNodes = [];
    
    for (var child in node.children) {
      var formattedChild = formatNode(child);
      if (formattedChild.isNotEmpty) {
        childNodes.add(formattedChild);
      }
    }

    if (childNodes.isEmpty) return {};
    return {node.operator.value: childNodes};
  }

  Map<String, dynamic> handleNAGNode(FilterNode node) {
    // If NAG has children, process the first child only
    if (node.children.isNotEmpty) {
      var child = node.children.first;
      var childNode = formatNode(child);
      if (childNode.isNotEmpty) {
        return {"NAG": childNode};  // Return as object instead of array
      }
    }

    return {
      "NAG": {
        "KEY": node.key.value.trim(),
        "VAL": node.value.value.trim(),
      }
    };
  }

  String getJsonQuery() {
    try {
      return jsonEncode(generateQuery(filters));
    } catch (e) {
      print('Error generating JSON: $e');
      return '{}';
    }
  }
}

class FilterNode {
  RxString dataTypes = ''.obs;
  RxString mixedVal = ''.obs;
  RxString operator = ''.obs;
  RxString key = ''.obs;
  RxString value = ''.obs;
  RxBool isExpanded = true.obs;
  RxList<FilterNode> children = <FilterNode>[].obs;
  RxString dataType = ''.obs;

  static final Map<String, Set<String>> operatorDataTypes = {
    'EQ': {'str', 'int', 'float', 'bool', 'null'},
    // 'EQ': (String, int),
    'NEQ': {'str', 'int', 'float', 'bool', 'null'},
    'GT': {'int', 'float', 'str'},
    'GTE': {'int', 'float', 'str'},
    'LT': {'int', 'float', 'str'},
    'LTE': {'int', 'float', 'str'},
    'CONTAINS': {'str'},
  };

  Map<String, dynamic> toJson() {
    if (operator.value.isEmpty) return {};

    if (operator.value == 'NAG') {
      if (children.isNotEmpty) {
        var child = children.first;
        var childNode = child.toJson();
        if (childNode.isNotEmpty) {
          return {"NAG": childNode}; //// return obj
        }
      }
      return {
        "NAG": {
          "KEY": key.value.trim(),
          "VAL": value.value.trim(),
        }
      };
    }

    if (!isLogicalOperator(operator.value)) {
      return {
        operator.value: {
          "KEY": key.value.trim(),
          "VAL": value.value.trim(),
        }
      };
    }

    if (children.isNotEmpty) {
      List<Map<String, dynamic>> childNodes = children
          .map((child) => child.toJson())
          .where((node) => node.isNotEmpty)
          .toList();
      return childNodes.isEmpty ? {} : {operator.value: childNodes};
    }

    return {};
  }

  bool isLogicalOperator(String operator) {
    return ['AND', 'OR', 'NAG'].contains(operator);
  }
}











// class AdvancedFilterController extends GetxController {
//   final RxString selectedOperator = 'AND'.obs;
//   final RxList<Map<String, dynamic>> filters = <Map<String, dynamic>>[].obs;
//   void updateOperator(String? newValue) {
//     if (newValue != null) {
//       selectedOperator.value = newValue;
//     }
//   }
//   void addFilter() {
//     filters.add({
//       'operator': 'AND',
//       'condition': '',
//       'value': ''
//     });
//   }
// }
// class AdvancedFilterController extends GetxController {
//   var filters = <FilterNode>[].obs;
//   List<String> get operatorTypes => [
//         'AND',
//         'OR',
//         'NAG',
//         'EQ (=)',
//         'NEQ (!=)',
//         'GT (>)',
//         'GTE (>=)',
//         'LT (<)',
//         'LTE (<=)',
//         'CONTAINS'
//       ];
//   void addFilterNode(FilterNode? parent) {
//     final newNode = FilterNode();
//     if (parent == null) {
//       filters.add(newNode);
//     } else {
//       parent.children.add(newNode);
//     }
//   }
//   void removeFilterNode(FilterNode node, FilterNode? parent) {
//     if (parent == null) {
//       filters.remove(node);
//     } else {
//       parent.children.remove(node);
//     }
//   }
// }


// class FilterNode {
//   RxString operator = 'AND'.obs;
//   RxString operator2 = 'OR'.obs;
//   RxString conditionField = ''.obs;
//   RxString conditionValue = ''.obs;
//   RxList<FilterNode> children = <FilterNode>[].obs;
// }
// Map<String, dynamic> generateQuery(List<FilterNode> filters) {
//   if (filters.isEmpty) return {};
//   Map<String, dynamic> query = {};
//   for (var node in filters) {
//     var formattedNode = formatNode(node);
//     if (formattedNode.isNotEmpty) {
//       if (query.containsKey(node.operator.value)) {
//         (query[node.operator.value] as List).add(formattedNode);
//       } else {
//         query[node.operator.value] = [formattedNode];
//       }
//     }
//   }
//   return query;
// }
// Map<String, dynamic> formatNode(FilterNode node) {
//   if (node.children.isNotEmpty) {
//     List<Map<String, dynamic>> childNodes =
//         node.children.map((child) => formatNode(child)).toList();
//     // **Optimization: If only one child exists, remove unnecessary logical operator wrapping**
//     if (childNodes.length == 1 && isLogicalOperator(node.operator.value)) {
//       return childNodes.first;
//     }
//     return {node.operator.value: childNodes};
//   } else if (node.key.value.isNotEmpty) {
//     return {
//       node.operator.value: {
//         "KEY": node.key.value,
//         "VAL": node.value.value,
//       }
//     };
//   }
//   return {};
// }


// createDynamicData() async {
//     submit = true;
//     var postData = {};
//     debugPrint('\n=== Sending Data to API ===');
//     debugPrint('Final Payload: ${json.encode(postData)}');
//     debugPrint('==========================\n');
//     // try {
//     //   var data = await DynamicRepo().createDynamicData(postData);
//     //   closeLoadingDialog();
//     //   if (data != null) {
//     //     Get.back();
//     //     submit = false;
//     //     showSnackBar(
//     //       title: 'Success',
//     //       message: 'Data Submitted Successfully.',
//     //       icon: Icon(Icons.check, color: Colors.green),
//     //     );
//     //     disposeController();
//     //     isRefresh = true;
//     //     // await getDynamicList();
//     //     // Get.toNamed(Routes.listScreen);
//     //   }
//     // } catch (e) {
//     //   submit = false;
//     //   debugPrint("API Error Response: $e");
//     //   closeLoadingDialog();
//     //   showSnackBar(
//     //     title: 'Error',
//     //     message: 'Failed to submit data',
//     //     icon: Icon(Icons.error, color: Colors.red),
//     //   );
//     // }
//   }
// Map<String, dynamic> generateQuery(List<FilterNode> nodes) {
//     if (nodes.isEmpty) return {};
//     // For a single node, format it directly
//     FilterNode node = nodes[0];
//     return formatNode(node);
//   }
// Map<String, dynamic> generateQuery(List<FilterNode> filters) {
//   if (filters.isEmpty) return {};
//   Map<String, dynamic> query = {};
//   for (var node in filters) {
//     if (query.containsKey(node.operator.value)) {
//       (query[node.operator.value] as List).add(formatNode(node));
//     } else {
//       query[node.operator.value] = [formatNode(node)];
//     }
//   }
//   return query;
// }
// Map<String, dynamic> formatNode(FilterNode node) {
//   // Check if the operator is a logical operator
//   if (isLogicalOperator(node.operator.value)) {
//     return {
//       node.operator.value: node.children.map((child) => formatNode(child)).toList(),
//     };
//   } else {
//     return {
//       node.operator.value: {
//         "KEY": node.key.value,
//         "VAL": node.value.value,
//       }
//     };
//   }
// }
