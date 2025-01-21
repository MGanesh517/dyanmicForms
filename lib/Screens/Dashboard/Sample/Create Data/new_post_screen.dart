import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/BreakPoints/breakpoints.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
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

  Widget buildFieldList() {
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            // scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: DataTable(
                dataTextStyle: const TextStyle(fontWeight: FontWeight.w400),
                headingRowColor: const WidgetStatePropertyAll(Color(0xfff7fafc)),
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('S.No',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black)),
                  ),
                  DataColumn(
                    label: Text('Field Name',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black)),
                  ),
                  DataColumn(
                    label: Text('Field Type',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Child Fields',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Required',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('View',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Report',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Edit',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Filter',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('List',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Add',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Choices',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Min Length',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Max Length',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Read Only',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Max Digits',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Decimal Place',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Range Filter',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Default',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Multiple Filter',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Default Value',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Actions',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
                rows: controller.formFields.asMap().entries.map((entry) {
                  final index = entry.key;
                  final field = entry.value;
                  // final itemIndex = entry.key;
                  final item = entry.value;
                  final fieldName = field.keys.first;
                  final fieldData = field[fieldName] as Map<String, dynamic>;
                  final itemFieldData = item[fieldName] as Map<String, dynamic>;
            
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text('${index + 1}')),
                      DataCell(Text(fieldName)),
                      // DataCell(Text(fieldData['type'].DataCell(Text(fieldData['type'].toString())))),
                      DataCell(Text(fieldData['type'].toString())),
                      DataCell(fieldData['type'] == 'Children' && itemFieldData['fields'] != null
                            ? Text(json.decode(itemFieldData['fields'].toString())
                                .keys
                                .join(', '))
                            : Text("-"),
                      ),
                      DataCell(Text(fieldData['required']?.toString() ?? "-")),
                      DataCell(Text(fieldData['show_in_view']?.toString() ?? "-")),
                      DataCell(Text(fieldData['show_in_report']?.toString() ?? "-")),
                      DataCell(Text(fieldData['show_in_edit']?.toString() ?? "-")),
                      DataCell(Text(fieldData['show_in_filter']?.toString() ?? "-")),
                      DataCell(Text(fieldData['show_in_list']?.toString() ?? "-")),
                      DataCell(Text(fieldData['show_in_add']?.toString() ?? "-")),
                      // DataCell(Text(fieldData['choices']?.toString() ?? "-")),
                      // DataCell(Text(fieldData['type'] == 'Choice' && fieldData['choices'] != null
                      //               ? (fieldData['choices'] as List).map((choice) => choice[1].toString()).join(', '): "-")),
                       DataCell(fieldData['type'] == 'Choice' && fieldData['choices'] != null
                              ? Container(margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.grey.shade300)
                                ),
                                child: DropdownButton<String>(
                                  menuMaxHeight: 150,
                                  borderRadius: BorderRadius.circular(10.0),
                                  dropdownColor: Theme.of(context).colorScheme.secondary,
                                    value: null,
                                    items: (fieldData['choices'] as List).map<DropdownMenuItem<String>>((choice) {
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
                      DataCell(Text(fieldData['min_length']?.toString() ?? "-")),
                      DataCell(Text(fieldData['max_length']?.toString() ?? "-")),
                      DataCell(Text(fieldData['read_only']?.toString() ?? "-")),
                      DataCell(Text(fieldData['max_digits']?.toString() ?? "-")),
                      DataCell(Text(fieldData['decimal_places']?.toString() ?? "-")),
                      DataCell(Text(fieldData['range_filter']?.toString() ?? "-")),
                      DataCell(Text(fieldData['default']?.toString() ?? "-")),
                      DataCell(Text(fieldData['multiple_filter']?.toString() ?? "-")),
                      DataCell(Text(fieldData['default']?.toString() ?? "-")),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => controller.editField(index, field),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => controller.removeField(index),
                          ),
                        ],
                      )),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: GetBuilder<DynamicController>(
        // initState: (_) => FeaturesController.to.initState(),
        builder: (value) =>  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Create Data", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.primary),),
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
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 0.5, color: Colors.grey)
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ResponsiveRow(
                            runSpacing: 10,
                            spacing: 20,
                            columns: [
                              ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: CommonComponents.defaultTextFormField(context,
                                  controller: controller.fieldNameController,
                                  hintText: 'Enter Field Name',
                                  decoration: const InputDecoration(
                                    labelText: 'Field Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(() => DropdownButtonFormField<String>(
                                  dropdownColor: Theme.of(context).colorScheme.secondary,
                                  menuMaxHeight: 250,
                                  focusColor: Theme.of(context).colorScheme.primary,
                                    value: controller.selectedFieldType,
                                    decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                                    ),
                                      hintText: "Select Type",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                                        ),
                                    ),
                                    items: controller.fieldTypes
                                        .map((type) => DropdownMenuItem(
                                              value: type,
                                              child: Text(type),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectedFieldType = value;
                                        controller.update();
                                      }
                                    },
                                  ),
                                ),
                              ),

                        if (controller.selectedFieldType == 'Children')
                          ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(() => DropdownButtonFormField<String>(
                                  dropdownColor: Theme.of(context).colorScheme.secondary,
                                  menuMaxHeight: 250,
                                  focusColor: Theme.of(context).colorScheme.primary,
                                    value: controller.selectedChildrenFieldType,
                                    decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                                    ),
                                      hintText: "Select Type",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                                        ),
                                    ),
                                    items: controller.itemFieldTypes
                                        .map((type) => DropdownMenuItem(
                                              value: type,
                                              child: Text(type),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectedChildrenFieldType = value;
                                        controller.update();
                                      }
                                    },
                                  ),
                                ),
                              ),
                        if (controller.selectedFieldType == 'Choice' || controller.selectedChildrenFieldType == 'Choice')
                            ResponsiveColumn(
                              ResponsiveConstants().buttonBreakpoints,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CommonComponents.defaultTextFormField(
                                      context,
                                      controller: controller.choiceController,
                                      hintText: 'Enter Choice',
                                      decoration: const InputDecoration(
                                        labelText: 'Add Choice',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    onPressed: () {
                                      print('asdasas ${jsonEncode(controller.choices)}');
                                      controller.addChoice();
                                      // controller.update();
                                    },
                                    icon: const Icon(Icons.add_circle_outline),
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ],
                              ),
                            ),
                        if (controller.choices.isNotEmpty)
                            ResponsiveColumn(
                              ResponsiveConstants().buttonBreakpoints,
                              child: DropdownButtonFormField<String>(
                                hint: const Text("Added Choices"),
                                dropdownColor: Theme.of(context).colorScheme.secondary,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                                  ),
                                ),
                                items: controller.choices.map<DropdownMenuItem<String>>((choice) {
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
                                onChanged: (value) {},
                              ),
                            ),
                        if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType == 'Char' || controller.selectedChildrenFieldType == 'Text')
                              ResponsiveColumn(
                                  ResponsiveConstants().buttonBreakpoints,
                                  child: Obx(() =>
                                      CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          value: controller.isRequired.value,
                                          title: 'Required',
                                          onChanged: (bool? value) {
                                        if (value != null) {
                                          controller.updateRequired(value);
                                        }
                                      }))),
                        if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType == 'Char' || controller.selectedChildrenFieldType == 'Text')
                              ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(
                                    () => CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          title: 'Show View',
                                          value: controller.isView.value,
                                          onChanged: (bool? value) {
                                            if (value != null) {
                                              controller.updateViewOnly(value);
                                            }
                                          },
                                        )),
                              ),
                        if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType == 'Char' || controller.selectedChildrenFieldType == 'Text')
                              ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(
                                    () => CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          title: 'Report',
                                          value: controller.isReport.value,
                                          onChanged: (bool? value) {
                                            if (value != null) {
                                              controller.updateReportOnly(value);
                                            }
                                          },
                                        )),
                              ),
                        if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType == 'Char' || controller.selectedChildrenFieldType == 'Text')
                              ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(
                                    () => CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          title: 'Edit',
                                          value: controller.isEdit.value,
                                          onChanged: (bool? value) {
                                            if (value != null) {
                                              controller.updateEditOnly(value);
                                            }
                                          },
                                        )),
                              ),
                        if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType == 'Char' || controller.selectedChildrenFieldType == 'Text')
                              ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(
                                    () => CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          title: 'Filter',
                                          value: controller.isFilter.value,
                                          onChanged: (bool? value) {
                                            if (value != null) {
                                              controller.updateFilterOnly(value);
                                            }
                                          },
                                        )),
                              ),
                        if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType == 'Char' || controller.selectedChildrenFieldType == 'Text')

                              ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(
                                    () => CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          title: ' Show List',
                                          value: controller.isList.value,
                                          onChanged: (bool? value) {
                                            if (value != null) {
                                              controller.updateListOnly(value);
                                            }
                                          },
                                        )),
                              ),
                        if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType == 'Char' || controller.selectedChildrenFieldType == 'Text')

                              ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(
                                    () => CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          title: 'Add',
                                          value: controller.isAdd.value,
                                          onChanged: (bool? value) {
                                            if (value != null) {
                                              controller.updateAddOnly(value);
                                            }
                                          },
                                        )),
                              ),
if (controller.selectedFieldType == 'ManyToMany')

                               ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(
                                    () => CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          title: 'Multiple Filter',
                                          value: controller.isMultipleFilter.value,
                                          onChanged: (bool? value) {
                                            if (value != null) {
                                              controller.updateMultipleFilter(value);
                                            }
                                          },
                                        )),
                              ),
if (controller.selectedFieldType == ' ')
                               ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(
                                    () => CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          title: 'Default',
                                          value: controller.isDefault.value,
                                          onChanged: (bool? value) {
                                            if (value != null) {
                                              controller.updateDefault(value);
                                            }
                                          },
                                        )),
                              ),

if (controller.selectedFieldType == 'Char' || controller.selectedFieldType == 'Text')
                              ResponsiveColumn(
                                            ResponsiveConstants().buttonBreakpoints,
                                  child: CommonComponents.defaultTextFormField(context,
                                              controller:
                                                  controller.maxLengthController,
                                              hintText: 'Enter Max Length',
                                              decoration: const InputDecoration(
                                                labelText: 'Max Length',
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.number,
                                            )
                                          ),
if (controller.selectedFieldType == 'Char' || controller.selectedFieldType == 'Text')
                                          ResponsiveColumn(
                                            ResponsiveConstants().buttonBreakpoints,
                                    child: CommonComponents.defaultTextFormField(context,
                                              controller:
                                                  controller.minLengthController,
                                              hintText: 'Enter Min Length',
                                              decoration: const InputDecoration(
                                                labelText: 'Min Length',
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.number,
                                            )
                                          ),
if (controller.selectedFieldType == 'DateTime' || controller.selectedFieldType == 'Date' ||
    controller.selectedFieldType == 'Time')
                                           ResponsiveColumn(
                                  ResponsiveConstants().buttonBreakpoints,
                                    child:   CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          value: controller.rangeFilter.value,
                                          title: 'Range Filter',
                                          onChanged: (bool? value) {
                                        if (value != null) {
                                          controller.updateRangeFilter(value);
                                        }
                                      })) ,
if (controller.selectedFieldType == 'DateTime' || controller.selectedFieldType == 'Date' ||
 controller.selectedFieldType == 'Time' || controller.selectedFieldType == 'Duration')
                                      ResponsiveColumn(
                                  ResponsiveConstants().buttonBreakpoints,
                                    child:  CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          value: controller.isReadOnly.value,
                                          title: 'Read Only',
                                          onChanged: (bool? value) {
                                        if (value != null) {
                                          controller.updateReadOnly(value);
                                        }
                                      })),
        if (controller.selectedFieldType == 'Decimal')
                              ResponsiveColumn(
                                            ResponsiveConstants().buttonBreakpoints,
                                  child: CommonComponents.defaultTextFormField(context,
                                              controller:
                                                  controller.maxDigitsController,
                                              hintText: 'Enter Max Digits',
                                              decoration: const InputDecoration(
                                                labelText: 'Max Digits',
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.number,
                                            ) 
                                          ),

        if (controller.selectedFieldType == 'Decimal')
                              ResponsiveColumn(
                                            ResponsiveConstants().buttonBreakpoints,
                                  child: CommonComponents.defaultTextFormField(context,
                                              controller:
                                                  controller.decimalPlacesController,
                                              hintText: 'Enter Decimal Place',
                                              decoration: const InputDecoration(
                                                labelText: 'Decimal Place',
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.number,
                                            )
                                          ),

if (controller.selectedFieldType == 'Children' && controller.itemFields.isNotEmpty)
  ResponsiveColumn(
    ResponsiveConstants().buttonBreakpoints,
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Child Fields:'),
          ...controller.itemFields.map((field) {
            String fieldName = field.keys.first;
            String fieldType = field[fieldName]['type'];
            return ListTile(
              dense: true,
              title: Text('$fieldName ($fieldType)'),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  controller.itemFields.remove(field);
                  controller.update();
                },
              ),
            );
          }).toList(),
        ],
      ),
    ),
  ),
                            ],
                          ),
                          Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 8),
                        Container(
                          color: Theme.of(context).colorScheme.secondary,
                            child: MaterialButton(
                              elevation: 2,
                              onPressed: () {
                                print("Printing the Data ${jsonEncode(controller.formFields)}");
                                controller.addField();
                                controller.update();
                              },
                              height: 50,
                              minWidth: 100,
                              color: Theme.of(context).colorScheme.primary,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Icon(
                                      controller.editingIndex >= 0 ? Icons.update : Icons.add_circle_outline_outlined,
                                      color: Theme.of(context).colorScheme.secondary),
                                    SizedBox(width: 12),
                                    Text(
                                      controller.editingIndex >= 0 ? "Update Field" : "Add Field",
                                    // Icon(Icons.add_circle_outline_outlined, color: Theme.of(context).colorScheme.secondary),
                                    // SizedBox(width: 12),
                                    // Text(
                                    //   "Add Field",
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).colorScheme.secondary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          // ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Obx(() {
                      if (controller.formFields.isNotEmpty) {
                        return Column(
                          children: [
                            buildFieldList(),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                        //         Container(
                        //           height: 50,
                        //           width: 150,
                        //           child: OutlinedButton(
                        //   style: ButtonStyle(
                        //     shape: WidgetStatePropertyAll(
                        //     BeveledRectangleBorder(
                        //       borderRadius: BorderRadius.circular(5),
                        //       side: BorderSide(width: 1.0,
                        //      color: Theme.of(context).colorScheme.secondary)
                        //     )
                        //   )),
                        //   // onPressed: () => Navigator.pop(context),
                        //   onPressed: () {},
                        //   child: const Text('Cancel'),
                        // ),
                        //         ),
                                Container(
                                width: 150,
                                color: Theme.of(context).colorScheme.secondary,
                                child: MaterialButton(
                                  elevation: 2,
                                   onPressed: () {
                                    if (formKey.currentState?.validate() ?? false) {
                                      controller.createDynamicData();
                                    }
                                  },
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
                                ),
                                                          // ),
                                                        ),
                              ],
                            ),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                        ],
                      ),
                    ),
                  ],
                ),
          )),
        ),
      ),
    );
  }
}
