
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvancedFilterController extends GetxController {
  var filters = FilterNode();
  var isRequired = false.obs;
  void updateReportOnly(bool value) => isRequired.value = value;
  
  final Map<String, Set<dynamic>> sampleData = {
    'str': {'Sample Text', 'Another String', 'Test Data'},
    'int': {1, 2, 3, 4, 5},
    'float': {1.5, 2.7, 3.14, 4.2, 5.0},
    'bool': {true, false},
  };
  
  final  mixedValues = {
    123,
    'John Doe',
    true,
    99.99,
    'Sai',
    12512,
    'MAC Ganesh',
    true,
    null,
    '27/08/2000',
    25,
    85.5,
    'test@test.com',
    null,
    false
  };

  String getValueType(dynamic value) {
    if (value == null) return 'null';
    if (value is int) return 'int';
    if (value is double) return 'float';
    if (value is String) return 'string';
    if (value is bool) return 'bool';
    return 'unknown';
  }

  List<MapEntry<String, dynamic>> getFilteredMixedValues(String operator) {
    switch (operator) {
      case 'EQ':
      case 'NEQ':
        return mixedValues.map((e) => MapEntry(e.toString(), e)).toList();
      case 'GT':
      case 'GTE':
      case 'LT':
      case 'LTE':
        return mixedValues.where((e) => e is num || e is String)
            .map((e) => MapEntry(e.toString(), e))
                .toList();
      // case 'CONTAINS':
      //   return mixedValues.entries
      //       .where((e) => e.value is String)
      //       .toList();
      case 'CONTAINS':
      case 'ICONTAINS':
      case 'STARTSWITH':
      case 'ISTARTSWITH':
      case 'ENDSWITH':
      case 'DATE':
      case 'IENDSWITH':
      case 'REGEX':
      case 'IREGEX':
        return mixedValues.map((e) => MapEntry(e.toString(), e)).toList()
            .where((e) => e.value is String)
            .toList();


      default:
        return [];
    }
  }

  Iterable<String> getDataTypesForOperator(String operator) {
    return FilterNode.operatorDataTypes[operator] ?? [];
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
    'CONTAINS'
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
