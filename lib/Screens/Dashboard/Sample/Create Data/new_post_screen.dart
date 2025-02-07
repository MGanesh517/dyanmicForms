import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/BreakPoints/breakpoints.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
import 'package:implementation_panel/Common/common_service.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Create%20Data/common_component.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/ModelName_validator_list_model.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/get_dynamic_data_list_model.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Repo/dynamic_repo.dart';
import 'package:implementation_panel/Screens/Dashboard/custom_appbar.dart';
import 'package:implementation_panel/utils/loader_util.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:toastification/toastification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(DynamicController());
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
                  DataColumn(label: Text('Required' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in View' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Report' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Edit' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in List' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Add' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Choices' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('To' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
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
                  DataColumn(label: Text('Required' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in View' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Report' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Edit' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in List' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Show in Add' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('Choices' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                  DataColumn(label: Text('To' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
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

  // Widget _buildValidationIcon() {
  //   if (controller.modelName.text.isEmpty) {
  //     return const SizedBox.shrink();
  //   }

  //   return Icon(
  //     controller.isModelNameValid.value 
  //         ? Icons.check_circle 
  //         : Icons.error,
  //     color: controller.isModelNameValid.value 
  //         ? Colors.green 
  //         : Colors.red,
  //     key: ValueKey(controller.isModelNameValid.value),
  //   );
  // }

  

  @override
  Widget build(BuildContext context) {
      print("printng the id builder ::::: ${controller.dynamicDetails.id}");
      // return LayoutBuilder(builder: (context, constraints) {
        return CommonScaffoldWithAppBar(
      body: GetBuilder<DynamicController>(
        initState: (_) => DynamicController.to.initEditState(),
        builder: (value) => SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: () {
                          Get.back();
                          controller.disposeController();

                        }, icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary)),
                        Text(controller.dynamicDetails.id != null
                        ? "Edit Data"
                        : "Create Data",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.primary),),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 0.5, color: Colors.grey)
                      ),
                      child: ResponsiveRow(
                        runSpacing: 10,
                        spacing: 20,
                        columns: [
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.defaultTextFormField(
                              context,
                              title: 'App Label',
                              hintText: 'Enter App Label',
                              readOnly: controller.dynamicDetails.id != null ? true : false,
                              controller: controller.appLabel,
                              validator: (String? val) {
                                if (val?.isEmpty ?? true) {
                                  return 'Please enter a valid App Label';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.defaultTextFormField(
                              context,
                              title: 'Model Name',
                              hintText: 'Enter Model Name',
                              controller: controller.modelName,
                              validator: (String? val) {
                                if (val?.isEmpty ?? true) {
                                  return 'Please enter a valid Model Name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
//                           ResponsiveColumn(
//   ResponsiveConstants().textFormField,
//   child: CommonComponents.defaultTextFormField(
//     context,
//     title: 'Model Name',
//     hintText: 'Enter Model Name',
//     controller: controller.modelName,
//     onChange: (value) {
//       bool exists = controller.dynamicModelNameList
//           .any((model) => model.modelName?.toLowerCase() == value.toLowerCase()); 
//       if (exists) {
//         // Show error snackbar for duplicate name
//         Get.snackbar(
//           'Validation Error',
//           'Model name already exists',
//           backgroundColor: Colors.red.withOpacity(0.1),
//           colorText: Colors.red,
//           duration: const Duration(seconds: 2),
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     },
//     validator: (String? val) {
//       if (val == null || val.isEmpty) {
//         return 'Please enter a valid Model Name';
//       }
//       // Check for special characters and spaces
//       if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(val)) {
//         return 'Only letters, numbers and underscore allowed';
//       }
//       // Check for existing model name
//       bool exists = controller.dynamicModelNameList
//           .any((model) => model.modelName?.toLowerCase() == val.toLowerCase());
//       if (exists) {
//         return 'Model name already exists';
//       }
//       return null;
//     },
//     suffixIcon: Builder(
//       builder: (context) {
//         String currentValue = controller.modelName.text;
//         if (currentValue.isEmpty) {
//           return const SizedBox.shrink();
//         }
//         bool exists = controller.dynamicModelNameList
//             .any((model) => model.modelName?.toLowerCase() == currentValue.toLowerCase());
//         bool hasInvalidChars = !RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(currentValue);
//         // Show red error icon if invalid or exists, green check if valid
//         return Icon(
//           exists || hasInvalidChars ? Icons.error : Icons.check_circle,
//           color: exists || hasInvalidChars ? Colors.red : Colors.green,
//         );
//       },
//     ),
//     keyboardType: TextInputType.text,
//     textInputAction: TextInputAction.next,
//   ),
// )
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                    Text("Add Fields", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.primary)),
                    const SizedBox(height: 16),

                    Column(
                      children: [
                        Form(
                          key: fieldKey,
                          child: Obx(() =>  FieldManagementComponent(
                          
                            isInDialog: false,
                            
                                                fieldNameText: "Enter Field Name",
                                                fieldNameController: controller.fieldNameController,
                                                fieldNameLabeText: "Field Name",
                                                fieldNameValidation: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Please enter Field Name';
                                                        }
                                                        return null;
                                                      },
                                            
                                            
                                                typeHintText: "Select Type",
                                                typeValue: controller.selectedFieldType,
                                                typeOnChanged: (value) {
                                                                if (value != null) {
                                                                  controller.selectedFieldType = value;
                                                                  controller.update();
                                                                }
                                                              },
                                                typeItems: controller.fieldTypes
                                                                  .map((type) => DropdownMenuItem(
                                                                        value: type,
                                                                        child: Text(type),
                                                                      ))
                                                                  .toList(),


                                                choiceOnTap: () {
                                                              print('asdasas ${jsonEncode(controller.choices)}');
                                                              controller.addChoice();
                                                              // controller.update();
                                                            },

                                                
modelNameMastersText: "To",
modelNameMastersItemBuilder:  (context, DynamicModelsNameData? item, isSelected) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: !isSelected
                              ? null
                              : BoxDecoration(
                                  border: Border.all(color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                          child: ListTile(
                            selected: isSelected,
                            title: Text(item?.modelName! ?? ''),
                          ),
                        );
                      },
modelNameMastersItems: (filter, infiniteScrollProps) async {
                        controller.isRefresh = true;
                        await controller.getModelNameList();
                        return controller.modelNameList;
                      },
modelNameMastersOnChanged: (String? data) {},
modelNameMastersCompareFN: (DynamicModelsNameData i, DynamicModelsNameData? s) => i.modelName == s?.modelName,
modelNameMastersItemAsString: (DynamicModelsNameData item) => item.modelName ?? '===',

                                                                
                                                addedChoiceHintText: "Added Choice",
                                                // addedChoiceValue: controller.choices.isNotEmpty ? controller.choices[0][1] : null,
                                                addedChoiceOnChanged: (value) {},
                                                addedChoiceItems: controller.choices
                                                              .map<DropdownMenuItem<String>>((choice) {
                                                            return DropdownMenuItem<String>(
                                                              value: choice[1],
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text(choice[1], overflow: TextOverflow.ellipsis),
                                                                  IconButton(
                                                                    icon:
                                                                        const Icon(Icons.delete, color: Colors.red),
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
                                            
                                                showViewCheckBoxName: "Show View",
                                                showViewValue: controller.isView.value,
                                                showViewOnChanged: (bool? value) {
                                                                      if (value != null) {
                                                                        controller.updateViewOnly(value);
                                                                      }
                                                                    },
                                                
                                                showEditCheckBoxName: "Show Edit",
                                                showEditValue: controller.isEdit.value,
                                                showEditOnChanged: (bool? value) {
                                                                      if (value != null) {
                                                                        controller.updateEditOnly(value);
                                                                      }
                                                                    },
                                            
                                                showReportCheckBoxName: "Show Report",
                                                showReportValue: controller.isReport.value,
                                                showReportOnChanged: (bool? value) {
                                                                      if (value != null) {
                                                                        controller.updateReportOnly(value);
                                                                      }
                                                                    },
                                            
                                                showAddCheckBoxName: "Show Add",
                                                showAddValue: controller.isAdd.value,
                                                showAddOnChanged: (bool? value) {
                                                                      if (value != null) {
                                                                        controller.updateAddOnly(value);
                                                                      }
                                                                    },
                                    
                                                showListCheckBoxName: "Show List",
                                                showListValue: controller.isList.value,
                                                showListOnChanged: (bool? value) {
                                                                      if (value != null) {
                                                                        controller.updateListOnly(value);
                                                                      }
                                                                    },
                                            
                                                showFilterCheckBoxName: "Show Filter",
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
                          
                          
                                                minLengthText: "Enter Min Length",
                                                minLengthController: controller.minLengthController,
                                                minLengthLabeText: "Min Length",
                                                // minLengthValidation: (value) {
                                                //         if (value == null || value.isEmpty) {
                                                //           return 'Please enter Min Length';
                                                //         }
                                                //         return null;
                                                //       },
                          
                                                maxDigitsText: "Enter Max Digits",
                                                maxDigitsController: controller.maxDigitsController,
                                                maxDigitsLabeText: "Max Digits",
                                                maxDigitsValidation: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Please enter Max Digits';
                                                        }
                                                        return null;
                                                      },
                          
                                                decimalText: "Enter Decimal Place",
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
                                                        print("Printing the formfiedls Data ${jsonEncode(controller.formFields)}");
                                                        controller.addFieldsDisposeController();
                                                        controller.update();
                                                      },
                          
                                                submitButtonText: controller.editingIndex >= 0
                                                                      ? "Update Field"
                                                                      : "Add Field",
                                                submitButtonOnTap: () {
                                                  print("Printing the form fields Data::::::: ${jsonEncode(controller.formFields)}");
                                                  if(fieldKey.currentState?.validate() ?? false){
                          
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
                                              
                                                ),
                        )),


      
         
      
if(controller.selectedFieldType == "Children")
  Column(
    children: [
      Builder(
        builder: (context) {
          // Auto trigger dialog when field name is not empty
          final fieldName = controller.fieldNameController.text.trim();
          if (fieldName.isNotEmpty && controller.selectedFieldType =='Children') {
            // Use addPostFrameCallback to avoid build-time dialog showing
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
                            // Container(
                            //   width: 100,
                            //   color: Theme.of(context).colorScheme.secondary,
                            //   child: MaterialButton(
                            //     elevation: 2,
                            //     onPressed: () {
                            //       if (childItemsSubmitKey.currentState?.validate() ?? false) {
                            //         if (controller.itemFields.isNotEmpty) {
                            //         final childFields = controller.itemFields.fold<Map<String, dynamic>>(
                            //           {},
                            //           (map, element) => {...map, ...element},
                            //         );
                                    
                            //         controller.formFields.add({
                            //           fieldName: {
                            //             "type": "Children",
                            //             "fields": childFields
                            //           }
                            //         });
                                    
                            //         controller.update();
                            //       }
                            //       Navigator.pop(context);
                            //       }
                                  
                            //     },
                            //     height: 50,
                            //     minWidth: 100,
                            //     color: Theme.of(context).colorScheme.primary,
                            //     shape: const RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.all(Radius.circular(6)),
                            //     ),
                            //     child: Center(
                            //       child: Text(
                            //         "Done",
                            //         style: TextStyle(
                            //           color: Theme.of(context).colorScheme.secondary,
                            //           fontSize: 15,
                            //           fontWeight: FontWeight.w600,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Container(
  width: 100,
  color: Theme.of(context).colorScheme.secondary,
  child: MaterialButton(
    elevation: 2,
    onPressed: () {
      if (childItemsSubmitKey.currentState?.validate() ?? false) {
        if (controller.itemFields.isEmpty) {
          toastification.show(
            context: context,
            title: Text('Please add at least one child field', style: TextStyle(fontWeight: FontWeight.w500)),
            type: ToastificationType.warning,
            closeButtonShowType: CloseButtonShowType.always,
            showIcon: true,
            style: ToastificationStyle.minimal,
            progressBarTheme: ProgressIndicatorThemeData(linearMinHeight: 1),
            autoCloseDuration: const Duration(seconds: 5),
          );
          return;
        }

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
        
        controller.update();
        Navigator.pop(context);
      }
    },
    height: 50,
    minWidth: 100,
    color: Theme.of(context).colorScheme.primary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
    child: Center(
      child: Text(
        "Done",
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
)
                          ],
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Enter Items"),
                              IconButton(onPressed: () {
                                Navigator.pop(context);
                              }, icon: Icon(Icons.close_rounded))
                            ],
                          ),
                          content: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                   Form(
                                    key: childFieldKey,
                                    child: Obx(() => FieldManagementComponent(
                                    
                                                                                                                      isInDialog: true,
                                    
                                                                                                                      
                                                                                                                              fieldNameText: "Enter Field Name",
                                                                                                                              fieldNameController: controller.fieldNameController,
                                                                                                                              fieldNameLabeText: "Field Name",
                                                                                                                              fieldNameValidation: (value) {
                                                                                                                                    if (value == null || value.isEmpty) {
                                                                                                                                      return 'Please enter Field Name';
                                                                                                                                    }
                                                                                                                                    return null;
                                                                                                                                  },
                                                                                                                          
                                                                                                                              typeHintText: "Select Type",
                                                                                                                              typeValue: controller.selectedChildrenFieldType,
                                                                                                                              typeOnChanged: (value) {
                                                                                                                                if (value != null) {
                                                                                                                                  controller.selectedChildrenFieldType = value;
                                                                                                                                  controller.update();
                                                                                                                                }
                                                                                                                              },
                                                                                                                              typeItems: controller.fieldTypes
                                                                                                                                  .where((type) => type != 'Children')
                                                                                                                                  .map((type) => DropdownMenuItem(
                                                                                                                                        value: type,
                                                                                                                                        child: Text(type),
                                                                                                                                      ))
                                                                                                                                  .toList(),
                                                                                                                              
                                                                                                                              // Rest of the FieldManagementComponent properties remain the same,
                                                                                                                              // but update the submitButtonOnTap to use addChildField instead:
                                                                                                                              submitButtonText: controller.editingIndex >= 0
                                                                                                                                  ? "Update Child Field"
                                                                                                                                  : "Add Child Field",
                                                                                                                              submitButtonOnTap: () {
                                                                                                                                        print("Printing the form fields Data::::::: ${jsonEncode(controller.itemFields)}");
                                                                                                                                        if (childFieldKey.currentState?.validate() ?? false) {
                                                                                                                                          if (controller.fieldNameController.text.trim().isEmpty) {
                                                                                                                                          toastification.show(
                                                                                                                                                context: context,
                                                                                                                                                title: Text('Field Name Is Required', style: TextStyle(fontWeight: FontWeight.w500)),
                                                                                                                                                type: ToastificationType.warning,
                                                                                                                                                closeButtonShowType: CloseButtonShowType.always,
                                                                                                                                                showIcon: true,
                                                                                                                                                style: ToastificationStyle.minimal,
                                                                                                                                                progressBarTheme: ProgressIndicatorThemeData(linearMinHeight: 1),
                                                                                                                                                autoCloseDuration: const Duration(seconds: 5),
                                                                                                                                              );
                                                                                                                                        return;
                                                                                                                                      }
                                                                                                                                          controller.addChildField();
                                                                                                                                          controller.update();
                                                                                                                                        }},
                                                                                                                                                                                                                


                                                                                                                                                      
modelNameMastersText: "To",
modelNameMastersItemBuilder:  (context, DynamicModelsNameData? item, isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.modelName ?? ''), // Display the `modelName`
      ),
    );
  },
modelNameMastersItems: (filter, infiniteScrollProps) async {
    controller.isRefresh = true;
    await controller.getModelNameList();
    return controller.modelNameList;
  },
modelNameMastersOnChanged: (String? data) {},
                                                                                    
                                                                                                                                                                                            
                                                                                                                                                                                            
                                                                                                                              choiceOnTap: () {
                                                                                                                                            print('asdasas ${jsonEncode(controller.choices)}');
                                                                                                                                            controller.addChoice();
                                                                                                                                            // controller.update();
                                                                                                                                          },
                                                                                                                              addedChoiceHintText: "Added Choice",
                                                                                                                              // addedChoiceValue: ,
                                                                                                                              addedChoiceOnChanged: (value) {},
                                                                                                                              addedChoiceItems: controller.choices
                                                                                                                                            .map<DropdownMenuItem<String>>((choice) {
                                                                                                                                          return DropdownMenuItem<String>(
                                                                                                                                            value: choice[1],
                                                                                                                                            child: Row(
                                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                              children: [
                                                                                                                                                Text(choice[1], overflow: TextOverflow.ellipsis),
                                                                                                                                                IconButton(
                                                                                                                                                  icon:
                                                                                                                                                      const Icon(Icons.delete, color: Colors.red),
                                                                                                                                                  onPressed: () {
                                                                                                                                                    controller.removeChoice(choice);
                                                                                                                                                    controller.update();
                                                                                                                                                  },
                                                                                                                                                ),
                                                                                                                                              ],
                                                                                                                                            ),
                                                                                                                                          );
                                                                                                                                        }).toList(),
                                                                                                                              // addedChoiceOnTap: ,
                                    
                                                                                                                              // modelNameMastersText: 'To',
                                                                                                                              // modelNameMastersOnTap: controller.getModelNameList,
                                                                                                                              // modelNameMastersOnChanged: (String? newValue) {},
                                                                                                                              // modelNameMastersItems:  controller.modelNameList.map((model) {
                                                                                                                              //       return DropdownMenuItem<String>(
                                                                                                                              //         value: model.modelName,
                                                                                                                              //         child: Text(
                                                                                                                              //           model.verboseName ?? model.modelName ?? '',
                                                                                                                              //           style: const TextStyle(
                                                                                                                              //             fontSize: 14,
                                                                                                                              //           ),
                                                                                                                              //         ),
                                                                                                                              //       );
                                                                                                                              //     }).toList(),
                                                                                                                                                                                                                    
                                                                                                                                                                                                                    
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
                                                                                                                          
                                                                                                                              showViewCheckBoxName: "Show View",
                                                                                                                              showViewValue: controller.isView.value,
                                                                                                                              showViewOnChanged: (bool? value) {
                                                                                                                                                    if (value != null) {
                                                                                                                                                      controller.updateViewOnly(value);
                                                                                                                                                    }
                                                                                                                                                  },
                                                                                                                              
                                                                                                                              showEditCheckBoxName: "Show Edit",
                                                                                                                              showEditValue: controller.isEdit.value,
                                                                                                                              showEditOnChanged: (bool? value) {
                                                                                                                                                    if (value != null) {
                                                                                                                                                      controller.updateEditOnly(value);
                                                                                                                                                    }
                                                                                                                                                  },
                                                                                                                          
                                                                                                                              showReportCheckBoxName: "Show Report",
                                                                                                                              showReportValue: controller.isReport.value,
                                                                                                                              showReportOnChanged: (bool? value) {
                                                                                                                                                    if (value != null) {
                                                                                                                                                      controller.updateReportOnly(value);
                                                                                                                                                    }
                                                                                                                                                  },
                                                                                                                          
                                                                                                                              showAddCheckBoxName: "Show Add",
                                                                                                                              showAddValue: controller.isAdd.value,
                                                                                                                              showAddOnChanged: (bool? value) {
                                                                                                                                                    if (value != null) {
                                                                                                                                                      controller.updateAddOnly(value);
                                                                                                                                                    }
                                                                                                                                                  },
                                                                                                                                                                                                                                    
                                                                                                                              showListCheckBoxName: "Show List",
                                                                                                                              showListValue: controller.isList.value,
                                                                                                                              showListOnChanged: (bool? value) {
                                                                                                                                                    if (value != null) {
                                                                                                                                                      controller.updateListOnly(value);
                                                                                                                                                    }
                                                                                                                                                  },
                                                                                                                          
                                                                                                                              showFilterCheckBoxName: "Show Filter",
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
                                                                                                                              maxLengthController: controller.maxLengthController,
                                                                                                                              maxLengthLabeText: "Max Length",
                                                                                                                              maxLengthValidation: (value) {
                                                                                                                                  if (value == null || value.isEmpty) {
                                                                                                                                    return 'Please enter Max Length';
                                                                                                                                  }
                                                                                                                                  return null;
                                                                                                                                },
                                                                                                                                                                                                                    
                                                                                                                              minLengthText: "Enter Min Length",
                                                                                                                              minLengthController: controller.minLengthController,
                                                                                                                              minLengthLabeText: "Min Length",
                                                                                                                              // minLengthValidation: (value) {
                                                                                                                              //     if (value == null || value.isEmpty) {
                                                                                                                              //       return 'Please enter Min Length';
                                                                                                                              //     }
                                                                                                                              //     return null;
                                                                                                                              //   },
                                                                                                                                                                                                                    
                                                                                                                              maxDigitsText: "Enter Max Digits",
                                                                                                                              maxDigitsController: controller.maxDigitsController,
                                                                                                                              maxDigitsLabeText: "Max Digits",
                                                                                                                              maxDigitsValidation: (value) {
                                                                                                                                  if (value == null || value.isEmpty) {
                                                                                                                                    return 'Please enter Max Digits';
                                                                                                                                  }
                                                                                                                                  return null;
                                                                                                                                },
                                                                                                                                                                                                                    
                                                                                                                              decimalText: "Enter Decimal Place",
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
                                                                                                                                          "Printing the Data ${jsonEncode(controller.formFields)}");
                                                                                                                                      controller.addFieldsDisposeController();
                                                                                                                                      controller.update();
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
                                        Text(
                                          "Children Fields",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context).colorScheme.primary
                                          )
                                        ),
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

// Column(
//   children: [
//     GestureDetector(
//       onTap:() {
//         final fieldName = controller.fieldNameController.text.trim();
//           if (fieldName.isEmpty) {
//                        toastification.show(
//                             context: context,
//                             title: Text('Please enter a field name first', style: TextStyle(fontWeight: FontWeight.w500)),
//                             type: ToastificationType.warning,
//                             // icon: Icon(Icons.close_rounded),
//                             closeButtonShowType: CloseButtonShowType.always,
//                             showIcon: true,
//                             style: ToastificationStyle.minimal,
//                             progressBarTheme: ProgressIndicatorThemeData(linearMinHeight: 1),
//                             autoCloseDuration: const Duration(seconds: 5),
//                           );
//             return;
//           }
//         showDialog(
//           barrierDismissible: false,
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return GetBuilder<DynamicController>(
//                                     // init: DynamicController(),
//                                     initState: (_)  {
//                                       DynamicController.to.initDialogBoxState();
//                                       DynamicController.to.fieldNameController.text = fieldName;
//                                     } ,
//                                     builder: (_) {
//                                       return AlertDialog(
//   actionsAlignment: MainAxisAlignment.center,
//   actions: [
//                       Container(
//                         width: 100,
//                         color: Theme.of(context).colorScheme.secondary,
//                         child: MaterialButton(
//                           elevation: 2,
//                           onPressed: () {
//                             // Wrap child fields with parent field name before closing
//                             if (controller.itemFields.isNotEmpty) {
//                               final childFields = controller.itemFields.fold<Map<String, dynamic>>(
//                                 {},
//                                 (map, element) => {...map, ...element},
//                               );
//                               controller.formFields.add({
//                                 fieldName: {
//                                   "type": "Children",
//                                   "fields": childFields
//                                 }
//                               });
//                               controller.update();
//                             }
//                             Navigator.pop(context);
//                           },
//                           height: 50,
//                           minWidth: 100,
//                           color: Theme.of(context).colorScheme.primary,
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(6)),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Done",
//                               style: TextStyle(
//                                 color: Theme.of(context).colorScheme.secondary,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//   title: Text("Enter Items"),
//   content: Container(
//     width: MediaQuery.of(context).size.width * 0.8, // Set maximum width
//     height: MediaQuery.of(context).size.height * 0.8, // Set maximum height
//     child: SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Obx(() => Form(
//             key: childFieldKey,
//             child: FieldManagementComponent(
//                                                                                                                     isInDialog: true,
//                                                                                                                             fieldNameText: "Enter Field Name",
//                                                                                                                             fieldNameController: controller.fieldNameController,
//                                                                                                                             fieldNameLabeText: "Field Name",
//                                                                                                                             fieldNameValidation: (value) {
//                                                                                                                                   if (value == null || value.isEmpty) {
//                                                                                                                                     return 'Please enter Field Name';
//                                                                                                                                   }
//                                                                                                                                   return null;
//                                                                                                                                 },
//                                                                                                                             typeHintText: "Select Type",
//                                                                                                                             typeValue: controller.selectedChildrenFieldType,
//                                                                                                                             typeOnChanged: (value) {
//                                                                                                                               if (value != null) {
//                                                                                                                                 controller.selectedChildrenFieldType = value;
//                                                                                                                                 controller.update();
//                                                                                                                               }
//                                                                                                                             },
//                                                                                                                             typeItems: controller.fieldTypes
//                                                                                                                                 .where((type) => type != 'Children')
//                                                                                                                                 .map((type) => DropdownMenuItem(
//                                                                                                                                       value: type,
//                                                                                                                                       child: Text(type),
//                                                                                                                                     ))
//                                                                                                                                 .toList(),
//                                                                                                                             // Rest of the FieldManagementComponent properties remain the same,
//                                                                                                                             // but update the submitButtonOnTap to use addChildField instead:
//                                                                                                                             submitButtonText: controller.editingIndex >= 0
//                                                                                                                                 ? "Update Child Field"
//                                                                                                                                 : "Add Child Field",
//                                                                                                                             submitButtonOnTap: () {
//                                                                                                                                       print("Printing the form fields Data::::::: ${jsonEncode(controller.itemFields)}");
//                                                                                                                                       if (childFieldKey.currentState?.validate() ?? false) {
//                                                                                                                                         if (controller.fieldNameController.text.trim().isEmpty) {
//                                                                                                                                         toastification.show(
//                                                                                                                                               context: context,
//                                                                                                                                               title: Text('Field Name Is Required', style: TextStyle(fontWeight: FontWeight.w500)),
//                                                                                                                                               type: ToastificationType.warning,
//                                                                                                                                               closeButtonShowType: CloseButtonShowType.always,
//                                                                                                                                               showIcon: true,
//                                                                                                                                               style: ToastificationStyle.minimal,
//                                                                                                                                               progressBarTheme: ProgressIndicatorThemeData(linearMinHeight: 1),
//                                                                                                                                               autoCloseDuration: const Duration(seconds: 5),
//                                                                                                                                             );
//                                                                                                                                       return;
//                                                                                                                                     }
//                                                                                                                                         controller.addChildField();
//                                                                                                                                         controller.update();
//                                                                                                                                       }
//                                                                                                                                       },
//                                                                                                                             // {
//                                                                                                                             //         print(
//                                                                                                                             //                                       "Printing the itemfields Data ${jsonEncode(controller.itemFields)}");
//                                                                                                                             //   controller.addChildField();
//                                                                                                                             //   controller.update();
//                                                                                                                             // },
//                                                                                                                             choiceOnTap: () {
//                                                                                                                                           print('asdasas ${jsonEncode(controller.choices)}');
//                                                                                                                                           controller.addChoice();
//                                                                                                                                           // controller.update();
//                                                                                                                                         },
//                                                                                                                             addedChoiceHintText: "Added Choice",
//                                                                                                                             // addedChoiceValue: ,
//                                                                                                                             addedChoiceOnChanged: (value) {},
//                                                                                                                             addedChoiceItems: controller.choices
//                                                                                                                                           .map<DropdownMenuItem<String>>((choice) {
//                                                                                                                                         return DropdownMenuItem<String>(
//                                                                                                                                           value: choice[1],
//                                                                                                                                           child: Row(
//                                                                                                                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                                                                             children: [
//                                                                                                                                               Text(choice[1], overflow: TextOverflow.ellipsis),
//                                                                                                                                               IconButton(
//                                                                                                                                                 icon:
//                                                                                                                                                     const Icon(Icons.delete, color: Colors.red),
//                                                                                                                                                 onPressed: () {
//                                                                                                                                                   controller.removeChoice(choice);
//                                                                                                                                                   controller.update();
//                                                                                                                                                 },
//                                                                                                                                               ),
//                                                                                                                                             ],
//                                                                                                                                           ),
//                                                                                                                                         );
//                                                                                                                                       }).toList(),
//                                                                                                                             // addedChoiceOnTap: ,
//                                                                                                                             // modelNameMastersText: 'To',
//                                                                                                                             // modelNameMastersOnTap: controller.getModelNameList,
//                                                                                                                             // modelNameMastersOnChanged: (String? newValue) {},
//                                                                                                                             // modelNameMastersItems:  controller.modelNameList.map((model) {
//                                                                                                                             //       return DropdownMenuItem<String>(
//                                                                                                                             //         value: model.modelName,
//                                                                                                                             //         child: Text(
//                                                                                                                             //           model.verboseName ?? model.modelName ?? '',
//                                                                                                                             //           style: const TextStyle(
//                                                                                                                             //             fontSize: 14,
//                                                                                                                             //           ),
//                                                                                                                             //         ),
//                                                                                                                             //       );
//                                                                                                                             //     }).toList(),
//                                                                                                                             choiceText: "Enter Choice",
//                                                                                                                             choiceController: controller.choiceController,
//                                                                                                                             choiceLabeText: "Add Choice",
//                                                                                                                             requiredCheckBoxName: "Required",
//                                                                                                                             requiredValue: controller.isRequired.value,
//                                                                                                                             requiredOnChanged: (bool? value) {
//                                                                                                                                               if (value != null) {
//                                                                                                                                                 controller.updateRequired(value);
//                                                                                                                                               }
//                                                                                                                                             },
//                                                                                                                             showViewCheckBoxName: "Show View",
//                                                                                                                             showViewValue: controller.isView.value,
//                                                                                                                             showViewOnChanged: (bool? value) {
//                                                                                                                                                   if (value != null) {
//                                                                                                                                                     controller.updateViewOnly(value);
//                                                                                                                                                   }
//                                                                                                                                                 },
//                                                                                                                             showEditCheckBoxName: "Show Edit",
//                                                                                                                             showEditValue: controller.isEdit.value,
//                                                                                                                             showEditOnChanged: (bool? value) {
//                                                                                                                                                   if (value != null) {
//                                                                                                                                                     controller.updateEditOnly(value);
//                                                                                                                                                   }
//                                                                                                                                                 },
//                                                                                                                             showReportCheckBoxName: "Show Report",
//                                                                                                                             showReportValue: controller.isReport.value,
//                                                                                                                             showReportOnChanged: (bool? value) {
//                                                                                                                                                   if (value != null) {
//                                                                                                                                                     controller.updateReportOnly(value);
//                                                                                                                                                   }
//                                                                                                                                                 },
//                                                                                                                             showAddCheckBoxName: "Show Add",
//                                                                                                                             showAddValue: controller.isAdd.value,
//                                                                                                                             showAddOnChanged: (bool? value) {
//                                                                                                                                                   if (value != null) {
//                                                                                                                                                     controller.updateAddOnly(value);
//                                                                                                                                                   }
//                                                                                                                                                 },
//                                                                                                                             showListCheckBoxName: "Show List",
//                                                                                                                             showListValue: controller.isList.value,
//                                                                                                                             showListOnChanged: (bool? value) {
//                                                                                                                                                   if (value != null) {
//                                                                                                                                                     controller.updateListOnly(value);
//                                                                                                                                                   }
//                                                                                                                                                 },
//                                                                                                                             showFilterCheckBoxName: "Show Filter",
//                                                                                                                             showFilterValue: controller.isFilter.value,
//                                                                                                                             showFilterOnChanged: (bool? value) {
//                                                                                                                                                   if (value != null) {
//                                                                                                                                                     controller.updateFilterOnly(value);
//                                                                                                                                                   }
//                                                                                                                                                 },
//                                                                                                                             showMultipleFilterCheckBoxName: "Multiple Filter",
//                                                                                                                             showMultipleFilterValue: controller.isMultipleFilter.value,
//                                                                                                                             showMultipleFilterOnChanged: (bool? value) {
//                                                                                                                                                   if (value != null) {
//                                                                                                                                                     controller.updateMultipleFilter(value);
//                                                                                                                                                   }
//                                                                                                                                                 },
//                                                                                                                             rangeFilterCheckBoxName: "Range Filter",
//                                                                                                                             rangeFilterValue: controller.rangeFilter.value,
//                                                                                                                             rangeFilterOnChanged: (bool? value) {
//                                                                                                                                                   if (value != null) {
//                                                                                                                                                     controller.updateRangeFilter(value);
//                                                                                                                                                   }
//                                                                                                                                                 },
//                                                                                                                             readOnlyCheckBoxName: "Read Only",
//                                                                                                                             readOnlyValue: controller.isReadOnly.value,
//                                                                                                                             readOnlyOnChanged: (bool? value) {
//                                                                                                                                                   if (value != null) {
//                                                                                                                                                     controller.updateReadOnly(value);
//                                                                                                                                                   }
//                                                                                                                                                 },
//                                                                                                                             defaultCheckBoxName: "Default",
//                                                                                                                             defaultValue: controller.isDefault.value,
//                                                                                                                             defaultOnChanged: (bool? value) {
//                                                                                                                                                   if (value != null) {
//                                                                                                                                                     controller.updateDefault(value);
//                                                                                                                                                   }
//                                                                                                                                                 },
//                                                                                                                             maxLengthText: "Enter Max Length",
//                                                                                                                             maxLengthController: controller.maxLengthController,
//                                                                                                                             maxLengthLabeText: "Max Length",
//                                                                                                                             maxLengthValidation: (value) {
//                                                                                                                                 if (value == null || value.isEmpty) {
//                                                                                                                                   return 'Please enter Max Length';
//                                                                                                                                 }
//                                                                                                                                 return null;
//                                                                                                                               },
//                                                                                                                             minLengthText: "Enter Min Length",
//                                                                                                                             minLengthController: controller.minLengthController,
//                                                                                                                             minLengthLabeText: "Min Length",
//                                                                                                                             minLengthValidation: (value) {
//                                                                                                                                 if (value == null || value.isEmpty) {
//                                                                                                                                   return 'Please enter Min Length';
//                                                                                                                                 }
//                                                                                                                                 return null;
//                                                                                                                               },
//                                                                                                                             maxDigitsText: "Enter Max Digits",
//                                                                                                                             maxDigitsController: controller.maxDigitsController,
//                                                                                                                             maxDigitsLabeText: "Max Digits",
//                                                                                                                             maxDigitsValidation: (value) {
//                                                                                                                                 if (value == null || value.isEmpty) {
//                                                                                                                                   return 'Please enter Max Digits';
//                                                                                                                                 }
//                                                                                                                                 return null;
//                                                                                                                               },
//                                                                                                                             decimalText: "Enter Decimal Place",
//                                                                                                                             decimalController: controller.decimalPlacesController,
//                                                                                                                             decimalLabeText: "Decimal Place",
//                                                                                                                             decimalValidation: (value) {
//                                                                                                                                 if (value == null || value.isEmpty) {
//                                                                                                                                   return 'Please enter Decimal Place';
//                                                                                                                                 }
//                                                                                                                                 return null;
//                                                                                                                               },
//                                                                                                                             clearButtonText: "Clear",
//                                                                                                                             clearButtonOnTap: () {
//                                                                                                                                     print(
//                                                                                                                                         "Printing the Data ${jsonEncode(controller.formFields)}");
//                                                                                                                                     controller.addFieldsDisposeController();
//                                                                                                                                     controller.update();
//                                                                                                                                   },
//                                                                                                                                       ),
//           )),
//           const SizedBox(height: 16),
//           Visibility(
//             visible: controller.itemFields.isNotEmpty,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 16),
//                 Text(
//                   "Children Fields",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Theme.of(context).colorScheme.primary
//                   )
//                 ),
//                 SizedBox(
//                   height: 300,
//                   child: SingleChildScrollView(
//                     // child: DynamicFieldDataTable(
//                     //   formFields: controller.itemFields,
//                     //   onEdit: (index, field) {
//                     //     controller.editField(index, field);
//                     //   },
//                     //   onDelete: (fieldName) {
//                     //     controller.deleteField(fieldName);
//                     //   },
//                     // ),
//                     child: buildChildFieldList(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// );
//                                     },
//                                   );
//                                 },
//                               );
//       }
//     ),
//   ],
// ),
                                const SizedBox(height: 16),
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                    buildFieldList(),


//  CommonComponents.defaultDropdownSearch<DynamicModelsNameData>(
//                   context,
//                   // title: 'To',
//                   showTitle: true,
//                   hintText: 'To',
//                   showBottomSheet: false,
//                   items: (filter, infiniteScrollProps) async {
//                     controller.isRefresh = true;
//                     await controller.getModelNameList();
//                     return controller.modelNameList;
//                   },
//                   itemBuilder: (context, DynamicModelsNameData? item, isSelected) {
//                     return Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 8),
//                       decoration: !isSelected
//                           ? null
//                           : BoxDecoration(
//                               border: Border.all(color: Theme.of(context).primaryColor),
//                               borderRadius: BorderRadius.circular(5),
//                               color: Colors.white,
//                             ),
//                       child: ListTile(
//                         selected: isSelected,
//                         title: Text(item?.modelName! ?? ''),
//                       ),
//                     );
//                   },
//                   // validator: (DynamicModelsNameData? item) {
//                   //   if (item == null) {
//                   //     return 'User is required';
//                   //   }
//                   //   return null;
//                   // },
//                   compareFn: (i, DynamicModelsNameData? s) => i.name == s?.modelName,
//                   itemAsString: (DynamicModelsNameData u) => u.modelName ?? '',
//                   // selectedItem: controller.selectedAiUser,
//                   onChanged: (DynamicModelsNameData? data) {
//                     // controller.selectedAiUser = data;
//                   },
//                 ),
// ResponsiveColumn(
//   ResponsiveConstants().textFormField,
  // child:
  //                                    ResponsiveColumn(
  //                                      ResponsiveConstants().textFormField,
  //                                      child:
                                      //  CommonComponents.defaultDropdownSearch<DynamicModelsNameData>(
                                      //    context,
                                      //    showTitle: true,
                                      //    hintText: 'To',
                                      //    showBottomSheet: false,
                                      //    items: (String filter, LoadProps? loadProps) async {
                                      //      try {
                                      //        if (controller.modelNameIsRefresh) {
                                      //          controller.modelNameList.clear();
                                      //          controller.modelNameCurrentPage = 1;
                                      //          await showLoadingDialog();
                                      //        } else if (controller.modelNameCurrentPage > controller.modelNameTotalPages) {
                                      //          return controller.modelNameList; // Returns empty list if no items
                                      //        }
                                      //        final response = await DynamicRepo().getModelNameList({});
                                      //        if (response != null && response.models != null) {
                                      //          controller.modelNameListCount = response.count ?? 0;
                                      //          // Safely combine lists
                                      //          final currentList = controller.modelNameList;
                                      //          final newItems = response.models ?? [];
                                      //          final combinedList = [...currentList, ...newItems];
                                      //          // Remove duplicates safely
                                      //          final seen = <String>{};
                                      //          final filtered = combinedList.where((model) =>
                                      //          model.modelName != null && seen.add(model.modelName!)).toList();
                                      //          // controller.modelNameList.value = filtered;
                                      //          controller.modelNameIsRefresh = false;
                                      //          // Update pagination
                                      //          controller.modelNameTotalPages =
                                      //              (controller.modelNameListCount / (CommonService.instance.pageSize ?? 10)).ceil();
                                      //          controller.modelNameCurrentPage++;
                                      //        }
                                      //        await closeLoadingDialog();
                                      //        return controller.modelNameList;
                                      //      } catch (e) {
                                      //        debugPrint("Model name list error: $e");
                                      //        await closeLoadingDialog();
                                      //        return controller.modelNameList; // Returns empty list in case of error
                                      //      }
                                      //    },
                                      //    itemBuilder: (context, DynamicModelsNameData? item, bool isSelected) {
                                      //      return Container(
                                      //        margin: const EdgeInsets.symmetric(horizontal: 8),
                                      //        decoration: !isSelected ? null : BoxDecoration(
                                      //          border: Border.all(color: Theme.of(context).primaryColor),
                                      //          borderRadius: BorderRadius.circular(5),
                                      //          color: Colors.white,
                                      //        ),
                                      //        child: ListTile(
                                      //          selected: isSelected,
                                      //          title: Text(item?.modelName ?? 'No name'),
                                      //        ),
                                      //      );
                                      //    },
                                      //    compareFn: (DynamicModelsNameData i, DynamicModelsNameData? s) =>
                                      //    i.modelName == s?.modelName,
                                      //    itemAsString: (DynamicModelsNameData u) => u.modelName ?? 'No name',
                                      //    onChanged: (DynamicModelsNameData? data) {
                                      //      controller.selectedModelName = data;
                                      //      controller.update();
                                      //    },
                                      //  ),
                                     // )
// )

                                   ],
                                 ),
                            const SizedBox(height: 16),

//////////////////////////////////////////     Submit Button     ///////////////////////////////////////////
                      Column(
                          children: [
                          SizedBox(height: 10.0),
                            // buildFieldList(),
                            // DynamicFieldDataTable(
                            //   formFields: controller.formFields,
                            //   onEdit: (index, field) {
                            //     controller.editField(index, field);
                            //   },
                            //   onDelete: (fieldName) {
                            //     controller.deleteField(fieldName);
                            //   },
                            // ),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                width: 150,
                                color: Theme.of(context).colorScheme.secondary,
                                child: MaterialButton(
                                  elevation: 2,
                                   onPressed: () {
                                    if (formKey.currentState?.validate() ?? false) {
                            if (controller.dynamicDetails.id != null) {
                              controller.updateModelName({
                                // "app_label": controller.appLabel.text,
                                // "model_name": controller.modelName.text,
                                // "fields": jsonEncode(controller.formFields.fold<Map<String, dynamic>>(
                                //   {},
                                //   (map, element) => {...map, ...element},
                                // ))
                                   });} else {
                                    controller.createDynamicData();
                                  }}},
                                  height: 50,
                                  minWidth: 100,
                                  color: Theme.of(context).colorScheme.primary,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Center(
                                    child: Text(
                                          "Submit",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).colorScheme.secondary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                  ),
                                )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
          )),
        ),
      ),
    );
  }
//   );
// }
}
