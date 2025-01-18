import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Widget buildFieldOptions() {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveRow(columns: [
          ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
              child: Obx(() => CheckboxListTile(
                    title: const Text('Required'),
                    value: controller.isRequired.value,
                    onChanged: (bool? value) {
                      if (value != null) {
                        controller.updateRequired(value);
                      }
                    },
                  ))),
          ResponsiveColumn(
            ResponsiveConstants().buttonBreakpoints,
            child: Obx(() => CheckboxListTile(
                  title: const Text('Show'),
                  value: controller.isView.value,
                  onChanged: (bool? value) {
                    if (value != null) {
                      controller.updateViewOnly(value);
                    }
                  },
                )),
          ),
          ResponsiveColumn(
            ResponsiveConstants().buttonBreakpoints,
            child: Obx(() => CheckboxListTile(
                  title: const Text('Report'),
                  value: controller.isReport.value,
                  onChanged: (bool? value) {
                    if (value != null) {
                      controller.updateReportOnly(value);
                    }
                  },
                )),
          ),
          ResponsiveColumn(
            ResponsiveConstants().buttonBreakpoints,
            child: Obx(() => CheckboxListTile(
                  title: const Text('Edit'),
                  value: controller.isEdit.value,
                  onChanged: (bool? value) {
                    if (value != null) {
                      controller.updateEditOnly(value);
                    }
                  },
                )),
          ),
          ResponsiveColumn(
            ResponsiveConstants().buttonBreakpoints,
            child: Obx(() => CheckboxListTile(
                  title: const Text('Filter'),
                  value: controller.isFilter.value,
                  onChanged: (bool? value) {
                    if (value != null) {
                      controller.updateFilterOnly(value);
                    }
                  },
                )),
          ),
          ResponsiveColumn(
            ResponsiveConstants().buttonBreakpoints,
            child: Obx(() => CheckboxListTile(
                  title: const Text('List'),
                  value: controller.isList.value,
                  onChanged: (bool? value) {
                    if (value != null) {
                      controller.updateListOnly(value);
                    }
                  },
                )),
          ),
          ResponsiveColumn(
            ResponsiveConstants().buttonBreakpoints,
            child: Obx(() => CheckboxListTile(
                  title: const Text('Add'),
                  value: controller.isAdd.value,
                  onChanged: (bool? value) {
                    if (value != null) {
                      controller.updateAddOnly(value);
                    }
                  },
                )),
          ),
          ResponsiveColumn(
            ResponsiveConstants().searchBreakPoint,
            child: (controller.selectedFieldType == 'Char' ||
                    controller.selectedFieldType == 'Text')
                ? ResponsiveRow(
                    runSpacing: 10,
                    spacing: 20,
                    columns: [
                      ResponsiveColumn(
                        ResponsiveConstants().buttonBreakpoints,
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                          controller: controller.maxLengthController,
                          decoration: const InputDecoration(
                            labelText: 'Max Length',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      ResponsiveColumn(
                        ResponsiveConstants().buttonBreakpoints,
                        child: TextField(
                          controller: controller.minLengthController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Min Length',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          )
        ]),
        // if (controller.selectedFieldType == 'Char' ||
        //     controller.selectedFieldType == 'Text')
        //   ResponsiveRow(
        //     runSpacing: 10,
        //     spacing: 20,
        //     columns: [
        //       ResponsiveColumn(
        //         ResponsiveConstants().searchBreakPoint,
        //         child: TextField(
        //           controller: controller.maxLengthController,
        //           decoration: const InputDecoration(
        //             labelText: 'Max Length',
        //             border: OutlineInputBorder(),
        //           ),
        //           keyboardType: TextInputType.number,
        //         ),
        //       ),
        //       ResponsiveColumn(
        //         ResponsiveConstants().searchBreakPoint,
        //         child: TextField(
        //           controller: controller.minLengthController,
        //           decoration: const InputDecoration(
        //             labelText: 'Min Length',
        //             border: OutlineInputBorder(),
        //           ),
        //           keyboardType: TextInputType.number,
        //         ),
        //       ),
        //     ],
        //   ),
        if (controller.selectedFieldType == 'Decimal')
          ResponsiveRow(
            runSpacing: 10,
            spacing: 20,
            columns: [
              ResponsiveColumn(
                ResponsiveConstants().buttonBreakpoints,
                child: TextField(
                  controller: controller.maxDigitsController,
                  decoration: const InputDecoration(
                    labelText: 'Max Digits',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ResponsiveColumn(
                ResponsiveConstants().buttonBreakpoints,
                child: TextField(
                  controller: controller.decimalPlacesController,
                  decoration: const InputDecoration(
                    labelText: 'Decimal Places',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget buildFieldList() {
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                  final fieldName = field.keys.first;
                  final fieldData = field[fieldName] as Map<String, dynamic>;
            
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text('${index + 1}')),
                      DataCell(Text(fieldName)),
                      // DataCell(Text(fieldData['type'].DataCell(Text(fieldData['type'].toString())))),
                      DataCell(Text(fieldData['type'].toString())),
                      DataCell(Text(fieldData['required'].toString())),
                      DataCell(Text(fieldData['show_in_view'].toString())),
                      DataCell(Text(fieldData['show_in_report'].toString())),
                      DataCell(Text(fieldData['show_in_edit'].toString())),
                      DataCell(Text(fieldData['show_in_filter'].toString())),
                      DataCell(Text(fieldData['show_in_list'].toString())),
                      DataCell(Text(fieldData['show_in_add'].toString())),
                      DataCell(Text(fieldData['min_length'].toString())),
                      DataCell(Text(fieldData['max_length'].toString())),
                      DataCell(Text(fieldData['read_only'].toString())),
                      DataCell(Text(fieldData['default'].toString())),
                      DataCell(IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => controller.removeField(index),
                      )),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ));
  }

  // void showAddFieldDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       final Size screenSize = MediaQuery.of(context).size;
  //       final double dialogWidth = screenSize.width * 0.7;
  //       final double dialogHeight = screenSize.height * 0.8;

  //       return Dialog(
  //         shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(10)),
  //         ),
  //         child: Obx(() => SizedBox(
  //               width: dialogWidth,
  //               height: dialogHeight,
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.all(16.0),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                           'Add New Field',
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             color: Theme.of(context).colorScheme.primary,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                         IconButton(
  //                           onPressed: () => Navigator.pop(context),
  //                           icon: const Icon(Icons.close),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   const Divider(),
  //                   Expanded(
  //                     child: SingleChildScrollView(
  //                       padding: const EdgeInsets.all(16.0),
  //                       child: Column(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: [
  //                           ResponsiveRow(
  //                             runSpacing: 10,
  //                             spacing: 20,
  //                             columns: [
  //                               ResponsiveColumn(
  //                                 ResponsiveConstants().searchBreakPoint,
  //                                 child: TextFormField(
  //                                   controller: controller.fieldNameController,
  //                                   decoration: const InputDecoration(
  //                                     labelText: 'Field Name',
  //                                     border: OutlineInputBorder(),
  //                                   ),
  //                                 ),
  //                               ),
  //                               ResponsiveColumn(
  //                                 ResponsiveConstants().searchBreakPoint,
  //                                 child:
  //                                     Obx(() => DropdownButtonFormField<String>(
  //                                           value: controller.selectedFieldType,
  //                                           decoration: const InputDecoration(
  //                                             labelText: 'Field Type',
  //                                             border: OutlineInputBorder(),
  //                                           ),
  //                                           items: controller.fieldTypes
  //                                               .map((type) => DropdownMenuItem(
  //                                                     value: type,
  //                                                     child: Text(type),
  //                                                   ))
  //                                               .toList(),
  //                                           onChanged: (value) {
  //                                             if (value != null) {
  //                                               controller.selectedFieldType =
  //                                                   value;
  //                                             }
  //                                           },
  //                                         )),
  //                               ),
  //                             ],
  //                           ),
  //                           const SizedBox(height: 16),
  //                           buildFieldOptions(),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(16.0),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: [
  //                         OutlinedButton(
  //                           onPressed: () => Navigator.pop(context),
  //                           child: const Text('Cancel'),
  //                         ),
  //                         const SizedBox(width: 8),
  //                         ElevatedButton(
  //                           onPressed: () {
  //                             controller.addField();
  //                             Navigator.pop(context);
  //                           },
  //                           child: const Text('Add Field'),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             )),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Obx(() => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    // Divider(),
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
                                  // title: 'Field Name',
                                  hintText: 'Enter Field Name',
                                  decoration: const InputDecoration(
                                    labelText: 'Field Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              // Field Type Dropdown
                              ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(() => DropdownButtonFormField<String>(
                                  dropdownColor: Theme.of(context).colorScheme.secondary,
                                  menuMaxHeight: 250,focusColor: Theme.of(context).colorScheme.primary,
                                    value: controller.selectedFieldType,
                                    decoration: InputDecoration(
                                      labelText: 'Field Type',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5)
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
                                      }
                                    },
                                  ),
                                ),
                              ),
                      
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
                              ResponsiveColumn(
                                ResponsiveConstants().buttonBreakpoints,
                                child: Obx(
                                    () => CommonComponents.defaultCheckBoxListTile(
                                          context,
                                          title: 'List',
                                          value: controller.isList.value,
                                          onChanged: (bool? value) {
                                            if (value != null) {
                                              controller.updateListOnly(value);
                                            }
                                          },
                                        )),
                              ),
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
                              ResponsiveColumn(
                                ResponsiveConstants().searchBreakPoint,
                                child: (controller.selectedFieldType == 'Char' ||
                                        controller.selectedFieldType == 'Text')
                                    ? ResponsiveRow(
                                        runSpacing: 10,
                                        spacing: 20,
                                        columns: [
                                          ResponsiveColumn(
                                            ResponsiveConstants().fixedBreakPoints,
                                            child: CommonComponents.defaultTextFormField(context,
                                              controller:
                                                  controller.maxLengthController,
                                                  // title: 'Max Length',
                                              hintText: 'Enter Max Length',
                                              decoration: const InputDecoration(
                                                labelText: 'Max Length',
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.number,
                                            ),
                                          ),
                                          ResponsiveColumn(
                                            ResponsiveConstants().fixedBreakPoints,
                                            child: CommonComponents.defaultTextFormField(context,
                                              controller:
                                                  controller.minLengthController,
                                                  // title: 'Min Length',
                                              hintText: 'Enter Min Length',
                                              decoration: const InputDecoration(
                                                labelText: 'Min Length',
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.number,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                              )
                              // ]
                              // ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // buildFieldOptions(),
                          Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // OutlinedButton(
                        //   style: ButtonStyle(
                        //     shape: WidgetStatePropertyAll(
                        //     BeveledRectangleBorder(
                        //       borderRadius: BorderRadius.circular(5),
                        //       side: BorderSide(width: 1.0, color: Colors.black)
                        //     )
                        //   )),
                        //   onPressed: () => Navigator.pop(context),
                        //   child: const Text('Cancel'),
                        // ),
                        const SizedBox(width: 8),
                        Container(
                          color: Theme.of(context).colorScheme.secondary,
                          // child: Padding(
                          //   padding: const EdgeInsets.all(16),
                            child: MaterialButton(
                              elevation: 2,
                              onPressed: () {
                                controller.addField();
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
                                    Icon(Icons.add_circle_outline_outlined, color: Theme.of(context).colorScheme.secondary),
                                    SizedBox(width: 12),
                                    Text(
                                      "Add Field",
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
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  controller.createDynamicData();
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                        ],
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     // OutlinedButton(
                    //     //   style: ButtonStyle(
                    //     //     shape: WidgetStatePropertyAll(
                    //     //     BeveledRectangleBorder(
                    //     //       borderRadius: BorderRadius.circular(5),
                    //     //       side: BorderSide(width: 1.0, color: Colors.black)
                    //     //     )
                    //     //   )),
                    //     //   onPressed: () => Navigator.pop(context),
                    //     //   child: const Text('Cancel'),
                    //     // ),
                    //     const SizedBox(width: 8),
                    //     Container(
                    //       color: Theme.of(context).colorScheme.secondary,
                    //       // child: Padding(
                    //       //   padding: const EdgeInsets.all(16),
                    //         child: MaterialButton(
                    //           onPressed: () {
                    //             controller.addField();
                    //           },
                    //           height: 50,
                    //           minWidth: 100,
                    //           color: Theme.of(context).colorScheme.primary,
                    //           shape: const RoundedRectangleBorder(
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(6)),
                    //           ),
                    //           child: Center(
                    //             child: Text(
                    //               "Add Field",
                    //               style: TextStyle(
                    //                 color:
                    //                     Theme.of(context).colorScheme.secondary,
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.w600,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       // ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 16),
                    // Obx(() {
                    //   if (controller.formFields.isNotEmpty) {
                    //     return Column(
                    //       children: [
                    //         buildFieldList(),
                    //         const SizedBox(height: 16),
                    //         ElevatedButton(
                    //           onPressed: () {
                    //             if (formKey.currentState?.validate() ?? false) {
                    //               controller.createDynamicData();
                    //             }
                    //           },
                    //           child: const Text('Submit'),
                    //         ),
                    //       ],
                    //     );
                    //   }
                    //   return const SizedBox.shrink();
                    // }),
                  ],
                ),
          )),
        ),
      ),
    );
  }
}
