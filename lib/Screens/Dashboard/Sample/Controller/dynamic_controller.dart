
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/Common/common_service.dart';
import 'package:implementation_panel/Common/snackbar_widget.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/get_dynamic_data_list_model.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/view_by_id_model.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Repo/dynamic_repo.dart';
import 'package:implementation_panel/Screens/Dashboard/drawer_controller.dart';
import 'package:implementation_panel/utils/loader_util.dart';

import '../../../../routes/app_pages.dart';

class DynamicController extends GetxController {
  static DynamicController get to => Get.find();
  var commonService = CommonService.instance;
  final drawerController = Get.find<DrawerControllerX>();

  final TextEditingController appLabel = TextEditingController();
  final TextEditingController modelName = TextEditingController();
  final TextEditingController fieldNameController = TextEditingController();
  final TextEditingController maxLengthController = TextEditingController();
  final TextEditingController minLengthController = TextEditingController();
  final TextEditingController maxDigitsController = TextEditingController();
  final TextEditingController decimalPlacesController = TextEditingController();
  final TextEditingController choiceController = TextEditingController();

  int editingIndex = -1;
  var _isEditMode = false.obs;

  // Field attributes
  // var selectedFieldType = 'Char'.obs;
  var isRequired = false.obs;
  var isView = false.obs;
  var isReport = false.obs;
  var isEdit = false.obs;
  var isFilter = false.obs;
  var isList = false.obs;
  var isAdd = false.obs;
  var isReadOnly = false.obs;
  var rangeFilter = false.obs;
  var isMultipleFilter = false.obs;

  // Choices for 'Choice' type fields
  var choices = <List<dynamic>>[].obs;
  var nextChoiceId = 1.obs;


  final RxBool isDefault = false.obs;
  final RxList<Map<String, dynamic>> formFields = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> itemFields = <Map<String, dynamic>>[].obs;
  
  final RxBool _isRefresh = false.obs;
  bool get isRefresh => _isRefresh.value;
  set isRefresh(value) => _isRefresh.value = value;

  final RxBool _submit = false.obs;
  bool get submit => _submit.value;
  set submit(value) => _submit.value = value;

  final RxString _selectedFieldType = 'Char'.obs;
  String get selectedFieldType => _selectedFieldType.value;
  set selectedFieldType(value) => _selectedFieldType.value = value;

  final RxString _selectedChildrenFieldType = 'Char'.obs;
  String get selectedChildrenFieldType => _selectedChildrenFieldType.value;
  set selectedChildrenFieldType(value) => _selectedChildrenFieldType.value = value;
  
  final RxInt _selectedChoice = 1.obs;
  int get selectedChoice => _selectedChoice.value;
  set selectedChoice(value) => _selectedChoice.value = value;

  // final RxInt _editingIndex = (-1).obs;
  // int get editingIndex => _editingIndex.value;
  // set editingIndex(int value) => _editingIndex.value = value;

  // final RxBool _isEditMode = false.obs;
  // bool get isEditMode => _isEditMode.value;

  initPostDynamicDataState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isRefresh = true;
      appLabel.text == '';
      modelName.text == '';
      update();
    });
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



  // Clears the form controllers
  void addFieldsDisposeController() {
    fieldNameController.clear();
    maxLengthController.clear();
    minLengthController.clear();
    maxDigitsController.clear();
    decimalPlacesController.clear();
    selectedFieldType = 'Char';
    isRequired.value = false;
    isView.value = false;
    isReport.value = false;
    isEdit.value = false;
    isFilter.value = false;
    isList.value = false;
    isAdd.value = false;
    isReadOnly.value = false;
    rangeFilter.value = false;
    isMultipleFilter.value = false;
    choices.clear();
    nextChoiceId.value = 1;
  }

  // Editing functionality
  // void editField(int index, Map<String, dynamic> field) {
  //   try {
  //     // Prevents unnecessary clearing of form data
  //     if (_isEditMode.value == false || editingIndex != index) {
  //       addFieldsDisposeController();
  //     }

  //     // Extract field name and data
  //     String fieldName = field.keys.first;
  //     Map<String, dynamic> fieldData = field[fieldName];

  //     // Set field data into controllers and observable values
  //     fieldNameController.text = fieldName;
  //     selectedFieldType = fieldData['type'] ?? 'Char';

  //     isRequired.value = fieldData['required'] ?? false;
  //     isView.value = fieldData['show_in_view'] ?? false;
  //     isReport.value = fieldData['show_in_report'] ?? false;
  //     isEdit.value = fieldData['show_in_edit'] ?? false;
  //     isFilter.value = fieldData['show_in_filter'] ?? false;
  //     isList.value = fieldData['show_in_list'] ?? false;
  //     isAdd.value = fieldData['show_in_add'] ?? false;

  //     // Type-specific fields
  //     switch (selectedFieldType) {
  //       case 'Char':
  //       case 'Text':
  //         maxLengthController.text = fieldData['max_length']?.toString() ?? '';
  //         minLengthController.text = fieldData['min_length']?.toString() ?? '';
  //         break;
  //       case 'Choice':
  //         choices.clear();
  //         if (fieldData['choices'] != null) {
  //           final choicesList = fieldData['choices'] as List;
  //           choices.addAll(choicesList.map((choice) {
  //             return choice is List ? choice : [nextChoiceId.value++, choice];
  //           }));
  //         }
  //         break;
  //       case 'Decimal':
  //         maxDigitsController.text = fieldData['max_digits']?.toString() ?? '';
  //         decimalPlacesController.text = fieldData['decimal_places']?.toString() ?? '';
  //         break;
  //       case 'DateTime':
  //       case 'Date':
  //         rangeFilter.value = fieldData['range_filter'] ?? false;
  //         isReadOnly.value = fieldData['read_only'] ?? false;
  //         break;
  //       case 'Time':
  //       case 'Duration':
  //         isReadOnly.value = fieldData['read_only'] ?? false;
  //         break;
  //       case 'ManyToMany':
  //         isMultipleFilter.value = fieldData['multiple_filter'] ?? false;
  //         break;
  //     }

  //     // Set editing state
  //     editingIndex = index;
  //     _isEditMode.value = true;
  //     update();
  //   } catch (e) {
  //     debugPrint('Error editing field: $e');
  //   }
  // }

  void editField(int index, Map field) {
  try {
    // Clear controllers before setting new data
    addFieldsDisposeController();

    // Ensure valid index
    if (index < 0 || index >= formFields.length) {
      debugPrint('Invalid index: $index');
      return;
    }

    // Extract field name and data
    Map fieldData;
    String fieldName;

    if (field.length == 1 && field.values.first is Map) {
      fieldName = field.keys.first;
      fieldData = field.values.first as Map;
    } else {
      fieldName = field.keys.first;
      fieldData = field;
    }

    if (fieldName.isEmpty) {
      debugPrint('Field name is empty, recovering...');
      fieldName = field.keys.firstWhere(
        (key) => key.isNotEmpty,
        orElse: () => 'Unnamed Field',
      );
    }

    // Set form values
    fieldNameController.text = fieldName;
    selectedFieldType = fieldData['type'] ?? 'Char';
    
    isRequired.value = fieldData['required'] ?? false;
    isView.value = fieldData['show_in_view'] ?? false;
    isReport.value = fieldData['show_in_report'] ?? false;
    isEdit.value = fieldData['show_in_edit'] ?? false;
    isFilter.value = fieldData['show_in_filter'] ?? false;
    isList.value = fieldData['show_in_list'] ?? false;
    isAdd.value = fieldData['show_in_add'] ?? false;

    // Handle different field types
    switch (selectedFieldType) {
      case 'Char':
      case 'Text':
        maxLengthController.text = fieldData['max_length']?.toString() ?? '';
        minLengthController.text = fieldData['min_length']?.toString() ?? '';
        break;
      case 'Choice':
        choices.clear();
        if (fieldData['choices'] != null) {
          final choicesList = fieldData['choices'] as List;
          choices.addAll(choicesList.map((choice) =>
              choice is List ? choice : [choice, choice.toString()]));
        }
        nextChoiceId.value = choices.isNotEmpty
            ? choices.map((c) => c[0] as int).reduce((a, b) => a > b ? a : b) + 1
            : 1;
        break;
      case 'Decimal':
        maxDigitsController.text = fieldData['max_digits']?.toString() ?? '';
        decimalPlacesController.text = fieldData['decimal_places']?.toString() ?? '';
        break;
      case 'DateTime':
      case 'Date':
        rangeFilter.value = fieldData['range_filter'] ?? false;
        isReadOnly.value = fieldData['read_only'] ?? false;
        break;
      case 'Time':
      case 'Duration':
        isReadOnly.value = fieldData['read_only'] ?? false;
        break;
      case 'ManyToMany':
        isMultipleFilter.value = fieldData['multiple_filter'] ?? false;
        break;
    }

    // Store editing index
    editingIndex = index;
    _isEditMode.value = true;
    update();

    debugPrint('Editing field at index: $index');
  } catch (e) {
    debugPrint('Error editing field: $e');
  }
}


//   void addField() {
//   if (fieldNameController.text.isEmpty) {
//     showSnackBar(
//       title: 'Error',
//       message: 'Field Name is required',
//       icon: Icon(Icons.error, color: Colors.red),
//     );
//     return;
//   }

//   // Generate updated field data
//   final newFieldData = {
//     fieldNameController.text: {
//       "type": selectedFieldType,
//       "required": isRequired.value,
//       "show_in_view": isView.value,
//       "show_in_report": isReport.value,
//       "show_in_edit": isEdit.value,
//       "show_in_filter": isFilter.value,
//       "show_in_list": isList.value,
//       "show_in_add": isAdd.value,
//       "max_length": maxLengthController.text.isNotEmpty
//           ? int.tryParse(maxLengthController.text)
//           : null,
//       "min_length": minLengthController.text.isNotEmpty
//           ? int.tryParse(minLengthController.text)
//           : null,
//       if (selectedFieldType == 'Choice') "choices": List.from(choices),
//       if (selectedFieldType == 'Decimal') ...{
//         "max_digits": maxDigitsController.text.isNotEmpty
//             ? int.tryParse(maxDigitsController.text)
//             : null,
//         "decimal_places": decimalPlacesController.text.isNotEmpty
//             ? int.tryParse(decimalPlacesController.text)
//             : null,
//       },
//       if (selectedFieldType == 'Date' || selectedFieldType == 'DateTime')
//         "range_filter": rangeFilter.value,
//       if (selectedFieldType == 'Time' || selectedFieldType == 'Duration')
//         "read_only": isReadOnly.value,
//       if (selectedFieldType == 'ManyToMany')
//         "multiple_filter": isMultipleFilter.value,
//     }
//   };

//   if (editingIndex >= 0) {
//     // Ensure we only update the specific field without modifying the entire list
//     formFields[editingIndex] = newFieldData;
//     editingIndex = -1;
//     _isEditMode.value = false;
//   } else {
//     // Add new field
//     formFields.add(newFieldData);
//   }

//   addFieldsDisposeController();
//   update();
// }

void addField() {
  if (fieldNameController.text.isEmpty) {
    showSnackBar(
      title: 'Error',
      message: 'Field Name is required',
      icon: Icon(Icons.error, color: Colors.red),
    );
    return;
  }

  final newFieldData = {
    fieldNameController.text: {
      "type": selectedFieldType,
      "required": isRequired.value,
      "show_in_view": isView.value,
      "show_in_report": isReport.value,
      "show_in_edit": isEdit.value,
      "show_in_filter": isFilter.value,
      "show_in_list": isList.value,
      "show_in_add": isAdd.value,

      if (selectedFieldType == 'Char' || selectedFieldType == 'Text') ...{
        "max_length": maxLengthController.text.isNotEmpty
            ? int.tryParse(maxLengthController.text)
            : 100,
        "min_length": minLengthController.text.isNotEmpty
            ? int.tryParse(minLengthController.text)
            : 1,
      },
      
      if (selectedFieldType == 'Choice') "choices": List.from(choices),
      if (selectedFieldType == 'Decimal') ...{
        "max_digits": maxDigitsController.text.isNotEmpty
            ? int.tryParse(maxDigitsController.text)
            : null,
        "decimal_places": decimalPlacesController.text.isNotEmpty
            ? int.tryParse(decimalPlacesController.text)
            : null,
      },

      if (selectedFieldType == 'ManyToMany') ...{
        'to': '${appLabel.text}.${modelName.text.toLowerCase()}',
        'multiple_filter': isMultipleFilter.value,
        'read_fields': ['name'],
        'filter_data': {},
        'related_name': 'sample_show_multi',
      },

      if (selectedFieldType == 'ForeignKey') ...{
        'to': '${appLabel.text}.${modelName.text.toLowerCase()}',
        'read_fields': ['name'],
        'filter_data': {},
        'related_name': 'sample_show',
        'import_fields': ['name'],
        'export_fields': ['name'],
      },
      if (selectedFieldType == 'Date' || selectedFieldType == 'DateTime') ...{
        "range_filter": rangeFilter.value,
        "read_only": isReadOnly.value,
      },

      if (selectedFieldType == 'Time' || selectedFieldType == 'Duration')
        "read_only": isReadOnly.value,
    }
  };

  if (editingIndex >= 0) {
    // Update only the selected index instead of removing and re-adding
    formFields[editingIndex] = newFieldData;
    editingIndex = -1;
    _isEditMode.value = false;
  } else {
    // Add new field
    formFields.add(newFieldData);
  }

  addFieldsDisposeController();
  update();

  debugPrint("Updated Fields: ${jsonEncode(formFields)}");
}



  void removeItemField(int index) {
    itemFields.removeAt(index);
    update();
  }

  Map<String, dynamic> generateFieldData() {
    final Map<String, dynamic> fieldData = {
      'type': selectedFieldType,
      ...getFieldOptions(selectedFieldType),
    };

    if (selectedFieldType == 'Choice' && choices.isNotEmpty) {
      fieldData['choices'] = List<List<dynamic>>.from(choices);
    }

    return {fieldNameController.text: fieldData};
  }

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
    case 'Text':
      return {
        ...baseOptions,
        'max_length': int.tryParse(maxLengthController.text) ?? 100,
        'min_length': int.tryParse(minLengthController.text) ?? 1,
      };
    
    // case 'Text':
    //   return {
    //     ...baseOptions,
    //     'max_length': int.tryParse(maxLengthController.text) ?? 1000,
    //     'min_length': int.tryParse(minLengthController.text) ?? 5,
    //   };
    
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
        'range_filter': rangeFilter.value,
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
        'to': '${appLabel.text}.${modelName.text.toLowerCase()}',
        'multiple_filter': isMultipleFilter.value,
        'read_fields': ['name'],
        'filter_data': {},
        'related_name': 'sample_show_multi',
      };

    case 'ForeignKey':
      return {
        ...baseOptions,
        'to': '${appLabel.text}.${modelName.text.toLowerCase()}',
        'read_fields': ['name'],
        'filter_data': {},
        'related_name': 'sample_show',
        'import_fields': ['name'],
        'export_fields': ['name'],
      };

     

    case 'Boolean':
      return {
        ...baseOptions,
        'default': false,
      };
    
    default:
      return baseOptions;
  }
}

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

  // void editField(int index, Map<String, dynamic> field) {
  //   final fieldName = field.keys.first;
  //   final fieldData = field[fieldName] as Map<String, dynamic>;
    
  //   fieldNameController.text = fieldName;
  //   selectedFieldType = fieldData['type'];
  //   isRequired.value = fieldData['required'] ?? false;
  //   isMultipleFilter.value = fieldData['multiple_filter'] ?? false;
  //   rangeFilter.value = fieldData['range_filter'] ?? false;
  //   isReadOnly.value = fieldData['read_only'] ?? false;
  //   isView.value = fieldData['show_in_view'] ?? false;
  //   isReport.value = fieldData['show_in_report'] ?? false;
  //   isEdit.value = fieldData['show_in_edit'] ?? false;
  //   isFilter.value = fieldData['show_in_filter'] ?? false;
  //   isList.value = fieldData['show_in_list'] ?? false;
  //   isAdd.value = fieldData['show_in_add'] ?? false;

  //   // Clear existing choices and populate if it's a Choice field
  //   choices.clear();
  //   if (fieldData['type'] == 'Choice' && fieldData['choices'] != null) {
  //     choices.addAll(List<List<dynamic>>.from(fieldData['choices']));
  //     nextChoiceId.value = choices.isNotEmpty ?
  //       (choices.map((c) => c[0] as int).reduce(max) + 1) : 1;
  //   }

  //   // Handle type-specific fields
  //   if (fieldData['type'] == 'Char' || fieldData['type'] == 'Text') {
  //     maxLengthController.text = fieldData['max_length']?.toString() ?? '';
  //     minLengthController.text = fieldData['min_length']?.toString() ?? '';
  //   }

  //   if (fieldData['type'] == 'Decimal') {
  //     maxDigitsController.text = fieldData['max_digits']?.toString() ?? '';
  //     decimalPlacesController.text = fieldData['decimal_places']?.toString() ?? '';
  //   }

  //   // If it's a Children field, populate itemFields
  //   if (fieldData['type'] == 'Children' && fieldData['fields'] != null) {
  //     itemFields.clear();
  //     final fields = fieldData['fields'] as Map<String, dynamic>;
  //     fields.forEach((key, value) {
  //       itemFields.add({key: value});
  //     });
  //   }

  //   editingIndex = index;
  //   update();
  // }

  void deleteField(String fieldName) {
    for (int i = 0; i < formFields.length; i++) {
      var entry = formFields[i];
      
      // Check if the current map contains the field to be deleted
      if (entry.containsKey(fieldName)) {
        // Remove just that specific field from the map
        entry.remove(fieldName);
        
        // If the map is now empty after removing the field, remove the entire map
        if (entry.isEmpty) {
          formFields.removeAt(i);
        }
        update();
        return;
      }
    }
  }

  createDynamicData() async {
      if (appLabel.text.isEmpty || modelName.text.isEmpty || formFields.isEmpty) {
        showSnackBar(
          title: 'Error',
          message: 'App Label, Model Name, and at least one Field are required',
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

    debugPrint('sending json data to:::::: ${json.encode(postData)}');

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

  // Update Bool Values      Methods
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

  void disposeController() {
    submit = false;
    appLabel.clear();
    modelName.clear();
    formFields.clear();
    itemFields.clear();
    addFieldsDisposeController();
  }

  // void addFieldsDisposeController() {
  //   dynamicDetails = GetDynamicViewById();
  //   editingIndex = -1;
  //   fieldNameController.clear();
  //   maxLengthController.clear();
  //   minLengthController.clear();
  //   maxDigitsController.clear();
  //   decimalPlacesController.clear();
  //   choiceController.clear();
  //   choices.clear();
  //   nextChoiceId.value = 1;
    
  //   isRequired.value = false;
  //   isMultipleFilter.value = false;
  //   rangeFilter.value = false;
  //   isReadOnly.value = false;
  //   isAdd.value = false;
  //   isList.value = false;
  //   isFilter.value = false;
  //   isEdit.value = false;
  //   isReport.value = false;
  //   isView.value = false;
  //   selectedFieldType = 'Char';
  //   selectedChildrenFieldType = 'Char';
  // }

  @override
  void onClose() {
    appLabel.dispose();
    modelName.dispose();
    fieldNameController.dispose();
    maxLengthController.dispose();
    minLengthController.dispose();
    maxDigitsController.dispose();
    decimalPlacesController.dispose();
    choiceController.dispose();
    super.onClose();
  }

  final _dynamicList = <GetDynamicData>[].obs;
  List<GetDynamicData> get dynamicList => _dynamicList;
  set dynamicList(value) => _dynamicList;

  final RxInt _dynamicListCount = 0.obs;
  get dynamicListCount => _dynamicListCount.value;
  set dynamicListCount(value) => _dynamicListCount.value = value;

  final RxInt _currentPage = 1.obs;
  get currentPage => _currentPage.value;
  set currentPage(value) => _currentPage.value = value;

  final RxInt _totalPages = 1.obs;
  get totalPages => _totalPages.value;
  set totalPages(value) => _totalPages.value = value;

  initGetDynamicListState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isRefresh = true;
      getDynamicList();
      update();
    });
  }

  // getDynamicList({bool isLoading = true}) async {
  //   if (isRefresh) {
  //     _dynamicList.value = <GetDynamicData>[];
  //     currentPage = 1;
  //   } else {
  //     if (currentPage > totalPages) {
  //       return false;
  //     }
  //   }
  //   final filterParams = <String, dynamic>{
  //     'page': currentPage,
  //     'page_size': CommonService.instance.pageSize,
  //   };
  //   print('filter params $filterParams');
  //   try {
  //     final data = await DynamicRepo().getDynamicList(filterParams);
  //     if (data != null) {
  //       dynamicListCount = data.count;
  //       _dynamicList.value = [...dynamicList, ...data.results ?? []];
  //       var seen = <String>{};
  //       List<GetDynamicData> filtered = _dynamicList.where((field) => seen.add(field.id!.toString())).toList();
  //       _dynamicList.value = filtered;
  //       isRefresh = false;
  //       // closeLoadingDialog();
  //       totalPages = (dynamicListCount / CommonService.instance.pageSize).ceil();
  //       currentPage++;
  //       update();
  //       return true;
  //     } else {
  //       closeLoadingDialog();
  //       return false;
  //     }
  //   } catch (e) {
  //     closeLoadingDialog();
  //     debugPrint("users error: $e");
  //     // return false;
  //     rethrow;
  //   }
  // }

  getDynamicList({bool isLoading = true}) async {
    _dynamicList.value = <GetDynamicData>[];

    final filterParams = <String, dynamic>{};

    print('filter params getDynamicList :::::::  $filterParams');

    try {
      final data = await DynamicRepo().getDynamicList(filterParams);

      if (data != null) {
        _dynamicList.value = data.results ?? [];
        var seen = <String>{};
        List<GetDynamicData> filtered = _dynamicList.where((field) => seen.add(field.id!.toString())).toList();
        _dynamicList.value = filtered;

        update();
        return true;
      } else {
        closeLoadingDialog();
        return false;
      }
    } catch (e) {
      closeLoadingDialog();
      debugPrint("users error: $e");
      rethrow;
    }
  }


  final _dynamicDetails = GetDynamicViewById().obs;
  GetDynamicViewById get dynamicDetails => _dynamicDetails.value;
  set dynamicDetails(value) => _dynamicDetails.value = value;

  getDynamicDetails(id, {bool navigation = true}) async {
    showLoadingDialog();
    try {
      final data = await DynamicRepo().getDynamicDetails(id);
      if (data != null) {
        _dynamicDetails.value = data;
        print("Print Fields ::::::::::::::${_dynamicDetails.value.fields1}");

        if(_dynamicDetails.value.fields1!=null && _dynamicDetails.value.fields1.isNotEmpty){
          formFields.value = [_dynamicDetails.value.fields1];
        }

        update();
        closeLoadingDialog();
        navigation == true ? Get.toNamed(Routes.dashboardView) : null;
      } else {
        debugPrint("Api Error Response error:: ");
        closeLoadingDialog();
        return false;
      }
    } catch (e) {
      closeLoadingDialog();

      debugPrint("Api  Response error:: $e ");
      rethrow;
    }
  }

  initEditState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (dynamicDetails.id != null) {
        _isEditMode.value = true;
        _initializeFields();
      } else {
        _isEditMode.value = false;
        isRefresh = true;
        disposeController();
      }
      update();
    });
  }

  void _initializeFields() {
    appLabel.text = dynamicDetails.appLabel ?? '';
    modelName.text = dynamicDetails.modelName ?? '';
    update();
  }

  updateModelName(Map<String, dynamic> updateData) async {
    try {
      showLoadingDialog();
      submit = true;
      
      updateData = {
        "app_label": appLabel.text,
        "model_name": modelName.text,
        "fields": jsonEncode(formFields.fold<Map<String, dynamic>>(
          {},
          (map, element) => {...map, ...element},
        ))
      };
      
      final response = await DynamicRepo().updateModelName(
        updateData,
        dynamicDetails.id,
      );
      
      if (response != null) {
        showSnackBar(
          title: 'Success',
          message: 'Model Name Updated Successfully.',
          icon: Icon(Icons.check, color: Colors.green),
        );
        isRefresh = true;
        Get.toNamed(Routes.listScreen);
        // await getDynamicList();
        Get.back();
      }
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update model name: ${e.toString()}',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
      );
      debugPrint("Update Error: $e");
    } finally {
      submit = false;
      closeLoadingDialog();
    }
  }
}