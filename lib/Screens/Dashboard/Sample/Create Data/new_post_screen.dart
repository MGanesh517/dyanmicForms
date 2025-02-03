import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/BreakPoints/breakpoints.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
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
                                                      print(
                                                          "Printing the Data ${jsonEncode(controller.formFields)}");
                                                      controller.addFieldsDisposeController();
                                                      controller.update();
                                                    },
                        
                                              submitButtonText: controller.editingIndex >= 0
                                                                    ? "Update Field"
                                                                    : "Add Field",
                                              submitButtonOnTap: () {
                                                      print(
                                                          "Printing the Data::::::: ${jsonEncode(controller.formFields)}");
                                                      controller.addField();
                                                      // controller.update();
                                                    },
                                            
                                              )),
 
                      
if(controller.selectedFieldType == "Children")
GestureDetector(
  onTap:() {
    showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Enter Items"),
                                content: SizedBox(
                                  width: double.maxFinite,
                                  child: Container(
                                    child: Obx(() => FieldManagementComponent(
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
                                                      print(
                                                          "Printing the Data ${jsonEncode(controller.formFields)}");
                                                      controller.addFieldsDisposeController();
                                                      controller.update();
                                                    },
                        
                                              submitButtonText: controller.editingIndex >= 0
                                                                    ? "Update Field"
                                                                    : "Add Field",
                                              submitButtonOnTap: () {
                                                      print(
                                                          "Printing the Data::::::: ${jsonEncode(controller.formFields)}");
                                                      controller.addField();
                                                      // controller.update();
                                                    },
                                            
                                              )),
                                  )),
                                // actions: [
                                //   TextButton(
                                //     onPressed: () {
                                //       Navigator.of(context).pop();
                                //     },
                                //     child: Text("Cancel"),
                                //   ),
                                //   TextButton(
                                //     onPressed: () {
                                //       // Handle save action
                                //       Navigator.of(context).pop();
                                //     },
                                //     child: Text("Save"),
                                //   ),
                                // ],
                              );
                            },
                          );
  }
)


          // Container(
          //         color: Theme.of(context).colorScheme.secondary,
          //         child: MaterialButton(
          //           elevation: 2,
          //           onPressed: () {
          //                 ;
          //               },
          //           height: 50,
          //           minWidth: 100,
          //           color: Theme.of(context).colorScheme.primary,
          //           shape: const RoundedRectangleBorder(
          //             borderRadius: BorderRadius.all(Radius.circular(6)),
          //           ),
          //           child: Center(
          //             child: Text(
          //               "Enter Items",
          //               style: TextStyle(
          //                 color: Theme.of(context).colorScheme.secondary,
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             ),
          //           ),
          //         ),
          //         // ),
          //       ),

                                              
                      ],
                    ),

                  

//                     Container(
//                       padding: EdgeInsets.all(16.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10.0),
//                         border: Border.all(width: 0.5, color: Colors.grey)
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Visibility(
//                             // visible: controller.dynamicDetails.id == null,
//                             child: ResponsiveRow(
//                               runSpacing: 10,
//                               spacing: 20,
//                               columns: [
//                                 ResponsiveColumn(
//                                   ResponsiveConstants().buttonBreakpoints,
//                                   child: CommonComponents.defaultTextFormField(context,
//                                     controller: controller.fieldNameController,
//                                     hintText: 'Enter Field Name',
//                                     decoration: const InputDecoration(
//                                       labelText: 'Field Name',
//                                       border: OutlineInputBorder(),
//                                     ),
//                                   ),
//                                 ),
                                // ResponsiveColumn(
                                //   ResponsiveConstants().buttonBreakpoints,
                                //   child: Obx(() => DropdownButtonFormField<String>(
                                //     dropdownColor: Theme.of(context).colorScheme.secondary,
                                //     menuMaxHeight: 250,
                                //     focusColor: Theme.of(context).colorScheme.primary,
                                //       value: controller.selectedFieldType,
                                //       decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                                //         borderRadius: BorderRadius.circular(10.0),
                                //         borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                                //       ),
                                //         hintText: "Select Type",
                                //         border: OutlineInputBorder(
                                //             borderRadius: BorderRadius.circular(10.0),
                                //             borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                                //           ),
                                //       ),
                                //       items: controller.fieldTypes
                                //           .map((type) => DropdownMenuItem(
                                //                 value: type,
                                //                 child: Text(type),
                                //               ))
                                //           .toList(),
                                //       onChanged: (value) {
                                //         if (value != null) {
                                //           controller.selectedFieldType = value;
                                //           controller.update();
                                //         }
                                //       },
                                //     ),
                                //   ),
                                // ),
//               if (controller.selectedFieldType == 'Choice')
//                               ResponsiveColumn(
//                                 ResponsiveConstants().buttonBreakpoints,
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       child: CommonComponents.defaultTextFormField(
//                                         context,
//                                         controller: controller.choiceController,
//                                         hintText: 'Enter Choice',
//                                         decoration: const InputDecoration(
//                                           labelText: 'Add Choice',
//                                           border: OutlineInputBorder(),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(width: 8),
//                                     IconButton(
//                                       onPressed: () {
//                                         print('asdasas ${jsonEncode(controller.choices)}');
//                                         controller.addChoice();
//                                         // controller.update();
//                                       },
//                                       icon: const Icon(Icons.add_circle_outline),
//                                       color: Theme.of(context).colorScheme.primary,
//                                     ),
//                                   ],
//                                 ),
//                               ),
                // if (controller.choices.isNotEmpty)
                //               ResponsiveColumn(
                //                 ResponsiveConstants().buttonBreakpoints,
                //                 child: DropdownButtonFormField<String>(
                //                   menuMaxHeight: 250,
                //                   hint: const Text("Added Choices"),
                //                   dropdownColor: Theme.of(context).colorScheme.secondary,
                //                   decoration: InputDecoration(
                //                     enabledBorder: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(10.0),
                //                       borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                //                     ),
                //                     border: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(10.0),
                //                       borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                //                     ),
                //                   ),
                //                   items: controller.choices.map<DropdownMenuItem<String>>((choice) {
                //                     return DropdownMenuItem<String>(
                //                       value: choice[1],
                //                       child: Row(
                //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text(choice[1], overflow: TextOverflow.ellipsis),
                //                           IconButton(
                //                             icon: const Icon(Icons.delete, color: Colors.red),
                //                             onPressed: () {
                //                               controller.removeChoice(choice);
                //                               controller.update();
                //                             },
                //                           ),
                //                         ],
                //                       ),
                //                     );
                //                   }).toList(),
                //                   onChanged: (value) {},
                //                 ),
                //               ),
//         if (controller.selectedFieldType != 'Children')
//                                 ResponsiveColumn(
//                                     ResponsiveConstants().buttonBreakpoints,
//                                     child: Obx(() =>
//                                         CommonComponents.defaultCheckBoxListTile(
//                                             context,
//                                             value: controller.isRequired.value,
//                                             title: 'Required',
//                                             onChanged: (bool? value) {
//                                           if (value != null) {
//                                             controller.updateRequired(value);
//                                           }
//                                         }))),
//             if (controller.selectedFieldType != 'Children')
//                                 ResponsiveColumn(
//                                   ResponsiveConstants().buttonBreakpoints,
//                                   child: Obx(
//                                       () => CommonComponents.defaultCheckBoxListTile(
//                                             context,
//                                             title: 'Show View',
//                                             value: controller.isView.value,
//                                             onChanged: (bool? value) {
//                                               if (value != null) {
//                                                 controller.updateViewOnly(value);
//                                               }
//                                             },
//                                           )),
//                                 ),
//             if (controller.selectedFieldType != 'Children')
//                                 ResponsiveColumn(
//                                   ResponsiveConstants().buttonBreakpoints,
//                                   child: Obx(
//                                       () => CommonComponents.defaultCheckBoxListTile(
//                                             context,
//                                             title: 'Show Report',
//                                             value: controller.isReport.value,
//                                             onChanged: (bool? value) {
//                                               if (value != null) {
//                                                 controller.updateReportOnly(value);
//                                               }
//                                             },
//                                           )),
//                                 ),
//                                                     if (controller.selectedFieldType != 'Children')
//                                 ResponsiveColumn(
//                                   ResponsiveConstants().buttonBreakpoints,
//                                   child: Obx(
//                                       () => CommonComponents.defaultCheckBoxListTile(
//                                             context,
//                                             title: 'Show Edit',
//                                             value: controller.isEdit.value,
//                                             onChanged: (bool? value) {
//                                               if (value != null) {
//                                                 controller.updateEditOnly(value);
//                                               }
//                                             },
//                                           )),
//                                 ),
//                                                     if (controller.selectedFieldType != 'Children')
//                                 ResponsiveColumn(
//                                   ResponsiveConstants().buttonBreakpoints,
//                                   child: Obx(
//                                       () => CommonComponents.defaultCheckBoxListTile(
//                                             context,
//                                             title: 'Show Filter',
//                                             value: controller.isFilter.value,
//                                             onChanged: (bool? value) {
//                                               if (value != null) {
//                                                 controller.updateFilterOnly(value);
//                                               }
//                                             },
//                                           )),
//                                 ),
//                                                     if (controller.selectedFieldType != 'Children')
//                                 ResponsiveColumn(
//                                   ResponsiveConstants().buttonBreakpoints,
//                                   child: Obx(
//                                       () => CommonComponents.defaultCheckBoxListTile(
//                                             context,
//                                             title: ' Show List',
//                                             value: controller.isList.value,
//                                             onChanged: (bool? value) {
//                                               if (value != null) {
//                                                 controller.updateListOnly(value);
//                                               }
//                                             },
//                                           )),
//                                 ),
//                                                     if (controller.selectedFieldType != 'Children')
//                                 ResponsiveColumn(
//                                   ResponsiveConstants().buttonBreakpoints,
//                                   child: Obx(
//                                       () => CommonComponents.defaultCheckBoxListTile(
//                                             context,
//                                             title: 'Show Add',
//                                             value: controller.isAdd.value,
//                                             onChanged: (bool? value) {
//                                               if (value != null) {
//                                                 controller.updateAddOnly(value);
//                                               }
//                                             },
//                                           )),
//                                 ),
//                             if (controller.selectedFieldType == 'ManyToMany')
//                                  ResponsiveColumn(
//                                   ResponsiveConstants().buttonBreakpoints,
//                                   child: Obx(
//                                       () => CommonComponents.defaultCheckBoxListTile(
//                                             context,
//                                             title: 'Multiple Filter',
//                                             value: controller.isMultipleFilter.value,
//                                             onChanged: (bool? value) {
//                                               if (value != null) {
//                                                 controller.updateMultipleFilter(value);
//                                               }
//                                             },
//                                           )),
//                                 ),
//                             if (controller.selectedFieldType == ' ')
//                                  ResponsiveColumn(
//                                   ResponsiveConstants().buttonBreakpoints,
//                                   child: Obx(
//                                       () => CommonComponents.defaultCheckBoxListTile(
//                                             context,
//                                             title: 'Default',
//                                             value: controller.isDefault.value,
//                                             onChanged: (bool? value) {
//                                               if (value != null) {
//                                                 controller.updateDefault(value);
//                                               }
//                                             },
//                                           )),
//                                 ),
//                             if (controller.selectedFieldType == 'Char' || controller.selectedFieldType == 'Text')
//                                 ResponsiveColumn(
//                                               ResponsiveConstants().buttonBreakpoints,
//                                     child: CommonComponents.defaultTextFormField(context,
//                                                 controller:
//                                                     controller.maxLengthController,
//                                                 hintText: 'Enter Max Length',
//                                                 decoration: const InputDecoration(
//                                                   labelText: 'Max Length',
//                                                   border: OutlineInputBorder(),
//                                                 ),
//                                                 keyboardType: TextInputType.number,
//                                               )
//                                             ),
//                             if (controller.selectedFieldType == 'Char' || controller.selectedFieldType == 'Text')
//                                             ResponsiveColumn(
//                                               ResponsiveConstants().buttonBreakpoints,
//                                       child: CommonComponents.defaultTextFormField(context,
//                                                 controller:
//                                                     controller.minLengthController,
//                                                 hintText: 'Enter Min Length',
//                                                 decoration: const InputDecoration(
//                                                   labelText: 'Min Length',
//                                                   border: OutlineInputBorder(),
//                                                 ),
//                                                 keyboardType: TextInputType.number,
//                                               )
//                                             ),
//                             if (controller.selectedFieldType == 'DateTime' || controller.selectedFieldType == 'Date')
//                                              ResponsiveColumn(
//                                     ResponsiveConstants().buttonBreakpoints,
//                                       child:   CommonComponents.defaultCheckBoxListTile(
//                                             context,
//                                             value: controller.rangeFilter.value,
//                                             title: 'Range Filter',
//                                             onChanged: (bool? value) {
//                                           if (value != null) {
//                                             controller.updateRangeFilter(value);
//                                           }
//                                         })) ,
//                             if (controller.selectedFieldType == 'DateTime' || controller.selectedFieldType == 'Date' ||
//                              controller.selectedFieldType == 'Time' || controller.selectedFieldType == 'Duration')
//                                         ResponsiveColumn(
//                                     ResponsiveConstants().buttonBreakpoints,
//                                       child:  CommonComponents.defaultCheckBoxListTile(
//                                             context,
//                                             value: controller.isReadOnly.value,
//                                             title: 'Read Only',
//                                             onChanged: (bool? value) {
//                                           if (value != null) {
//                                             controller.updateReadOnly(value);
//                                           }
//                                         })),
//                                     if (controller.selectedFieldType == 'Decimal')
//                                 ResponsiveColumn(
//                                               ResponsiveConstants().buttonBreakpoints,
//                                     child: CommonComponents.defaultTextFormField(context,
//                                                 controller:
//                                                     controller.maxDigitsController,
//                                                 hintText: 'Enter Max Digits',
//                                                 decoration: const InputDecoration(
//                                                   labelText: 'Max Digits',
//                                                   border: OutlineInputBorder(),
//                                                 ),
//                                                 keyboardType: TextInputType.number,
//                                               ) 
//                                             ),
//                                     if (controller.selectedFieldType == 'Decimal')
//                                 ResponsiveColumn(
//                                               ResponsiveConstants().buttonBreakpoints,
//                                     child: CommonComponents.defaultTextFormField(context,
//                                                 controller:
//                                                     controller.decimalPlacesController,
//                                                 hintText: 'Enter Decimal Place',
//                                                 decoration: const InputDecoration(
//                                                   labelText: 'Decimal Place',
//                                                   border: OutlineInputBorder(),
//                                                 ),
//                                                 keyboardType: TextInputType.number,
//                                               )
//                                             ),
//                               ],
//                             ),
//                           ),
//                           // Visibility(
//                           //   visible: controller.isEditMode == true,
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.end,
//                           //     children: [
//                           //       ElevatedButton(
//                           //         onPressed: () {
//                           //           controller.updateField();
//                           //           controller.update();
//                           //         },
//                           //         child: Text('Save Changes'),
//                           //       ),
//                           //     ],
//                           //   )),
//                           Visibility(
//                             // visible: controller.dynamicDetails.id != null ,
//                             child: Row(
//                                                   mainAxisAlignment: MainAxisAlignment.end,
//                                                   children: [
//                                                     Container(
//                                                                                 color: Theme.of(context).colorScheme.secondary,
//                                                                                   child: MaterialButton(
//                                                                                     elevation: 2,
//                                                                                     onPressed: () {
//                                                                                       print("Printing the Data ${jsonEncode(controller.formFields)}");
//                                                                                      controller.addFieldsDisposeController();
//                                                                                       controller.update();
//                                                                                     },
//                                                                                     height: 50,
//                                                                                     minWidth: 100,
//                                                                                     color: Theme.of(context).colorScheme.primary,
//                                                                                     shape: const RoundedRectangleBorder(
//                                                                                       borderRadius:
//                                                                                           BorderRadius.all(Radius.circular(6)),
//                                                                                     ),
//                                                                                     child: Center(
//                                                                                       child: Text(
//                                                                                         "Clear",
//                                                                                         style: TextStyle(
//                                                                                           color:
//                                                                                               Theme.of(context).colorScheme.secondary,
//                                                                                           fontSize: 15,
//                                                                                           fontWeight: FontWeight.w600,
//                                                                                         ),
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 // ),
//                                                     ),
//                                                     const SizedBox(width: 8),
//                                                     Container(
//                             color: Theme.of(context).colorScheme.secondary,
//                               child: MaterialButton(
//                                 elevation: 2,
//                                 onPressed: () {
//                                   print("Printing the Data::::::: ${jsonEncode(controller.formFields)}");
//                                  controller.addField();
//                                   // controller.update();
//                                 },
//                                 height: 50,
//                                 minWidth: 100,
//                                 color: Theme.of(context).colorScheme.primary,
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(6)),
//                                 ),
//                                 child: Center(
//                                   child: Row(
//                                     children: [
//                                       Icon(
//                                         controller.editingIndex >= 0 ? Icons.update : Icons.add_circle_outline_outlined,
//                                         color: Theme.of(context).colorScheme.secondary),
//                                       SizedBox(width: 12),
//                                       Text(
//                                         controller.editingIndex >= 0 ? "Update Field" : "Add Field",
//                                       // Icon(Icons.add_circle_outline_outlined, color: Theme.of(context).colorScheme.secondary),
//                                       // SizedBox(width: 12),
//                                       // Text(
//                                       //   "Add Field",
//                                         style: TextStyle(
//                                           color:
//                                               Theme.of(context).colorScheme.secondary,
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             // ),
//                                                     ),
// //                             Container(
// //   color: Theme.of(context).colorScheme.secondary,
// //   child: MaterialButton(
// //     elevation: 2,
// //     onPressed: () {
// //       if (controller.editingIndex >= 0) {
// //         // Update existing field
// //         controller.formFields[controller.editingIndex] = {
// //           controller.fieldNameController.text: {
// //             "type": controller.selectedFieldType,
// //             "required": controller.isRequired.value,
// //             "show_in_view": controller.isView.value,
// //             "show_in_report": controller.isReport.value,
// //             "show_in_edit": controller.isEdit.value,
// //             "show_in_filter": controller.isFilter.value,
// //             "show_in_list": controller.isList.value,
// //             "show_in_add": controller.isAdd.value,
// //             "max_length": controller.maxLengthController.text.isNotEmpty
// //                 ? int.parse(controller.maxLengthController.text)
// //                 : null,
// //             "min_length": controller.minLengthController.text.isNotEmpty
// //                 ? int.parse(controller.minLengthController.text)
// //                 : null,
// //           }
// //         };
// //         controller.editingIndex = -1; // Reset editing index
// //       } else {
// //         // Add new field
// //         controller.addField();
// //       }
// //       print("Printing the Data ${jsonEncode(controller.formFields)}");
// //       controller.update();
// //     },
// //     height: 50,
// //     minWidth: 100,
// //     color: Theme.of(context).colorScheme.primary,
// //     shape: const RoundedRectangleBorder(
// //       borderRadius: BorderRadius.all(Radius.circular(6)),
// //     ),
// //     child: Center(
// //       child: Row(
// //         children: [
// //           Icon(
// //             controller.editingIndex >= 0
// //                 ? Icons.update
// //                 : Icons.add_circle_outline_outlined,
// //             color: Theme.of(context).colorScheme.secondary,
// //           ),
// //           SizedBox(width: 12),
// //           Text(
// //             controller.editingIndex >= 0 ? "Update Field" : "Add Field",
// //             style: TextStyle(
// //               color: Theme.of(context).colorScheme.secondary,
// //               fontSize: 15,
// //               fontWeight: FontWeight.w600,
// //             ),
// //           ),
// //         ],
// //       ),
// //     ),
// //   ),
// // )
//                                                   ],
//                                                 ),
//                           ),

//                     const SizedBox(width: 16),
//                     // Obx(() {
//                     //   if (controller.formFields.isNotEmpty) {
//                     //     return 
//                         Column(
//                           children: [
//                           SizedBox(height: 10.0),

//                             buildFieldList(),

//                           // // SizedBox(height: 10.0),
//                           // // SizedBox(height: 10.0),

//                           //   buildSFDataFieldList(),
                            
//                             const SizedBox(height: 16),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                 width: 150,
//                                 color: Theme.of(context).colorScheme.secondary,
//                                 child: MaterialButton(
//                                   elevation: 2,
//                                    onPressed: () {
//                                     if (formKey.currentState?.validate() ?? false) {
//                             if (controller.dynamicDetails.id != null) {
//                               controller.updateModelName({
//                                 // "app_label": controller.appLabel.text,
//                                 // "model_name": controller.modelName.text,
//                                 // "fields": jsonEncode(controller.formFields.fold<Map<String, dynamic>>(
//                                 //   {},
//                                 //   (map, element) => {...map, ...element},
//                                 // ))
//                                    });} else {
//                                     controller.createDynamicData();
//                                   }}},

//                                   height: 50,
//                                   minWidth: 100,
//                                   color: Theme.of(context).colorScheme.primary,
//                                   shape: const RoundedRectangleBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(6)),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                           "Submit",
//                                           style: TextStyle(
//                                             color:
//                                                 Theme.of(context).colorScheme.secondary,
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         ),
//                                   ),
//                                 ),
//                                                           // ),
//                                                         ),
//                               ],
//                             ),
//                           ],
//                         )
//                     //   }
//                     //   return const SizedBox.shrink();
//                     // }),
//                         ],
//                       ),
//                     ),
                  ],
                ),
          )),
        ),
      ),
    );
  });
      }
    
}
