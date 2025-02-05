import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/BreakPoints/breakpoints.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
import 'package:implementation_panel/Common/snackbar_widget.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Create%20Data/common_component.dart';
import 'package:implementation_panel/Screens/Dashboard/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(DynamicController());
  final formKey = GlobalKey<FormState>();
  int index = 0;


//   Widget buildFieldList() {
//     return Obx(() {
//       return SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade300, width: 1.0),
//             borderRadius: BorderRadius.circular(10),
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               physics: const AlwaysScrollableScrollPhysics(),
//               child: DataTable(
//                 showCheckboxColumn: true,
//                 checkboxHorizontalMargin: 10.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 dataTextStyle: const TextStyle(fontWeight: FontWeight.w400),
//                 headingRowColor: const WidgetStatePropertyAll(Color(0xfff7fafc)),
//                 dataRowColor: WidgetStatePropertyAll(Color(0xffffffff)),
//                 columns: <DataColumn>[
//                   DataColumn(label: Text('S.No',  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Field Name' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Type' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Required' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in View' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in Report' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in Edit' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in List' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in Add' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Choices' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('To' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Min Length' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Max Length' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Read Only' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Max Digits' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Decimal Places' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Range Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Default' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Multiple Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Actions' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                 ],
//                 rows: controller.formFields.isEmpty
//                     ? const []
//                     : controller.formFields.expand((entry) {
//                         index = 0;
//                         return entry.entries.map((field) {
//                           final fieldName = field.key;
//                           index++;
//                           final attributes = field.value as Map<String, dynamic>;
//                           return DataRow(cells: [
//                             DataCell(Text('${controller.dynamicDetails.fields1 != null ? index : controller.formFields.indexOf(entry) + 1}')),
//                             DataCell(Text(fieldName)),
//                             DataCell(Text(attributes['type'].toString())),
//                             DataCell(Text(attributes['required']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_view']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_report']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_edit']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_filter']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_list']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_add']?.toString() ?? "-")),
//                             DataCell(attributes['type'] == 'Choice' && attributes['choices'] != null
//                                                     ? Container(
//                                                       margin: EdgeInsets.all(5.0),
//                                                       decoration: BoxDecoration(
//                                                         borderRadius: BorderRadius.circular(10.0),
//                                                         border: Border.all(color: Colors.grey.shade300)
//                                                       ),
//                                                       child: DropdownButton<String>(
//                                                         menuMaxHeight: 150,
//                                                         borderRadius: BorderRadius.circular(10.0),
//                                                         dropdownColor: Theme.of(context).colorScheme.secondary,
//                                                           value: null,
//                                                           items: (attributes['choices'] as List).map<DropdownMenuItem<String>>((choice) {
//                                                             return DropdownMenuItem<String>(
//                                                               value: choice[1].toString(),
//                                                               child: Text(choice[1].toString()),
//                                                             );
//                                                           }).toList(),
//                                                           onChanged: (String? newValue) {
//                                                             print('Selected: $newValue');
//                                                           },
//                                                         ),
//                                                     )
//                                                     : Text("-"),
//                                                 ),
//                             DataCell(Text(attributes['to']?.toString() ?? "-")),
//                             DataCell(Text(attributes['min_length']?.toString() ?? "-")),
//                             DataCell(Text(attributes['max_length']?.toString() ?? "-")),
//                             DataCell(Text(attributes['read_only']?.toString() ?? "-")),
//                             DataCell(Text(attributes['max_digits']?.toString() ?? "-")),
//                             DataCell(Text(attributes['decimal_places']?.toString() ?? "-")),
//                             DataCell(Text(attributes['range_filter']?.toString() ?? "-")),
//                             DataCell(Text(attributes['default']?.toString() ?? "-")),
//                             DataCell(Text(attributes['multiple_filter']?.toString() ?? "-")),
//                             DataCell(Row(
//                               children: [
//                                 IconButton(
//                                   icon: Icon(Icons.edit),
//                                   onPressed: () {
//                                     controller.editField(controller.formFields.indexOf(entry), entry);
//                                   },
//                                 ),
//                                 IconButton(
//                                   icon: Icon(Icons.delete),
//                                   onPressed: () {
//                                     // controller.formFields.removeAt(controller.formFields.indexOf(entry));
//                                     // controller.update();
//                                     controller.deleteField(fieldName);
//                                   },
//                                 ),
//                               ],
//                             )),
//                           ]);
//                         }).toList();
//                       }).toList(),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }

// Widget buildChildFieldList() {
//     return Obx(() {
//       return SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade300, width: 1.0),
//             borderRadius: BorderRadius.circular(10),
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               physics: const AlwaysScrollableScrollPhysics(),
//               child: DataTable(
//                 showCheckboxColumn: true,
//                 checkboxHorizontalMargin: 10.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 dataTextStyle: const TextStyle(fontWeight: FontWeight.w400),
//                 headingRowColor: const WidgetStatePropertyAll(Color(0xfff7fafc)),
//                 dataRowColor: WidgetStatePropertyAll(Color(0xffffffff)),
//                 columns: <DataColumn>[
//                   DataColumn(label: Text('S.No',  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Field Name' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Child Type' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Required' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in View' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in Report' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in Edit' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in List' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Show in Add' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Choices' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('To' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Min Length' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Max Length' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Read Only' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Max Digits' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Decimal Places' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Range Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Default' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Multiple Filter' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                   DataColumn(label: Text('Actions' ,  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
//                 ],
//                 rows: controller.itemFields.isEmpty
//                     ? const []
//                     : controller.itemFields.expand((entry) {
//                         index = 0;
//                         return entry.entries.map((field) {
//                           final fieldName = field.key;
//                           index++;
//                           final attributes = field.value as Map<String, dynamic>;
//                           return DataRow(cells: [
//                             DataCell(Text('${controller.dynamicDetails.fields1 != null ? index : controller.itemFields.indexOf(entry) + 1}')),
//                             DataCell(Text(fieldName)),
//                             DataCell(Text(attributes['type'].toString())),
//                             DataCell(Text(attributes['required']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_view']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_report']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_edit']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_filter']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_list']?.toString() ?? "-")),
//                             DataCell(Text(attributes['show_in_add']?.toString() ?? "-")),
//                             DataCell(attributes['type'] == 'Choice' && attributes['choices'] != null
//                                                     ? Container(
//                                                       margin: EdgeInsets.all(5.0),
//                                                       decoration: BoxDecoration(
//                                                         borderRadius: BorderRadius.circular(10.0),
//                                                         border: Border.all(color: Colors.grey.shade300)
//                                                       ),
//                                                       child: DropdownButton<String>(
//                                                         menuMaxHeight: 150,
//                                                         borderRadius: BorderRadius.circular(10.0),
//                                                         dropdownColor: Theme.of(context).colorScheme.secondary,
//                                                           value: null,
//                                                           items: (attributes['choices'] as List).map<DropdownMenuItem<String>>((choice) {
//                                                             return DropdownMenuItem<String>(
//                                                               value: choice[1].toString(),
//                                                               child: Text(choice[1].toString()),
//                                                             );
//                                                           }).toList(),
//                                                           onChanged: (String? newValue) {
//                                                             print('Selected: $newValue');
//                                                           },
//                                                         ),
//                                                     )
//                                                     : Text("-"),
//                                                 ),
//                             DataCell(Text(attributes['to']?.toString() ?? "-")),
//                             DataCell(Text(attributes['min_length']?.toString() ?? "-")),
//                             DataCell(Text(attributes['max_length']?.toString() ?? "-")),
//                             DataCell(Text(attributes['read_only']?.toString() ?? "-")),
//                             DataCell(Text(attributes['max_digits']?.toString() ?? "-")),
//                             DataCell(Text(attributes['decimal_places']?.toString() ?? "-")),
//                             DataCell(Text(attributes['range_filter']?.toString() ?? "-")),
//                             DataCell(Text(attributes['default']?.toString() ?? "-")),
//                             DataCell(Text(attributes['multiple_filter']?.toString() ?? "-")),
//                             DataCell(Row(
//                               children: [
//                                 IconButton(
//                                   icon: Icon(Icons.edit),
//                                   onPressed: () {
//                                     controller.editField(controller.itemFields.indexOf(entry), entry);
//                                   },
//                                 ),
//                                 IconButton(
//                                   icon: Icon(Icons.delete),
//                                   onPressed: () {
//                                     // controller.formFields.removeAt(controller.formFields.indexOf(entry));
//                                     // controller.update();
//                                     controller.deleteField(fieldName);
//                                   },
//                                 ),
//                               ],
//                             )),
//                           ]);
//                         }).toList();
//                       }).toList(),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }

  @override
  Widget build(BuildContext context) {
      print("printng the id builder ::::: ${controller.dynamicDetails.id}");
      return LayoutBuilder(builder: (context, constraints) {
        return CommonScaffoldWithAppBar(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: GetBuilder<DynamicController>(
          initState: (_) => DynamicController.to.initEditState(),
          builder: (value) =>  Padding(
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
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                    Text("Add Fields", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.primary)),
                    const SizedBox(height: 16),




                    Column(
                      children: [
                        Obx(() => FieldManagementComponent(

                          isInDialog: false,
                          
                                              fieldNameText: "Enter Field Name",
                                              fieldNameController: controller.fieldNameController,
                                              fieldNameLabeText: "Field Name",
                                          
                                          
                                          
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
                        
                                              minLengthText: "Enter Min Length",
                                              minLengthController: controller.minLengthController,
                                              minLengthLabeText: "Min Length",
                        
                                              maxDigitsText: "Enter Max Digits",
                                              maxDigitsController: controller.maxDigitsController,
                                              maxDigitsLabeText: "Max Digits",
                        
                                              decimalText: "Enter Max Digits",
                                              decimalController: controller.decimalPlacesController,
                                              decimalLabeText: "Max Digits",
                        
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
                                                      print("Printing the  formfields Data::::::: ${jsonEncode(controller.formFields)}");
                                                      controller.addField();
                                                      // controller.update();
                                                    },
                                            
                                              )),

         
         
if(controller.selectedFieldType == "Children")
Column(
  children: [
    GestureDetector(
      onTap:() {
        final fieldName = controller.fieldNameController.text.trim();
          if (fieldName.isEmpty) {
            showSnackBar(
              title: 'Error',
              message: 'Please enter a field name first',
              icon: Icon(Icons.error, color: Colors.red),
            );
            return;
          }
        showDialog(
          barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return GetBuilder<DynamicController>(
                                    // init: DynamicController(),
                                    initState: (_)  {
                                      DynamicController.to.initDialogBoxState();
                                      DynamicController.to.fieldNameController.text = fieldName;
                                    } ,
                                    builder: (_) {
                                      return AlertDialog(
  actionsAlignment: MainAxisAlignment.center,
  actions: [
                      Container(
                        width: 100,
                        color: Theme.of(context).colorScheme.secondary,
                        child: MaterialButton(
                          elevation: 2,
                          onPressed: () {
                            // Wrap child fields with parent field name before closing
                            if (controller.itemFields.isNotEmpty) {
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
                            }
                            Navigator.pop(context);
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
                      ),
                    ],
  title: Text("Enter Items"),
  content: Container(
    width: MediaQuery.of(context).size.width * 0.8, // Set maximum width
    height: MediaQuery.of(context).size.height * 0.8, // Set maximum height
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => FieldManagementComponent(

                                                                                                                  isInDialog: true,

                                                                                                                  
                                                                                                                          fieldNameText: "Enter Field Name",
                                                                                                                          fieldNameController: controller.fieldNameController,
                                                                                                                          fieldNameLabeText: "Field Name",
                                                                                                                      
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
                                                                                                                                  print(
                                                                                                                                                                "Printing the itemfields Data ${jsonEncode(controller.itemFields)}");
                                                                                                                            controller.addChildField();
                                                                                                                            controller.update();
                                                                                                                          },
                                                                                                                                                                                                            
                                                                                                                                                                                        
                                                                                                                                                                                        
                                                                                                                                                                                        
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
                                                                                                                                                                                                                
                                                                                                                          minLengthText: "Enter Min Length",
                                                                                                                          minLengthController: controller.minLengthController,
                                                                                                                          minLengthLabeText: "Min Length",
                                                                                                                                                                                                                
                                                                                                                          maxDigitsText: "Enter Max Digits",
                                                                                                                          maxDigitsController: controller.maxDigitsController,
                                                                                                                          maxDigitsLabeText: "Max Digits",
                                                                                                                                                                                                                
                                                                                                                          decimalText: "Enter Max Digits",
                                                                                                                          decimalController: controller.decimalPlacesController,
                                                                                                                          decimalLabeText: "Max Digits",
                                                                                                                                                                                                                
                                                                                                                          clearButtonText: "Clear",
                                                                                                                          clearButtonOnTap: () {
                                                                                                                                  print(
                                                                                                                                      "Printing the Data ${jsonEncode(controller.formFields)}");
                                                                                                                                  controller.addFieldsDisposeController();
                                                                                                                                  controller.update();
                                                                                                                                },
                                                                                                                                                                                                                
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
                  height: 300, // Fixed height for the data table
                  child: SingleChildScrollView(
                    child: DynamicFieldDataTable(
                      formFields: controller.itemFields,
                      onEdit: (index, field) {
                        controller.editField(index, field);
                      },
                      onDelete: (fieldName) {
                        controller.deleteField(fieldName);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);
                                    },
                                  );
                                },
                              );
      }
    ),
  ],
),
                                const SizedBox(height: 16),
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     DynamicFieldDataTable(
                                      formFields: controller.formFields,
                                      onEdit: (index, field) {
                                        controller.editField(index, field);
                                      },
                                      onDelete: (fieldName) {
                                        controller.deleteField(fieldName);
                                      },
                                                                     ),
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
  });}
}
