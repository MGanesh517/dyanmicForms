import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
import 'package:implementation_panel/Screens/Dashboard/Dropdown/model_details_Drodown_keys.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Create%20Data/common_component.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/ModelName_validator_list_model.dart';
import 'package:implementation_panel/Screens/Dashboard/advance%20Filters/advance_filter_controller.dart';
import 'package:implementation_panel/Screens/Dashboard/advance%20Filters/advance_filters_screen.dart';
import 'package:toastification/toastification.dart';

class BuildFieldWidget extends StatefulWidget {
  const BuildFieldWidget({super.key});

  @override
  State<BuildFieldWidget> createState() => _BuildFieldWidgetState();
}

class _BuildFieldWidgetState extends State<BuildFieldWidget> {
  final controller = Get.put(DynamicController());
  final advanceFilterController = Get.put(AdvancedFilterController());
  final formKey = GlobalKey<FormState>();
  final fieldKey = GlobalKey<FormState>();
  final childFieldKey = GlobalKey<FormState>();
  final childItemsSubmitKey = GlobalKey<FormState>();
  int index = 0;

  Widget buildFieldList() {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1.0),
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              child: DataTable(
                showCheckboxColumn: true,
                checkboxHorizontalMargin: 10.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                dataTextStyle: const TextStyle(fontWeight: FontWeight.w400),
                headingRowColor: const WidgetStatePropertyAll(Color(0xfff7fafc)),
                dataRowColor: WidgetStatePropertyAll(Color(0xffffffff)),
                columns: <DataColumn>[
                  DataColumn(label: Text('S.No',  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Field Name' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Type' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Verbose Name', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black))),
                  DataColumn(label: Text('Verbose Name Plural',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black))),
                  DataColumn(label: Text('Required' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in View' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Report' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Edit' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in List' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Add' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Choices' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('To' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Related Name',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black))),
                  DataColumn(label: Text('Min Length' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Max Length' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Read Only' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Max Digits' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Decimal Places' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Range Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Default' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Multiple Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Actions' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                ],
                rows: controller.formFields.isEmpty
                    ? const []
                    : controller.formFields.expand((entry) {
                        index = 0;
                        return entry.entries.map((field) {
                          final fieldName = field.key;
                          index++;
                          final attributes = field.value as Map<String, dynamic>;
                          return DataRow(cells: [
                            DataCell(Text('${controller.dynamicDetails.fields1 != null ? index : controller.formFields.indexOf(entry) + 1}')),
                            DataCell(Text(fieldName)),
                            DataCell(Text(attributes['type'].toString())),
                            DataCell(Text(attributes['verbose_name'].toString())),
                            DataCell(Text(attributes['verbose_name_plural'].toString())),
                            DataCell(Text(attributes['required']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_view']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_report']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_edit']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_filter']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_list']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_add']?.toString() ?? "-")),
                            DataCell(attributes['type'] == 'Choice' && attributes['choices'] != null
                                                    ? Container(
                                                      margin: EdgeInsets.all(5.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        border: Border.all(color: Colors.grey.shade300)
                                                      ),
                                                      child: DropdownButton<String>(
                                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                                        menuMaxHeight: 150,
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        dropdownColor: Theme.of(context).colorScheme.secondary,
                                                           value: (attributes['choices'] as List).isNotEmpty
                                                                ? (attributes['choices'] as List)[0][1].toString()
                                                                : null,
                                                          items: (attributes['choices'] as List).map<DropdownMenuItem<String>>((choice) {
                                                            return DropdownMenuItem<String>(
                                                              value: choice[1].toString(),
                                                              child: Text(choice[1].toString()),
                                                            );
                                                          }).toList(),
                                                          onChanged: (String? newValue) {
                                                            print('Selected: $newValue');
                                                          },
                                                        ),
                                                    )
                                                    : Text("-"),
                                                ),
                            DataCell(Text(attributes['to']?.toString() ?? "-")),
                            DataCell(Text(attributes['related_name']?.toString() ?? "-")),
                            DataCell(Text(attributes['min_length']?.toString() ?? "-")),
                            DataCell(Text(attributes['max_length']?.toString() ?? "-")),
                            DataCell(Text(attributes['read_only']?.toString() ?? "-")),
                            DataCell(Text(attributes['max_digits']?.toString() ?? "-")),
                            DataCell(Text(attributes['decimal_places']?.toString() ?? "-")),
                            DataCell(Text(attributes['range_filter']?.toString() ?? "-")),
                            DataCell(Text(attributes['default']?.toString() ?? "-")),
                            DataCell(Text(attributes['multiple_filter']?.toString() ?? "-")),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    controller.editField(controller.formFields.indexOf(entry), entry);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // controller.formFields.removeAt(controller.formFields.indexOf(entry));
                                    // controller.update();
                                    controller.deleteField(fieldName);
                                  },
                                ),
                              ],
                            )),
                          ]);
                        }).toList();
                      }).toList(),
              ),
            ),
          ),
        ),
      );
    });
  }

Widget buildChildFieldList() {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1.0),
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              child: DataTable(
                showCheckboxColumn: true,
                checkboxHorizontalMargin: 10.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                dataTextStyle: const TextStyle(fontWeight: FontWeight.w400),
                headingRowColor: const WidgetStatePropertyAll(Color(0xfff7fafc)),
                dataRowColor: WidgetStatePropertyAll(Color(0xffffffff)),
                columns: <DataColumn>[
                  DataColumn(label: Text('S.No',  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Field Name' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Child Type' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Verbose Name', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black))),
                  DataColumn(label: Text('Verbose Name Plural',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black))),
                  DataColumn(label: Text('Required' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in View' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Report' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Edit' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in List' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Add' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Choices' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('To' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Related Name',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black))),
                  DataColumn(label: Text('Min Length' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Max Length' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Read Only' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Max Digits' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Decimal Places' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Range Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Default' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Multiple Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Actions' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                ],
                rows: controller.itemFields.isEmpty
                    ? const []
                    : controller.itemFields.expand((entry) {
                        index = 0;
                        return entry.entries.map((field) {
                          final fieldName = field.key;
                          index++;
                          final attributes = field.value as Map<String, dynamic>;
                          return DataRow(cells: [
                            DataCell(Text('${controller.dynamicDetails.fields1 != null ? index : controller.itemFields.indexOf(entry) + 1}')),
                            DataCell(Text(fieldName)),
                            DataCell(Text(attributes['type'].toString())),
                            DataCell(Text(attributes['verbose_name'].toString())),
                            DataCell(Text(attributes['verbose_name_plural'].toString())),
                            DataCell(Text(attributes['required']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_view']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_report']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_edit']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_filter']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_list']?.toString() ?? "-")),
                            DataCell(Text(attributes['show_in_add']?.toString() ?? "-")),
                            DataCell(attributes['type'] == 'Choice' && attributes['choices'] != null
                                                    ? Container(
                                                      margin: EdgeInsets.all(5.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        border: Border.all(color: Colors.grey.shade300)
                                                      ),
                                                      child: DropdownButton<String>(
                                                        menuMaxHeight: 150,
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        dropdownColor: Theme.of(context).colorScheme.secondary,
                                                          value: null,
                                                          items: (attributes['choices'] as List).map<DropdownMenuItem<String>>((choice) {
                                                            return DropdownMenuItem<String>(
                                                              value: choice[1].toString(),
                                                              child: Text(choice[1].toString()),
                                                            );
                                                          }).toList(),
                                                          onChanged: (String? newValue) {
                                                            print('Selected: $newValue');
                                                          },
                                                        ),
                                                    )
                                                    : Text("-"),
                                                ),
                            DataCell(Text(attributes['to']?.toString() ?? "-")),
                            DataCell(Text(attributes['related_name']?.toString() ?? "-")),
                            DataCell(Text(attributes['min_length']?.toString() ?? "-")),
                            DataCell(Text(attributes['max_length']?.toString() ?? "-")),
                            DataCell(Text(attributes['read_only']?.toString() ?? "-")),
                            DataCell(Text(attributes['max_digits']?.toString() ?? "-")),
                            DataCell(Text(attributes['decimal_places']?.toString() ?? "-")),
                            DataCell(Text(attributes['range_filter']?.toString() ?? "-")),
                            DataCell(Text(attributes['default']?.toString() ?? "-")),
                            DataCell(Text(attributes['multiple_filter']?.toString() ?? "-")),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    controller.editField(controller.itemFields.indexOf(entry), entry);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // controller.formFields.removeAt(controller.formFields.indexOf(entry));
                                    // controller.update();
                                    controller.deleteField(fieldName);
                                  },
                                ),
                              ],
                            )),
                          ]);
                        }).toList();
                      }).toList(),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: fieldKey,
            child: Obx(() => FieldManagementComponent(
                isInDialog: false,
                fieldNameText: "Enter Field Name",
                fieldNameLabelText: "Field Name",
                fieldNameController: controller.fieldNameController,
                fieldNameLabeText: "Field Name",
                fieldNameValidation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Field Name';
                  }
                  return null;
                },
                // typeHintText: "Select Type",
                // typeLabelText: "Select Type",
                // typeValue: controller.selectedFieldType,
                // typeOnChanged: (value) {
                //   if (value != null) {
                //     controller.selectedFieldType = value;
                //     controller.update();
                //   }
                // },
                // typeItems: controller.fieldTypes
                //     .map((type) => DropdownMenuItem(
                //           value: type,
                //           child: Text(type),
                //         ))
                //     .toList(),


                typeChildWidget: CommonComponents.defaultDropdownSearch(context,
                    title: "Types",
                    showTitle: false,
                    showBottomSheet: false,
                    //  asyncItems: (String? filter) async => await fetchMasterList(fieldName: title),
                    items: controller.fieldTypes,
                    onChanged:  (value) {
                          if (value != null) {
                            controller.selectedFieldType =  value;
                            controller.update();
                        }},
                        compareFn: (i, dynamic s) => i == s,
                        itemAsString: (dynamic u) => u.toString(),
                      ),

                choiceOnTap: () {
                  print('asdasas ${jsonEncode(controller.choices)}');
                  controller.addChoice();
                  // controller.update();
                },
                foreignKeyHintText: "To",
                foreignKeyLabelText: "To",
                // foreignKeyValue: controller.modelNameList.isNotEmpty ? controller.modelNameList.first.verboseName : null,
                foreignKeyValue: controller.selectedModelName?.verboseName,
                foreignKeyOnChanged: (String? newValue) {
                  if (newValue != null) {
                    DynamicModelsNameData selectedModel =
                        controller.modelNameList.firstWhere(
                      (element) => element.verboseName == newValue,
                      orElse: () => DynamicModelsNameData(
                          appName: "", modelName: "", verboseName: newValue),
                    );
                    controller.selectedModelName = selectedModel;

                    // Fetch fields based on selected model
                    controller.getModelDetailsDropdown(
                        selectedModel.appName ?? "",
                        selectedModel.modelName ?? "");
                    controller.update();
                  }
                },
                foreignKeyItems:
                    controller.modelNameList.map((DynamicModelsNameData item) {
                  return DropdownMenuItem<String>(
                    value: item.verboseName,
                    child: Text(item.verboseName ?? ""),
                  );
                }).toList(),
                childMultiSelectDrop: Column(
                  children: [
                    Obx(() => DropdownButton<String>(
                          alignment: AlignmentDirectional.centerStart,
                          isExpanded: true,
                          hint: Text("Select Field"),
                          dropdownColor:
                              Theme.of(context).colorScheme.secondary,
                          underline: const SizedBox(),
                          value: controller.selectedFields.isNotEmpty
                              ? controller.selectedFields.first
                              : null,
                          items: controller.fieldsList.map((Field item) {
                            return DropdownMenuItem<String>(
                              value: item.name,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item.verboseName ?? item.name ?? ""),
                                  Checkbox(
                                    value: controller.selectedFields
                                        .contains(item.name),
                                    onChanged: (bool? value) {
                                      print(
                                          "printn the seleced field ${item.name}");
                                      if (value != null) {
                                        controller
                                            .toggleFieldSelection(item.name!);
                                        controller.update();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            if (val != null) {
                              debugPrint("Selected Field: ");
                            }
                          },
                        )),
                    Wrap(
                      spacing: 1.0,
                      children: controller.selectedFields.map((field) {
                        return Chip(
                          color: WidgetStatePropertyAll(Colors.white),
                          label: Text(field),
                          deleteIcon: Icon(Icons.close),
                          onDeleted: () {
                            controller.toggleFieldSelection(field);
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
                addedChoiceHintText: "Added Choice",
                addedChoiceLabelText: "Added Choice",
                // addedChoiceValue: controller.choices.isNotEmpty ? controller.choices[0][1] : null,
                addedChoiceOnChanged: (value) {},
                addedChoiceItems:
                    controller.choices.map<DropdownMenuItem<String>>((choice) {
                  return DropdownMenuItem<String>(
                    value: choice[1],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(choice[1], overflow: TextOverflow.ellipsis),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            controller.removeChoice(choice);
                            controller.update();
                          },
                        ),
                      ],
                    ),
                  );
                }).toList(),
                addedChoiceValidator: (value) {
                  if (controller.choices.isEmpty) {
                    return 'Please enter atleast One choice';
                  }
                  return null;
                },
                choiceText: "Enter Choice",
                choiceController: controller.choiceController,
                choiceLabeText: "Add Choice",
                requiredCheckBoxName: "Required",
                requiredValue: controller.isRequired.value,
                requiredOnChanged: (bool? value) {
                  if (value != null) {
                    controller.updateRequired(value);
                  }
                },
                showViewCheckBoxName: "Show In View",
                showViewValue: controller.isView.value,
                showViewOnChanged: (bool? value) {
                  if (value != null) {
                    controller.updateViewOnly(value);
                  }
                },
                showEditCheckBoxName: "Show In Edit",
                showEditValue: controller.isEdit.value,
                showEditOnChanged: (bool? value) {
                  if (value != null) {
                    controller.updateEditOnly(value);
                  }
                },
                showReportCheckBoxName: "Show In Report",
                showReportValue: controller.isReport.value,
                showReportOnChanged: (bool? value) {
                  if (value != null) {
                    controller.updateReportOnly(value);
                  }
                },
                showAddCheckBoxName: "Show In Add",
                showAddValue: controller.isAdd.value,
                showAddOnChanged: (bool? value) {
                  if (value != null) {
                    controller.updateAddOnly(value);
                  }
                },
                showListCheckBoxName: "Show In List",
                showListValue: controller.isList.value,
                showListOnChanged: (bool? value) {
                  if (value != null) {
                    controller.updateListOnly(value);
                  }
                },
                showFilterCheckBoxName: "Show In Filter",
                showFilterValue: controller.isFilter.value,
                showFilterOnChanged: (bool? value) {
                  if (value != null) {
                    controller.updateFilterOnly(value);
                  }
                },
                showMultipleFilterCheckBoxName: "Multiple Filter",
                showMultipleFilterValue: controller.isMultipleFilter.value,
                showMultipleFilterOnChanged: (bool? value) {
                  if (value != null) {
                    controller.updateMultipleFilter(value);
                  }
                },
                rangeFilterCheckBoxName: "Range Filter",
                rangeFilterValue: controller.rangeFilter.value,
                rangeFilterOnChanged: (bool? value) {
                  if (value != null) {
                    controller.updateRangeFilter(value);
                  }
                },
                readOnlyCheckBoxName: "Read Only",
                readOnlyValue: controller.isReadOnly.value,
                readOnlyOnChanged: (bool? value) {
                  if (value != null) {
                    controller.updateReadOnly(value);
                  }
                },
                defaultCheckBoxName: "Default",
                defaultValue: controller.isDefault.value,
                defaultOnChanged: (bool? value) {
                  if (value != null) {
                    controller.updateDefault(value);
                  }
                },
                maxLengthText: "Enter Max Length",
                maxLengthLabelText: "Max Length",
                maxLengthController: controller.maxLengthController,
                maxLengthLabeText: "Max Length",
                // maxLengthValidation: (value) {
                //         if (value == null || value.isEmpty) {
                //           // return 'Please enter Max Length';
                //           toastification.show(
                //           context: context,
                //           title: Text('Please enter Max Length', style: TextStyle(fontWeight: FontWeight.w500)),
                //           type: ToastificationType.warning,
                //           closeButtonShowType: CloseButtonShowType.always,
                //           showIcon: true,
                //           style: ToastificationStyle.minimal,
                //           progressBarTheme: ProgressIndicatorThemeData(linearMinHeight: 1),
                //           autoCloseDuration: const Duration(seconds: 5),
                //         );
                //         }
                //         return null;
                //       },
                maxLengthValidation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter Max Length';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Max Length must be a number';
                  }
                  return null;
                },
                verboseNameText: "Enter Verbose Name",
                verboseNameLabeText: "Verbose Name",
                verboseNameController: controller.verboseNameFields,
                verboseNameLabelText: "Verbose Name",
                verboseNameOnChange: (val) =>
                    controller.updateVerboseNamePluralFields(),
                // verboseNameValidation: (value) {
                //   if (value == null || value.trim().isEmpty) {
                //     return 'Please enter Verbose Name';
                //   }
                //   return null;
                // },

                verboseNamePluralText: "Enter Verbose Name Plural",
                verboseNamePluralLabeText: "Verbose Name Plural",
                verboseNamePluralController: TextEditingController(
                    text: controller.verboseNamePluralFields.value),
                verboseNamePluralLabelText: "Max Length",
                minLengthText: "Enter Min Length",
                minLengthLabelText: "Min Length",
                minLengthController: controller.minLengthController,
                minLengthLabeText: "Min Length",
                relatedNameText: "Enter Related Name",
                relatedNameLabelText: "Related Name",
                relatedNameController: controller.relatedNameController,
                relatedNameLabeText: "Related Name",
                relatedNameValidation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Related Name';
                  }
                  return null;
                },
                maxDigitsText: "Enter Max Digits",
                maxDigitsLabelText: "Max Digits",
                maxDigitsController: controller.maxDigitsController,
                maxDigitsLabeText: "Max Digits",
                maxDigitsValidation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Max Digits';
                  }
                  return null;
                },
                decimalText: "Enter Decimal Place",
                decimalLabelText: "Decimal Place",
                decimalController: controller.decimalPlacesController,
                decimalLabeText: "Decimal Place",
                decimalValidation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Decimal Place';
                  }
                  return null;
                },
                clearButtonText: "Clear",
                clearButtonOnTap: () {
                  print(
                      "Printing the formfiedls Data ${jsonEncode(controller.formFields)}");
                  controller.addFieldsDisposeController();
                  controller.update();
                },
                submitButtonText:
                    controller.editingIndex >= 0 ? "Update Field" : "Add Field",
                submitButtonOnTap: () {
                  print(
                      "Printing the form fields Data::::::: ${jsonEncode(controller.formFields)}");
                  if (fieldKey.currentState?.validate() ?? false) {
                    //   if (controller.fieldNameController.text.trim().isEmpty) {
                    //     toastification.show(
                    //           context: context,
                    //           title: Text('Field Name Is Required', style: TextStyle(fontWeight: FontWeight.w500)),
                    //           type: ToastificationType.warning,
                    //           closeButtonShowType: CloseButtonShowType.always,
                    //           showIcon: true,
                    //           style: ToastificationStyle.minimal,
                    //           progressBarTheme: ProgressIndicatorThemeData(linearMinHeight: 1),
                    //           autoCloseDuration: const Duration(seconds: 5),
                    //         );
                    //   return;
                    // }
                    controller.addField();
                    controller.update();
                  }
                },
                filterOnTap: () async {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return GetBuilder<DynamicController>(
                        initState: (_) {
                          // DynamicController.to.initDialogBoxState();
                        },
                        builder: (_) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Advance Filters",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                // IconButton(
                                //   icon: const Icon(Icons.close),
                                //   onPressed: () {
                                //     Navigator.of(context).pop();
                                //     // controller.Dispose
                                //   },
                                // ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    advanceFilterController.clearFilters();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                            content: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: AdvancedFiltersScreen(),
                            ),
                          );
                        },
                      );
                    },
                  );
                }))),
        if (controller.selectedFieldType == "Children")
          Column(
            children: [
              Builder(
                builder: (context) {
                  final fieldName = controller.fieldNameController.text.trim();
                  // final verboseName = controller.verboseNameFields.text.trim();
                  // if (fieldName.isNotEmpty && controller.selectedFieldType == 'Children' && verboseName.isNotEmpty) {
                  if (fieldName.isNotEmpty && controller.selectedFieldType == 'Children') {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return GetBuilder<DynamicController>(
                            initState: (_) {
                              DynamicController.to.initDialogBoxState();
                              DynamicController.to.fieldNameController.text = fieldName;
                            },
                            builder: (_) {
                              return Form(
                                key: childItemsSubmitKey,
                                child: AlertDialog(
                                  actionsAlignment: MainAxisAlignment.center,
                                  actions: [
                                    Container(
                                      width: 100,
                                      color: Theme.of(context).colorScheme.secondary,
                                      child: MaterialButton(
                                        elevation: 2,
                                        onPressed: () {
                                          // First check form validation
                                          if (!(childItemsSubmitKey.currentState?.validate() ?? false)) {
                                            // Close dialog if form validation fails
                                            Navigator.pop(context);
                                            return;
                                          }
                                          
                                          // Check if empty fields
                                          if (controller.itemFields.isEmpty) {
                                            // Show toast but also close dialog
                                            toastification.show(
                                              context: context,
                                              title: Text('Please add at least one child field', 
                                                  style: TextStyle(fontWeight: FontWeight.w500)),
                                              type: ToastificationType.warning,
                                              closeButtonShowType: CloseButtonShowType.always,
                                              showIcon: true,
                                              style: ToastificationStyle.minimal,
                                              progressBarTheme: ProgressIndicatorThemeData(linearMinHeight: 1),
                                              autoCloseDuration: const Duration(seconds: 5),
                                            );
                                            Navigator.pop(context);
                                            return;
                                          }

                                          // Check for duplicate field names immediately
                                          bool isDuplicate = controller.formFields.any(
                                              (field) => field.containsKey(fieldName));
                                          
                                          // Close dialog regardless of duplicate check result
                                          Navigator.pop(context);
                                          
                                          // Show error toast after dialog closes if duplicate exists
                                          if (isDuplicate) {
                                            // Small delay to ensure dialog is closed before showing toast
                                            Future.delayed(Duration(milliseconds: 100), () {
                                              toastification.show(
                                                context: context,
                                                title: Text('Field name "$fieldName" already exists!',
                                                    style: TextStyle(fontWeight: FontWeight.w500)),
                                                type: ToastificationType.error,
                                                closeButtonShowType: CloseButtonShowType.always,
                                                showIcon: true,
                                                style: ToastificationStyle.minimal,
                                                progressBarTheme: ProgressIndicatorThemeData(linearMinHeight: 1),
                                                autoCloseDuration: const Duration(seconds: 5),
                                              );
                                            });
                                            return;
                                          }
                                          
                                          // If no duplicates, add the fields
                                          final childFields = controller.itemFields.fold<Map<String, dynamic>>(
                                            {},
                                            (map, element) => {...map, ...element},
                                          );

                                          controller.formFields.add({
                                            fieldName: {
                                              "type": "Children",
                                              "fields": childFields
                                            }
                                          });
                                        },
                                        height: 50,
                                        minWidth: 100,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Done",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Enter Items"),
                                      IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: Icon(Icons.close_rounded),
                                      )
                                    ],
                                  ),
                                  content: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Form(
                                              key: childFieldKey,
                                              child: Obx(
                                                () => FieldManagementComponent(
                                                  isInDialog: true,

                                                  fieldNameText:
                                                      "Enter Field Name",
                                                  fieldNameLabelText:
                                                      "Field Name",
                                                  fieldNameController:
                                                      controller
                                                          .fieldNameController,
                                                  fieldNameLabeText:
                                                      "Field Name",
                                                  fieldNameValidation: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter Field Name';
                                                    }
                                                    return null;
                                                  },

                                                  typeChildWidget: CommonComponents.defaultDropdownSearch(context,
                                                    title: "Types",
                                                    showTitle: false,
                                                    showBottomSheet: false,
                                                    //  asyncItems: (String? filter) async => await fetchMasterList(fieldName: title),
                                                    items: controller.fieldTypes,
                                                    onChanged:  (value) {
                                                          if (value != null) {
                                                            controller.selectedChildrenFieldType =  value;
                                                            controller.update();
                                                        }},
                                                        compareFn: (i, dynamic s) => i == s,
                                                        itemAsString: (dynamic u) => u.toString(),
                                                      ),

                                                  // typeHintText: "Select Type",
                                                  // typeLabelText: "Type",
                                                  // typeValue: controller
                                                  //     .selectedChildrenFieldType,
                                                  // typeOnChanged: (value) {
                                                  //   if (value != null) {
                                                  //     controller
                                                  //             .selectedChildrenFieldType =
                                                  //         value;
                                                  //     controller.update();
                                                  //   }
                                                  // },
                                                  // typeItems: controller
                                                  //     .fieldTypes
                                                  //     .where((type) =>
                                                  //         type != 'Children')
                                                  //     .map((type) =>
                                                  //         DropdownMenuItem(
                                                  //           value: type,
                                                  //           child: Text(type),
                                                  //         ))
                                                  //     .toList(),

                                                  submitButtonText:
                                                      controller.editingIndex >=
                                                              0
                                                          ? "Update Child Field"
                                                          : "Add Child Field",
                                                  submitButtonOnTap: () {
                                                    print(
                                                        "Printing the form fields child Data::::::: ${jsonEncode(controller.itemFields)}");
                                                    if (childFieldKey
                                                            .currentState
                                                            ?.validate() ??
                                                        false) {
                                                      if (controller
                                                          .fieldNameController
                                                          .text
                                                          .trim()
                                                          .isEmpty) {
                                                        toastification.show(
                                                          context: context,
                                                          title: Text(
                                                              'Field Name Is Required',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          type:
                                                              ToastificationType
                                                                  .warning,
                                                          closeButtonShowType:
                                                              CloseButtonShowType
                                                                  .always,
                                                          showIcon: true,
                                                          style:
                                                              ToastificationStyle
                                                                  .minimal,
                                                          progressBarTheme:
                                                              ProgressIndicatorThemeData(
                                                                  linearMinHeight:
                                                                      1),
                                                          autoCloseDuration:
                                                              const Duration(
                                                                  seconds: 5),
                                                        );
                                                        return;
                                                      }
                                                      controller
                                                          .addChildField();
                                                      controller.update();
                                                    }
                                                  },

                                                  // foreignKeyHintText: "To",
                                                  // foreignKeyLabelText: "To",
                                                  // foreignKeyValue: controller.modelNameList.isNotEmpty ? controller.modelNameList.first.verboseName : null,
                                                  // foreignKeyOnChanged: (String? newValue) {
                                                  //         if (newValue != null) {
                                                  //           DynamicModelsNameData? selectedModel = controller.modelNameList.firstWhere(
                                                  //             (element) => element.verboseName == newValue,
                                                  //             orElse: () => DynamicModelsNameData(appName: "", modelName: "", verboseName: newValue),
                                                  //           );
                                                  //           controller.selectedModelName = selectedModel;
                                                  //           controller.update();
                                                  //         }
                                                  //       },
                                                  // foreignKeyItems:  controller.modelNameList
                                                  // .map((DynamicModelsNameData item) => DropdownMenuItem<String>(
                                                  //       value: item.verboseName,
                                                  //       child: Text(item.verboseName!),
                                                  //     ))
                                                  // .toList(),
                                                  foreignKeyHintText: "To",
                                                  foreignKeyLabelText: "To",
                                                  // foreignKeyValue: controller.modelNameList.isNotEmpty ? controller.modelNameList.first.verboseName : null,
                                                  foreignKeyValue: controller.selectedModelName?.verboseName,
                                                  foreignKeyOnChanged: (String? newValue) {
                                                    if (newValue != null) {
                                                      DynamicModelsNameData selectedModel = controller.modelNameList.firstWhere(
                                                        (element) => element.verboseName == newValue,
                                                        orElse: () =>DynamicModelsNameData(
                                                                appName: "",
                                                                modelName: "",
                                                                verboseName: newValue),
                                                      );
                                                      controller.selectedModelName = selectedModel;

                                                      // Fetch fields based on selected model
                                                      controller.getModelDetailsDropdown(
                                                            selectedModel.appName ?? "",
                                                            selectedModel.modelName ?? ""
                                                          );
                                                      controller.update();
                                                    }
                                                  },
                                                  foreignKeyItems: controller.modelNameList.map((DynamicModelsNameData item) {
                                                    return DropdownMenuItem<String>(
                                                      value: item.verboseName,
                                                      child: Text(item.verboseName ?? ""),
                                                    );
                                                  }).toList(),

                                                  // childMultiSelectDrop:
                                                  //   Obx(
                                                  //     ()=> CommonComponents.defaultMultiSelectionDropdownSearch(
                                                  //         context,
                                                  //     title: "Test",
                                                  //       items: controller.fieldsList,
                                                  //       onChanged: (String? val) {
                                                  //                 if (val != null) {
                                                  //                   debugPrint("Selected Field: $val");
                                                  //                 }
                                                  //               },
                                                  //       selectedItem: [],
                                                  //       compareFn: (i, dynamic s) => i == s,
                                                  //       itemAsString: (dynamic u) => u.toString(),
 
                                                  //     ),
                                                  //   ),

                                                  childMultiSelectDrop: Column(
                                                    children: [
                                                      Obx(() => DropdownButton<String>(
                                                                alignment: AlignmentDirectional.centerStart,
                                                                isExpanded: true,
                                                                hint: Text("Select Field"),
                                                                dropdownColor: Theme.of(context).colorScheme.secondary,
                                                                underline: const SizedBox(),
                                                                value: controller.selectedFields.isNotEmpty
                                                                    ? controller.selectedFields.first
                                                                    : null,
                                                                items: controller.fieldsList.map((Field item) {
                                                                  return DropdownMenuItem<String>(
                                                                    value: item.name,
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(item.verboseName ?? item.name ?? ""),
                                                                        Checkbox(
                                                                          value: controller.selectedFields.contains(item.name),
                                                                          onChanged: (bool? value) {
                                                                            print("printn the seleced field ${item.name}");
                                                                            if (value != null) {
                                                                              controller.toggleFieldSelection(item.name!);
                                                                              controller.update();
                                                                            }
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }).toList(),
                                                                onChanged: (String? val) {
                                                                  if (val != null) {
                                                                    debugPrint("Selected Field: $val");
                                                                  }
                                                                },
                                                              )),
                                                      Wrap(
                                                        spacing: 1.0,
                                                        children: controller.selectedFields.map((field) {
                                                          return Chip(
                                                            color: WidgetStatePropertyAll(Colors.white),
                                                            label: Text(field),
                                                            deleteIcon: Icon(Icons.close),
                                                            onDeleted: () {
                                                              controller.toggleFieldSelection(field);
                                                            },
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ],
                                                  ),

                                                  choiceOnTap: () {
                                                    print('asdasas ${jsonEncode(controller.choices)}');
                                                    controller.addChoice();
                                                    // controller.update();
                                                  },
                                                  addedChoiceHintText: "Added Choice",
                                                  addedChoiceLabelText: "Added Choice",
                                                  addedChoiceOnChanged: (value) {},
                                                  addedChoiceItems: controller.choices.map<
                                                              DropdownMenuItem<String>>((choice) {
                                                    return DropdownMenuItem<String>(
                                                      value: choice[1],
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(choice[1],overflow: TextOverflow.ellipsis),
                                                          IconButton(
                                                            icon: const Icon(Icons.delete,
                                                                color: Colors.red),
                                                            onPressed: () {
                                                              controller.removeChoice(choice);
                                                              controller.update();
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),

                                                  choiceText: "Enter Choice",
                                                  choiceController: controller.choiceController,
                                                  choiceLabeText: "Add Choice",

                                                  requiredCheckBoxName: "Required",
                                                  requiredValue: controller.isRequired.value,
                                                  requiredOnChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller.updateRequired(value);
                                                    }
                                                  },

                                                  showViewCheckBoxName: "Show In View",
                                                  showViewValue: controller.isView.value,
                                                  showViewOnChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller.updateViewOnly(value);
                                                    }
                                                  },

                                                  showEditCheckBoxName: "Show In Edit",
                                                  showEditValue: controller.isEdit.value,
                                                  showEditOnChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller.updateEditOnly(value);
                                                    }
                                                  },

                                                  showReportCheckBoxName: "Show In Report",
                                                  showReportValue: controller.isReport.value,
                                                  showReportOnChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller.updateReportOnly(value);
                                                    }
                                                  },

                                                  showAddCheckBoxName: "Show In Add",
                                                  showAddValue: controller.isAdd.value,
                                                  showAddOnChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller.updateAddOnly(value);
                                                    }
                                                  },

                                                  showListCheckBoxName: "Show In List",
                                                  showListValue: controller.isList.value,
                                                  showListOnChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller.updateListOnly(value);
                                                    }
                                                  },

                                                  showFilterCheckBoxName: "Show In Filter",
                                                  showFilterValue: controller.isFilter.value,
                                                  showFilterOnChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller.updateFilterOnly(value);
                                                    }
                                                  },

                                                  showMultipleFilterCheckBoxName: "Multiple Filter",
                                                  showMultipleFilterValue: controller.isMultipleFilter.value,
                                                  showMultipleFilterOnChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller.updateMultipleFilter(value);
                                                    }
                                                  },

                                                  rangeFilterCheckBoxName: "Range Filter",
                                                  rangeFilterValue: controller.rangeFilter.value,
                                                  rangeFilterOnChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller.updateRangeFilter(value);
                                                    }
                                                  },

                                                  readOnlyCheckBoxName: "Read Only",
                                                  readOnlyValue: controller.isReadOnly.value,
                                                  readOnlyOnChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller.updateReadOnly(value);
                                                    }
                                                  },

                                                  defaultCheckBoxName: "Default",
                                                  defaultValue: controller.isDefault.value,
                                                  defaultOnChanged: (bool? value) {
                                                    if (value != null) {
                                                      controller.updateDefault(value);
                                                    }
                                                  },

                                                  maxLengthText: "Enter Max Length",
                                                  maxLengthLabelText: "Max Length",
                                                  maxLengthController: controller.maxLengthController,
                                                  maxLengthLabeText: "Max Length",
                                                  maxLengthValidation: (value) {
                                                    if (value == null ||   value.isEmpty) {
                                                      return 'Please enter Max Length';
                                                    }
                                                    return null;
                                                  },

                                                  minLengthText: "Enter Min Length",
                                                  minLengthLabelText: "Min Length",
                                                  minLengthController: controller.minLengthController,
                                                  minLengthLabeText: "Min Length",

                                                  verboseNameText: "Enter Verbose Name",
                                                  verboseNameLabeText: "Verbose Name",
                                                  verboseNameController: controller.verboseNameFields,
                                                  verboseNameLabelText: "Verbose Name",
                                                  verboseNameOnChange: (val) => controller.updateVerboseNamePluralFields(),
                                                  verboseNameValidation: (value) {
                                                    if (value == null ||   value.trim().isEmpty) {
                                                      return 'Please enter Verbose Name';
                                                    }
                                                    return null;
                                                  },

                                                  verboseNamePluralText: "Enter Verbose Name Plural",
                                                  verboseNamePluralLabeText: "Verbose Name Plural",
                                                  verboseNamePluralController: TextEditingController(
                                                    text: controller.verboseNamePluralFields.value),
                                                  verboseNamePluralLabelText: "Max Length",

                                                  relatedNameText: "Enter Related Name",
                                                  relatedNameLabelText: "Related Name",
                                                  relatedNameController: controller.relatedNameController,
                                                  relatedNameLabeText: "Related Name",

                                                  maxDigitsText: "Enter Max Digits",
                                                  maxDigitsLabelText: "Max Digits",
                                                  maxDigitsController: controller.maxDigitsController,
                                                  maxDigitsLabeText: "Max Digits",
                                                  maxDigitsValidation: (value) {
                                                    if (value == null ||   value.isEmpty) {
                                                      return 'Please enter Max Digits';
                                                    }
                                                    return null;
                                                  },

                                                  decimalText: "Enter Decimal Place",
                                                  decimalLabelText: "Decimal Place",
                                                  decimalController: controller.decimalPlacesController,
                                                  decimalLabeText: "Decimal Place",
                                                  decimalValidation: (value) {
                                                    if (value == null ||   value.isEmpty) {
                                                      return 'Please enter Decimal Place';
                                                    }
                                                    return null;
                                                  },

                                                  clearButtonText: "Clear",
                                                  clearButtonOnTap: () {
                                                    print(   "Printing the Data ${jsonEncode(controller.formFields)}");
                                                    controller.addFieldsDisposeController();
                                                    controller.update();
                                                  },

                                                  filterOnTap: () async {
                                                    showDialog( barrierDismissible: false, context: context, builder: (BuildContext
                                                          context) {
                                                            return GetBuilder<DynamicController>(
                                                          builder: (_) {
                                                            return AlertDialog(
                                                              actionsAlignment: MainAxisAlignment.center,
                                                              title: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text("Advance Filters",
                                                                    style: TextStyle(fontSize:18,fontWeight:FontWeight.w600,color: Colors.grey[800],
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    icon: const Icon(Icons.close),
                                                                    onPressed: () {
                                                                      advanceFilterController.clearFilters();
                                                                      Navigator.of(context).pop();
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              content: SizedBox(
                                                                width: MediaQuery.of(context).size.width * 0.8,
                                                                height: MediaQuery.of(context).size.height * 0.8,
                                                                child: AdvancedFiltersScreen(),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              )),
                                          const SizedBox(height: 16),
                                          Visibility(
                                            visible: controller.itemFields.isNotEmpty,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 16),
                                                Text("Children Fields",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600,
                                                        color: Theme.of(context).colorScheme.primary)),
                                                SizedBox(
                                                  height: 300,
                                                  child: SingleChildScrollView(
                                                    child: buildChildFieldList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    });
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        SizedBox(height: 15.0),
        buildFieldList(),
      ],
    );
  }
}
