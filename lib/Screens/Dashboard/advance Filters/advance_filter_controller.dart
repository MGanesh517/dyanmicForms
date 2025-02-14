
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/Common/snackbar_widget.dart';
import 'package:implementation_panel/utils/loader_util.dart';

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


class AdvancedFilterController extends GetxController {
  var filters = FilterNode();
  final operatorMap = {
    // 'AND': 'AND',
    // 'OR': 'OR',
    // 'NAG': 'NAG',
    'EQ ( = )': '=',
    'NEQ ( != )': '!=',
    'GT ( > )': '>',
    'GTE ( >= )': '>=',
    'LT ( < )': '<',
    'LTE ( <= )': '<=',
    'CONTAINS': 'CONTAINS'
  };

  final operatorTypes = [
    'AND',
    'OR',
    'NAG',
    'EQ ( = )',
    'NEQ ( != )',
    'GT ( > )',
    'GTE ( >= )',
    'LT ( < )',
    'LTE ( <= )',
    'CONTAINS'
  ];

  String getOperatorSymbol(String operator) {
    return operatorMap[operator] ?? operator;
  }

  bool isLogicalOperator(String operator) {
    return operator == 'AND' || operator == 'OR' || operator == 'NAG';
  }

  void addFilterNode(FilterNode? parent) {
    final newNode = FilterNode();
    if (parent != null) {
    //   filters.add(newNode);
    // } else {
      parent.children.add(newNode);
    }
  }

  void removeFilterNode(FilterNode node, FilterNode? parent) {
    if (parent != null) {
    //   filters.remove(node);
    // } else {
      parent.children.remove(node);
    }
  }


  final TextEditingController keyTextField = TextEditingController();
  final TextEditingController valueTextField = TextEditingController();

  final RxBool _submit = false.obs;
  bool get submit => _submit.value;
  set submit(value) => _submit.value = value;

  final RxBool _isRefresh = false.obs;
  bool get isRefresh => _isRefresh.value;
  set isRefresh(value) => _isRefresh.value = value;


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


Map<String, dynamic> generateQuery(List<FilterNode> filters) {
  if (filters.isEmpty) return {};

  Map<String, dynamic> query = {};

  for (var node in filters) {
    if (query.containsKey(node.operator.value)) {
      (query[node.operator.value] as List).add(formatNode(node));
    } else {
      query[node.operator.value] = [formatNode(node)];
    }
  }

  return query;
}

Map<String, dynamic> formatNode(FilterNode node) {
  // Check if the operator is a logical operator
  if (isLogicalOperator(node.operator.value)) {
    return {
      node.operator.value: node.children.map((child) => formatNode(child)).toList(),
    };
  } else {
    return {
      node.operator.value: {
        "KEY": node.key.value,
        "VAL": node.value.value,
      }
    };
  }
}



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

}



class FilterNode {
  RxString operator = 'AND'.obs;
  RxString key = ''.obs;
  RxString value = ''.obs;
  RxBool isExpanded = true.obs;
  RxList<FilterNode> children = <FilterNode>[].obs;
}