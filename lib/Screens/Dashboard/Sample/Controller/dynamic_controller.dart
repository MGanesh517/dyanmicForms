// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:implementation_panel/Common/common_service.dart';
// import 'package:implementation_panel/Common/snackbar_widget.dart';
// import 'package:implementation_panel/Screens/Dashboard/Sample/Model/post_dynamic_data_model.dart';
// import 'package:implementation_panel/Screens/Dashboard/Sample/Repo/dynamic_repo.dart';
// import 'package:implementation_panel/utils/loader_util.dart';

// class DynamicController extends GetxController {
//   static DynamicController get to => Get.find();
//   var commonService = CommonService.instance;

//   final TextEditingController appLabel = TextEditingController();
//   final TextEditingController modelName = TextEditingController();
//   final TextEditingController fieldNameController = TextEditingController();
//   final TextEditingController maxLengthController = TextEditingController();
//   final TextEditingController minLengthController = TextEditingController();
//   final TextEditingController maxDigitsController = TextEditingController();
//   final TextEditingController decimalPlacesController = TextEditingController();

//   void updateRequired(bool value) {
//     isRequired.value = value;
//   }

//   void updateReadOnly(bool value) {
//     isReadOnly.value = value;
//   }

//   void updateViewOnly(bool value) {
//     isView.value = value;
//   }

//   void updateReportOnly(bool value) {
//     isReport.value = value;
//   }

//   void updateEditOnly(bool value) {
//     isEdit.value = value;
//   }

//   void updateFilterOnly(bool value) {
//     isFilter.value = value;
//   }
  
//   void updateListOnly(bool value) {
//     isList.value = value;
//   }

//   void updateAddOnly(bool value) {
//     isAdd.value = value;
//   }

//   // void resetCheckboxes() {
//   //   isRequired.value = false;
//   //   isReadOnly.value = false;
//   //   isAdd.value = false;
//   //   isList.value = false;
//   //   isFilter.value = false;
//   //   isEdit.value = false;
//   //   isReport.value = false;
//   //   isView.value = false;
//   // }

//   // Observable states
//   RxBool isRequired = false.obs;
//   RxBool isReadOnly = false.obs;
//   RxBool isView = false.obs;
//   RxBool isReport = false.obs;
//   RxBool isAdd = false.obs;
//   RxBool isList = false.obs;
//   RxBool isFilter = false.obs;
//   RxBool isEdit = false.obs;


//   final RxBool _isRefresh = false.obs;
//   final RxBool _submit = false.obs;

//   get isRefresh => _isRefresh.value;
//   set isRefresh(value) => _isRefresh.value = value;

//   get submit => _submit.value;
//   set submit(value) => _submit.value = value;

//   final RxString _selectedFieldType = 'Char'.obs;
//   get selectedFieldType => _selectedFieldType.value;
//   set selectedFieldType(value) => _selectedFieldType.value = value;

//   final _postDynamicData = PostDynamicData().obs;
//   PostDynamicData get postDynamicData => _postDynamicData.value;
//   set postDynamicData(value) => _postDynamicData.value = value;

//   createDynamicData(Map<String, dynamic> jsonData) async {
//     submit = true;

//     var postData = {
//       "app_label": appLabel.text,
//       "model_name": modelName.text,
//       // "fields": jsonEncode(jsonData['fields']),
//       "fields": jsonData['fields'],
//       // "fields": ,
//     };

//     debugPrint('Sending JSON data:::::: ${json.encode(postData)}');

//     try {
//       submit = true;
//       var data = await DynamicRepo().createDynamicData(postData);
//       closeLoadingDialog();

//       if (data != null) {
//         Get.back();
//         submit = false;
//         // _postDynamicData.value = data;

//         showSnackBar(
//             title: 'Success....!',
//             message: 'Data Submitted Successfully.',
//             icon: Icon(Icons.check, color: Colors.green));

//         disposeController();
//         isRefresh = true;
//       }
//     } catch (e) {
//       submit = false;
//       debugPrint("Api Error Response: $e");
//       closeLoadingDialog();
//     }
//   }

//   disposeController() {
//     submit = false;
//     appLabel.clear();
//     modelName.clear();
//   }

//   addFieldsDisposeController() {
//     fieldNameController.clear();
//     maxLengthController.clear();
//     minLengthController.clear();
//     maxDigitsController.clear();
//     decimalPlacesController.clear();
//     // resetCheckboxes();
//     isRequired.value = false;
//     isReadOnly.value = false;
//     isAdd.value = false;
//     isList.value = false;
//     isFilter.value = false;
//     isEdit.value = false;
//     isReport.value = false;
//     isView.value = false;
//   }
// }






import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/Common/common_service.dart';
import 'package:implementation_panel/Common/snackbar_widget.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Repo/dynamic_repo.dart';
import 'package:implementation_panel/utils/loader_util.dart';

class DynamicController extends GetxController {
  static DynamicController get to => Get.find();
  var commonService = CommonService.instance;

  // Text Controllers
  final TextEditingController appLabel = TextEditingController();
  final TextEditingController modelName = TextEditingController();
  final TextEditingController fieldNameController = TextEditingController();
  final TextEditingController maxLengthController = TextEditingController();
  final TextEditingController minLengthController = TextEditingController();
  final TextEditingController maxDigitsController = TextEditingController();
  final TextEditingController decimalPlacesController = TextEditingController();

  final RxBool isRequired = false.obs;
  final RxBool isReadOnly = false.obs;
  final RxBool isView = false.obs;
  final RxBool isReport = false.obs;
  final RxBool isAdd = false.obs;
  final RxBool isList = false.obs;
  final RxBool isFilter = false.obs;
  final RxBool isEdit = false.obs;
  final RxBool _isRefresh = false.obs;
  final RxBool _submit = false.obs;
  final RxString _selectedFieldType = 'Char'.obs;
  final RxList<Map<String, dynamic>> formFields = <Map<String, dynamic>>[].obs;

  bool get isRefresh => _isRefresh.value;
  set isRefresh(value) => _isRefresh.value = value;

  bool get submit => _submit.value;
  set submit(value) => _submit.value = value;

  String get selectedFieldType => _selectedFieldType.value;
  set selectedFieldType(value) => _selectedFieldType.value = value;

  List<String> get fieldTypes => [
    'Char',
    'Text',
    'Choice',
    'Integer',
    'Decimal',
    'DateTime',
    'Date',
    'Time',
    'Duration'
  ];

  void updateRequired(bool value) => isRequired.value = value;
  void updateReadOnly(bool value) => isReadOnly.value = value;
  void updateViewOnly(bool value) => isView.value = value;
  void updateReportOnly(bool value) => isReport.value = value;
  void updateEditOnly(bool value) => isEdit.value = value;
  void updateFilterOnly(bool value) => isFilter.value = value;
  void updateListOnly(bool value) => isList.value = value;
  void updateAddOnly(bool value) => isAdd.value = value;

  Map<String, dynamic> getFieldOptions(String fieldType) {
    Map<String, dynamic> baseOptions = {
      'required': isRequired.value,
      'show_in_view': isView.value,
      'show_in_report': isReport.value,
      'show_in_edit': isEdit.value,
      'show_in_filter': isFilter.value,
      'show_in_list': isList.value,
      'show_in_add': isAdd.value,
    };

    switch (fieldType) {
      case 'Char':
        return {
          ...baseOptions,
          'max_length': int.tryParse(maxLengthController.text) ?? 100,
          'min_length': int.tryParse(minLengthController.text) ?? 1,
        };
      
      case 'Text':
        return {
          ...baseOptions,
          'max_length': int.tryParse(maxLengthController.text) ?? 1000,
          'min_length': int.tryParse(minLengthController.text) ?? 5,
        };
      
      case 'Choice':
        return {
          ...baseOptions,
          'default': 1,
          'choices': [
            [1, 'Male'],
            [2, 'Female'],
            [3, 'Others']
          ],
        };
      
      case 'Integer':
        return {
          ...baseOptions,
          'default': 0,
        };
      
      case 'Decimal':
        return {
          ...baseOptions,
          'max_digits': int.tryParse(maxDigitsController.text) ?? 9,
          'decimal_places': int.tryParse(decimalPlacesController.text) ?? 2,
          'default': 0,
        };
      
      case 'DateTime':
      case 'Date':
      case 'Time':
        return {
          ...baseOptions,
          'read_only': isReadOnly.value,
          'range_filter': true,
        };
      
      case 'Duration':
        return {
          ...baseOptions,
          'read_only': isReadOnly.value,
        };
      
      default:
        return baseOptions;
    }
  }

  // Generate field data
  Map<String, dynamic> generateFieldData() {
    return {
      fieldNameController.text: {
        'type': selectedFieldType,
        ...getFieldOptions(selectedFieldType),
      }
    };
  }

  // Add new field
  void addField() {
    if (fieldNameController.text.isNotEmpty) {
      formFields.add(generateFieldData());
      addFieldsDisposeController();
    }
  }

  // Remove field
  void removeField(int index) {
    formFields.removeAt(index);
  }

 createDynamicData() async {
    if (appLabel.text.isEmpty || modelName.text.isEmpty) {
      showSnackBar(
        title: 'Error',
        message: 'App Label and Model Name are required',
        icon: Icon(Icons.error, color: Colors.red),
      );
      return;
    }

    submit = true;

    var postData = {
      "app_label": appLabel.text,
      "model_name": modelName.text,
      "fields": jsonEncode(formFields.fold<Map<String, dynamic>>(
        {},
        (map, element) => {...map, ...element},
      ))
    };

    debugPrint('Sending JSON data: ${json.encode(postData)}');

    try {
      var data = await DynamicRepo().createDynamicData(postData);
      closeLoadingDialog();

      if (data != null) {
        Get.back();
        submit = false;
        showSnackBar(
          title: 'Success',
          message: 'Data Submitted Successfully.',
          icon: Icon(Icons.check, color: Colors.green),
        );
        disposeController();
        isRefresh = true;
      }
    } catch (e) {
      submit = false;
      debugPrint("Api Error Response: $e");
      closeLoadingDialog();
      showSnackBar(
        title: 'Error',
        message: 'Failed to submit data',
        icon: Icon(Icons.error, color: Colors.red),
      );
    }
  }

  void disposeController() {
    submit = false;
    appLabel.clear();
    modelName.clear();
    formFields.clear();
  }

  void addFieldsDisposeController() {
    fieldNameController.clear();
    maxLengthController.clear();
    minLengthController.clear();
    maxDigitsController.clear();
    decimalPlacesController.clear();
    isRequired.value = false;
    isReadOnly.value = false;
    isAdd.value = false;
    isList.value = false;
    isFilter.value = false;
    isEdit.value = false;
    isReport.value = false;
    isView.value = false;
    selectedFieldType = 'Char';
  }

  @override
  void onClose() {
    appLabel.dispose();
    modelName.dispose();
    fieldNameController.dispose();
    maxLengthController.dispose();
    minLengthController.dispose();
    maxDigitsController.dispose();
    decimalPlacesController.dispose();
    super.onClose();
  }
}