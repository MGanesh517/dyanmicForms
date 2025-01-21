
import 'dart:convert';
import 'dart:math';

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
  final TextEditingController choiceController = TextEditingController();
  final RxList<List<dynamic>> choices = <List<dynamic>>[].obs;
  final RxInt nextChoiceId = 1.obs;
  final RxBool isRequired = false.obs;
  final RxBool isMultipleFilter = false.obs;
  final RxBool isDefault = false.obs;
  final RxBool rangeFilter = false.obs;
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
  final RxString _selectedChildrenFieldType = 'Char'.obs;
  final RxList<Map<String, dynamic>> formFields = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> itemFields = <Map<String, dynamic>>[].obs;


  bool get isRefresh => _isRefresh.value;
  set isRefresh(value) => _isRefresh.value = value;

  bool get submit => _submit.value;
  set submit(value) => _submit.value = value;

  String get selectedFieldType => _selectedFieldType.value;
  set selectedFieldType(value) => _selectedFieldType.value = value;

  String get selectedChildrenFieldType => _selectedChildrenFieldType.value;
  set selectedChildrenFieldType(value) => _selectedChildrenFieldType.value = value;

  final RxInt _selectedChoice = 1.obs;
  int get selectedChoice => _selectedChoice.value;
  set selectedChoice(value) => _selectedChoice.value = value;

  void addItemField() {
    if (fieldNameController.text.isEmpty || selectedChildrenFieldType.isEmpty) {
      showSnackBar(
        title: 'Error',
        message: 'Field Name and Field Type are required',
        icon: Icon(Icons.error, color: Colors.red),
      );
      return;
    }

  // Create new field data based on the selectedChildrenFieldType
  final Map<String, dynamic> newItemField = {
    fieldNameController.text: {
      'type': selectedChildrenFieldType,
      ...getFieldOptions(selectedChildrenFieldType), // This will include all the checkboxes and other options
    }
  };

  itemFields.add(newItemField);
  fieldNameController.clear();
  
  // Optional: Reset the selectedChildrenFieldType if needed
  // selectedChildrenFieldType = 'Char';

  showSnackBar(
    title: 'Success',
    message: 'Child field added successfully',
    icon: Icon(Icons.check, color: Colors.green),
  );

  update();
}

// Modify generateFieldData to properly handle Children type
Map<String, dynamic> generateFieldData() {
  final Map<String, dynamic> fieldData = {
    'type': selectedFieldType,
    ...getFieldOptions(selectedFieldType),
  };

  if (selectedFieldType == 'Choice' && choices.isNotEmpty) {
    fieldData['choices'] = List<List<dynamic>>.from(choices);
  }

  if (selectedFieldType == 'Children') {
    // Combine all itemFields into a single object
    Map<String, dynamic> combinedFields = {};
    for (var field in itemFields) {
      combinedFields.addAll(field);
    }
    fieldData['fields'] = json.encode(combinedFields);
  }

  return {fieldNameController.text: fieldData};
}

// Add a method to clear itemFields when needed
void clearItemFields() {
  itemFields.clear();
  update();
}

// Modify addField to handle Children type
  void addField() {
    if (fieldNameController.text.isNotEmpty) {
      final newFieldData = generateFieldData();
      
      if (editingIndex >= 0) {
        formFields[editingIndex] = newFieldData;
        editingIndex = -1;
      } else {
        formFields.add(newFieldData);
      }
      
      // Clear itemFields after adding a Children type field
      if (selectedFieldType == 'Children') {
        clearItemFields();
      }
      
      addFieldsDisposeController();
    }
  }

  List<String> get fieldTypes => [
    'Char',
    'Text',
    'Choice',
    'Integer',
    'DateTime',
    'Date',
    'Time',
    'Duration',
    'Decimal',
    'ManyToMany',
    'ForeignKey',
    'Boolean',
    'Children'
  ];

  List<String> get itemFieldTypes => [
    'Char',
    'Text',
    'Choice',
    'Integer',
    'DateTime',
    'Date',
    'Time',
    'Duration',
    'Decimal',
    'ManyToMany',
    'ForeignKey',
    'Boolean',
  ];

  void updateRequired(bool value) => isRequired.value = value;
  void updateMultipleFilter(bool value) => isMultipleFilter.value = value;
  void updateDefault(bool value) => isDefault.value = value;
  void updateRangeFilter(bool value) => rangeFilter.value = value;
  void updateReadOnly(bool value) => isReadOnly.value = value;
  void updateViewOnly(bool value) => isView.value = value;
  void updateReportOnly(bool value) => isReport.value = value;
  void updateEditOnly(bool value) => isEdit.value = value;
  void updateFilterOnly(bool value) => isFilter.value = value;
  void updateListOnly(bool value) => isList.value = value;
  void updateAddOnly(bool value) => isAdd.value = value;

  final RxInt _editingIndex = (-1).obs;

  int get editingIndex => _editingIndex.value;
  set editingIndex(int value) => _editingIndex.value = value;

  void editField(int index, Map<String, dynamic> field) {
    final fieldName = field.keys.first;
    final fieldData = field[fieldName] as Map<String, dynamic>;
    fieldNameController.text = fieldName;
    selectedFieldType = fieldData['type'];
    isRequired.value = fieldData['required'] ?? false;
    isMultipleFilter.value = fieldData['multiple_filter'] ?? false;
    rangeFilter.value = fieldData['range_filter'] ?? false;
    isReadOnly.value = fieldData['read_only'] ?? false;
    isView.value = fieldData['show_in_view'] ?? false;
    isReport.value = fieldData['show_in_report'] ?? false;
    isEdit.value = fieldData['show_in_edit'] ?? false;
    isFilter.value = fieldData['show_in_filter'] ?? false;
    isList.value = fieldData['show_in_list'] ?? false;
    isAdd.value = fieldData['show_in_add'] ?? false;
    choices.clear();
    
    // If this is a Choice field and has choices, populate them
    if (fieldData['type'] == 'Choice' && fieldData['choices'] != null) {
      choices.addAll(List<List<dynamic>>.from(fieldData['choices']));
      nextChoiceId.value = choices.isNotEmpty ?
        (choices.map((c) => c[0] as int).reduce(max) + 1) : 1;
    }

    // Set type-specific fields
    if (fieldData['type'] == 'Char' || fieldData['type'] == 'Text') {
      maxLengthController.text = fieldData['max_length']?.toString() ?? '';
      minLengthController.text = fieldData['min_length']?.toString() ?? '';
    }

    if (fieldData['type'] == 'Decimal') {
      maxDigitsController.text = fieldData['max_digits']?.toString() ?? '';
      decimalPlacesController.text = fieldData['decimal_places']?.toString() ?? '';
    }
    // Store the index being edited - using .value with RxInt
    _editingIndex.value = index;
    update();
  }

  // void addField() {
  //   if (fieldNameController.text.isNotEmpty) {
  //     final newFieldData = generateFieldData();
      
  //     if (_editingIndex.value >= 0) {
  //       // Update existing fi
  //       formFields[_editingIndex.value] = newFieldData;
  //       _editingIndex.value = -1; // Reset editing index
  //     } else {
  //       // Add new field
  //       formFields.add(newFieldData);
  //     }
  //     addFieldsDisposeController();
  //   }
  // }

  // void addItemField() {
  //   if (fieldNameController.text.isEmpty || selectedFieldType.isEmpty) {
  //     showSnackBar(
  //       title: 'Error',
  //       message: 'Field Name and Field Type are required',
  //       icon: Icon(Icons.error, color: Colors.red),
  //     );
  //     return;
  //   }

  //   final Map<String, dynamic> newItemField = {
  //     fieldNameController.text: {
  //       'type': selectedChildrenFieldType,
  //       ...getFieldOptions(selectedChildrenFieldType),
  //     }
  //   };

  //   if (_editingIndex.value >= 0) {
  //     // Get the current Children field
  //     var currentField = formFields[_editingIndex.value];
  //     var fieldName = currentField.keys.first;
      
  //     // Update its fields
  //     if (currentField[fieldName]['fields'] is String) {
  //       var existingFields = json.decode(currentField[fieldName]['fields']) as Map<String, dynamic>;
  //       existingFields.addAll(newItemField);
  //       currentField[fieldName]['fields'] = json.encode(existingFields);
  //     } else {
  //       currentField[fieldName]['fields'] = json.encode(newItemField);
  //     }
  //   }

  //   addFieldsDisposeController();
  // }
  // void addItemField() {
  //   if (fieldNameController.text.isEmpty || selectedChildrenFieldType.isEmpty) {
  //     showSnackBar(
  //       title: 'Error',
  //       message: 'Field Name and Field Type are required',
  //       icon: Icon(Icons.error, color: Colors.red),
  //     );
  //     return;
  //   }

  //   // Create the new field data
  //   final Map<String, dynamic> newItemField = {
  //     fieldNameController.text: {
  //       'type': selectedChildrenFieldType,
  //       ...getFieldOptions(selectedChildrenFieldType),
  //     }
  //   };

  //   // If we're editing an existing Children field
  //   if (editingIndex >= 0) {
  //     var currentField = formFields[editingIndex];
  //     var fieldName = currentField.keys.first;
      
  //     // Get the current fields or initialize if empty
  //     Map<String, dynamic> currentFields = {};
  //     if (currentField[fieldName]['fields'] is String) {
  //       currentFields = json.decode(currentField[fieldName]['fields']) as Map<String, dynamic>;
  //     }
      
  //     // Add the new field
  //     currentFields.addAll(newItemField);
      
  //     // Update the fields in the parent
  //     currentField[fieldName]['fields'] = json.encode(currentFields);
  //     formFields[editingIndex] = currentField;
  //   } else {
  //     // If not editing, store the field to add it later
  //     itemFields.add(newItemField);
  //   }

  //   // Clear the form
  //   addFieldsDisposeController();
  //   update();
  // }


  void addChoice() {
    if (choiceController.text.isNotEmpty) {
      final int id = nextChoiceId.value;
      choices.add([id, choiceController.text.trim()]);
      choiceController.clear();
      nextChoiceId.value++;
      update();
    }
  }

  void removeChoice(List<dynamic> choice) {
    choices.remove(choice);
    update();
  }

  // void addItemField(Map<String, dynamic> itemField) {
  //   itemFields.add(itemField);
  //   update();
  // }

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
        'default': choices.isNotEmpty ? choices[0][0] : 1,
        'choices': choices.map((choice) => [choice[0], choice[1]]).toList(),
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
        return {
          ...baseOptions,
          'read_only': isReadOnly.value,
          'range_filter': true,
        };
        
      case 'Time':
      case 'Duration':
        return {
          ...baseOptions,
          'read_only': isReadOnly.value,
        };

      case 'ManyToMany':
        return {
          ...baseOptions,
          'multiple_filter': isMultipleFilter.value,
        };

      case ' ':
        return {
          ...baseOptions,
          'default': true,
        };

      case 'Children':
        return {
          'fields': jsonEncode(itemFields.fold<Map<String, dynamic>>(
            {},
            (map, element) => {...map, ...element},
          )),
        };
      
      default:
        return baseOptions;
    }
  }

  // Map<String, dynamic> generateFieldData() {
  //   final Map<String, dynamic> fieldData = {
  //     'type': selectedFieldType,
  //     ...getFieldOptions(selectedFieldType),
  //   };

  //       // Only include choices if this is a Choice field
  //   if (selectedFieldType == 'Choice' && choices.isNotEmpty) {
  //     fieldData['choices'] = List<List<dynamic>>.from(choices);

  //   if (selectedFieldType == 'Children') {
  //     fieldData['fields'] = itemFields.fold<Map<String, dynamic>>(
  //       {},
  //       (map, element) => {...map, ...element},
  //     );
  //   }}

  //   return {fieldNameController.text: fieldData};
  // }

  // Map<String, dynamic> generateFieldData() {
  //   final Map<String, dynamic> fieldData = {
  //     'type': selectedFieldType,
  //     ...getFieldOptions(selectedFieldType),
  //   };

  //   if (selectedFieldType == 'Choice' && choices.isNotEmpty) {
  //     fieldData['choices'] = List<List<dynamic>>.from(choices);
  //   }

  //   if (selectedFieldType == 'Children') {
  //     fieldData['fields'] = '{}';  // Initialize with empty object
  //   }

  //   return {fieldNameController.text: fieldData};
  // }
//   Map<String, dynamic> generateFieldData() {
//   final Map<String, dynamic> fieldData = {
//     'type': selectedFieldType,
//     ...getFieldOptions(selectedFieldType),
//   };

//   if (selectedFieldType == 'Choice' && choices.isNotEmpty) {
//     fieldData['choices'] = List<List<dynamic>>.from(choices);
//   }

//   if (selectedFieldType == 'Children') {
//     // Combine all item fields into a single object
//     final Map<String, dynamic> combinedFields = {};
//     for (var field in itemFields) {
//       combinedFields.addAll(field);
//     }
//     fieldData['fields'] = json.encode(combinedFields);
//   }

//   return {fieldNameController.text: fieldData};
// }

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
  // var postData = {
  //   "app_label": appLabel.text,
  //   "model_name": modelName.text,
  //   "fields": jsonEncode(formFields.fold<Map<String, dynamic>>(
  //     {},
  //     (map, element) => {...map, ...element},
  //   )),
  //   "item_fields": jsonEncode(itemFields.fold<Map<String, dynamic>>(
  //     {},
  //     (map, element) => {...map, ...element},
  //   )),
  // };


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
    _editingIndex.value = -1;
    fieldNameController.clear();
    maxLengthController.clear();
    minLengthController.clear();
    maxDigitsController.clear();
    decimalPlacesController.clear();
    choiceController.clear();
    choices.clear();
    nextChoiceId.value = 1;
    isRequired.value = false;
    isMultipleFilter.value = false;
    rangeFilter.value = false;
    isReadOnly.value = false;
    isAdd.value = false;
    isList.value = false;
    isFilter.value = false;
    isEdit.value = false;
    isReport.value = false;
    isView.value = false;
    selectedFieldType = 'Char';
    selectedChildrenFieldType = 'Char';
  }
}