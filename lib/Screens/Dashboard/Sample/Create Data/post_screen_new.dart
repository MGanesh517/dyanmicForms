// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:implementation_panel/BreakPoints/breakpoints.dart';
// import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
// import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
// import 'package:implementation_panel/Screens/Dashboard/custom_appbar.dart';
// import 'package:responsive_toolkit/responsive_grid.dart';

// class DynamicFormField {
//   final String id;
//   final String label;
//   final String type;
//   final Map<String, dynamic> options;
//   // final bool isRequired;
//   dynamic value;

//   DynamicFormField({
//     required this.id,
//     required this.label,
//     required this.type,
//     required this.options,
//     // this.isRequired = false,
//     this.value,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       label: {
//         'type': type,
//         ...options,
//       }
//     };
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final controller = Get.put(DynamicController());
//   final _formKey = GlobalKey<FormState>();
//   List<DynamicFormField> formFields = [];
//   final commonStyle =
//       const TextStyle(fontWeight: FontWeight.w600, color: Colors.black);

//   Map<String, Map<String, dynamic>> getDefaultOptions() {
//     return {
//       'Char': {
//         // 'required': false,
//         // 'max_length': 100,
//         // 'min_length': 1,
//         // 'show_in_view': true,
//         // 'show_in_report': true,
//         // 'show_in_edit': true,
//         // 'show_in_filter': false,
//         // 'show_in_list': true,
//         // 'show_in_add': true
//       },
//       'Text': {
//         // 'required': false,
//         // 'max_length': 1000,
//         // 'min_length': 5,
//         // 'show_in_view': true,
//         // 'show_in_report': true,
//         // 'show_in_edit': true,
//         // 'show_in_filter': false,
//         // 'show_in_list': true,
//         // 'show_in_add': true
//       },
//       'Choice': {
//         'required': false,
//         'default': 1,
//         'show_in_view': true,
//         'choices': [
//           [1, 'Male'],
//           [2, 'Female'],
//           [3, 'Others']
//         ],
//         'show_in_report': true,
//         'show_in_edit': true,
//         'show_in_filter': true,
//         'show_in_list': true,
//         'show_in_add': true
//       },
//       'Integer': {
//         'required': false,
//         'default': 0,
//         'show_in_view': true,
//         'show_in_report': true,
//         'show_in_edit': true,
//         'show_in_filter': false,
//         'show_in_list': true,
//         'show_in_add': true
//       },
//       'DateTime': {
//         'required': false,
//         'read_only': true,
//         'show_in_view': true,
//         'show_in_report': true,
//         'show_in_edit': true,
//         'show_in_filter': true,
//         'show_in_list': true,
//         'show_in_add': true,
//         'range_filter': true
//       },
//       'Date': {
//         'required': false,
//         'read_only': true,
//         'show_in_view': true,
//         'show_in_report': true,
//         'show_in_edit': true,
//         'show_in_filter': true,
//         'show_in_list': true,
//         'show_in_add': true,
//         'range_filter': true
//       },
//       'Time': {
//         'required': false,
//         'read_only': true,
//         'show_in_view': true,
//         'show_in_report': true,
//         'show_in_edit': true,
//         'show_in_filter': true,
//         'show_in_list': true,
//         'show_in_add': true
//       },
//       'Duration': {
//         'required': false,
//         'read_only': true,
//         'show_in_view': true,
//         'show_in_report': true,
//         'show_in_edit': true,
//         'show_in_filter': false,
//         'show_in_list': true,
//         'show_in_add': true
//       },
//       'Decimal': {
//         'required': false,
//         'max_digits': 9,
//         'decimal_places': 2,
//         'default': 0,
//         'show_in_view': true,
//         'show_in_report': true,
//         'show_in_edit': true,
//         'show_in_filter': false,
//         'show_in_list': true,
//         'show_in_add': true
//       },
//     };
//   }

//   Widget buildFieldOptions() {
//     final options = getDefaultOptions()[controller.selectedFieldType] ?? {};
//     List<Widget> optionWidgets = [];

//     // Common options
//     optionWidgets.add(
//       Obx(() => CheckboxListTile(
//             title: const Text('Required'),
//             value: controller.isRequired.value,
//             onChanged: (bool? value) {
//               controller.updateRequired(value ?? false);
//             },
//           )),
//     );
//     optionWidgets.add(
//       Obx(() => CheckboxListTile(
//             title: const Text('Show In View'),
//             value: controller.isView.value,
//             onChanged: (bool? value) {
//               controller.updateViewOnly(value ?? false);
//             },
//           )),
//     );
//     optionWidgets.add(
//       Obx(() => CheckboxListTile(
//             title: const Text('Report'),
//             value: controller.isReport.value,
//             onChanged: (bool? value) {
//               controller.updateReportOnly(value ?? false);
//             },
//           )),
//     );
//     optionWidgets.add(
//       Obx(() => CheckboxListTile(
//             title: const Text('Edit'),
//             value: controller.isEdit.value,
//             onChanged: (bool? value) {
//               controller.updateEditOnly(value ?? false);
//             },
//           )),
//     );
//     optionWidgets.add(
//       Obx(() => CheckboxListTile(
//             title: const Text('Filter'),
//             value: controller.isFilter.value,
//             onChanged: (bool? value) {
//               controller.updateFilterOnly(value ?? false);
//             },
//           )),
//     );
//     optionWidgets.add(
//       Obx(() => CheckboxListTile(
//             title: const Text('List'),
//             value: controller.isList.value,
//             onChanged: (bool? value) {
//               controller.updateListOnly(value ?? false);
//             },
//           )),
//     );
//     optionWidgets.add(
//       Obx(() => CheckboxListTile(
//             title: const Text('Add'),
//             value: controller.isAdd.value,
//             onChanged: (bool? value) {
//               controller.updateAddOnly(value ?? false);
//             },
//           )),
//     );

//     // Type-specific options
//     switch (controller.selectedFieldType) {
//       case 'Char':
//       case 'Text':
//         optionWidgets.addAll([
//           ResponsiveRow(runSpacing: 10, spacing: 20, columns: [
//             ResponsiveColumn(ResponsiveConstants().searchBreakPoint,
//                 child: TextField(
//                   controller: controller.maxLengthController,
//                   // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     FilteringTextInputFormatter.allow(
//                         RegExp(r'^([1-9][0-9]?|100)$')),
//                   ],
//                   decoration: const InputDecoration(
//                     labelText: 'Max Length',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                 )),
//             ResponsiveColumn(
//               ResponsiveConstants().searchBreakPoint,
//               child: TextField(
//                 controller: controller.minLengthController,
//                 // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   FilteringTextInputFormatter.allow(
//                       RegExp(r'^([1-9][0-9]?|100)$')),
//                 ],
//                 decoration: const InputDecoration(
//                   labelText: 'Min Length',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             )
//           ]),
//         ]);
//         break;

//       case 'Decimal':
//         optionWidgets.addAll([
//           ResponsiveRow(runSpacing: 10, spacing: 20, columns: [
//             ResponsiveColumn(
//               ResponsiveConstants().searchBreakPoint,
//               child: TextField(
//                 controller: controller.maxDigitsController,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                 decoration: const InputDecoration(
//                   labelText: 'Max Digits',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             ResponsiveColumn(
//               ResponsiveConstants().searchBreakPoint,
//               child: TextField(
//                 controller: controller.decimalPlacesController,
//                 decoration: const InputDecoration(
//                   labelText: 'Decimal Places',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             )
//           ]),
//         ]);
//         break;

//       case 'DateTime':
//       case 'Date':
//       case 'Time':
//       case 'Duration':
//         optionWidgets.add(
//           Obx(() => CheckboxListTile(
//                 title: const Text('Read Only'),
//                 value: controller.isReadOnly.value,
//                 onChanged: (bool? value) {
//                   controller.updateReadOnly(value ?? false);
//                 },
//               )),
//         );
//         break;
//     }

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: optionWidgets,
//     );
//   }

//   //////////////////////////////////**** List Card ****/ ///////////////////////////////////////

//   // Widget buildFieldList() {
//   //   return ListView.builder(
//   //     shrinkWrap: true,
//   //     physics: const NeverScrollableScrollPhysics(),
//   //     itemCount: formFields.length,
//   //     itemBuilder: (context, index) {
//   //       final field = formFields[index];
//   //       return ResponsiveRow(columns: [
//   //         ResponsiveColumn(ResponsiveConstants().cardBreakpoints,
//   //             child: Card(
//   //               color: Theme.of(context).colorScheme.primaryContainer,
//   //               margin: const EdgeInsets.symmetric(vertical: 8),
//   //               child: ListTile(
//   //                 title: Text(field.label),
//   //                 subtitle: Column(
//   //                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                   children: [
//   //                     Text('Type: ${field.type}'),
//   //                     ...field.options.entries
//   //                         .map((e) => Text('${e.key}: ${e.value}'))
//   //                         .toList(),
//   //                   ],
//   //                 ),
//   //                 trailing: IconButton(
//   //                   icon: const Icon(Icons.delete),
//   //                   onPressed: () {
//   //                     setState(() {
//   //                       formFields.removeAt(index);
//   //                     });
//   //                   },
//   //                 ),
//   //               ),
//   //             ))
//   //       ]);
//   //     },
//   //   );
//   // }

//   //////////////////////////////////**** Table Form ****////////////////////////////////////////

//   Widget buildFieldList() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       physics: const ScrollPhysics(),
//       child: Container(
//         padding: EdgeInsets.all(15.0),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             // color: Theme.of(context).colorScheme.primaryContainer,
//             color: Colors.white),
//         child: DataTable(
//           dataTextStyle: const TextStyle(fontWeight: FontWeight.w400),
//           headingRowColor: const WidgetStatePropertyAll(Color(0xfff7fafc)),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           dividerThickness: 0.2,
//           border: TableBorder(
//               verticalInside: BorderSide(color: Colors.grey[100]!),
//               borderRadius: BorderRadius.circular(15),
//               bottom: BorderSide(color: Colors.grey[100]!),
//               left: BorderSide(color: Colors.grey[100]!),
//               right: BorderSide(color: Colors.grey[100]!),
//               horizontalInside:
//                   const BorderSide(width: 0, color: Color(0xfff7fafc))),
//           columns: const <DataColumn>[
//             DataColumn(
//                 label: Text(
//               'S.No',
//               overflow: TextOverflow.ellipsis,
//               // style: TextStyle(fontWeight: FontWeight.bold, )
//               style:
//                   TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
//             )),
//             DataColumn(
//                 label: Text(
//               'Field Name',
//               overflow: TextOverflow.ellipsis,
//               // style: TextStyle(fontWeight: FontWeight.bold, )
//               style:
//                   TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
//             )),
//             DataColumn(
//                 label: Text('Field Type',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(
//                 label: Text('Required',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(
//                 label: Text('View',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(
//                 label: Text('Report',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(
//                 label: Text('Edit',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(
//                 label: Text('Filter',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(
//                 label: Text('List',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(
//                 label: Text('Add',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(
//                 label: Text('Actions',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(fontWeight: FontWeight.bold))),
//           ],
//           rows: formFields.asMap().entries.map((entry) {
//             final index = entry.key;
//             final field = entry.value;

//             return DataRow(
//               cells: <DataCell>[
//                 DataCell(Text("${formFields.length}")),
//                 DataCell(Text(field.label)),
//                 DataCell(Text(field.type)),
//                 DataCell(
//                     Text(field.options['required']?.toString() ?? 'false')),
//                 DataCell(
//                     Text(field.options['show_in_view']?.toString() ?? 'false')),
//                 DataCell(Text(
//                     field.options['show_in_report']?.toString() ?? 'false')),
//                 DataCell(
//                     Text(field.options['show_in_edit']?.toString() ?? 'false')),
//                 DataCell(Text(
//                     field.options['show_in_filter']?.toString() ?? 'false')),
//                 DataCell(
//                     Text(field.options['show_in_list']?.toString() ?? 'false')),
//                 DataCell(
//                     Text(field.options['show_in_add']?.toString() ?? 'false')),
//                 DataCell(IconButton(
//                   icon: const Icon(Icons.delete),
//                   onPressed: () {
//                     setState(() {
//                       formFields.removeAt(index);
//                     });
//                   },
//                 )),
//               ],
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   void _addNewField(String fieldName, String fieldType) {
//     final options = getDefaultOptions()[fieldType]
//             ?.map((key, value) => MapEntry(key, value)) ??
//         {};

//     // Update options based on user input
//     options['required'] = controller.isRequired.value;
//     options['show_in_view'] = controller.isView.value;
//     options['show_in_report'] = controller.isReport.value;
//     options['show_in_edit'] = controller.isEdit.value;
//     options['show_in_filter'] = controller.isFilter.value;
//     options['show_in_list'] = controller.isList.value;
//     options['show_in_add'] = controller.isAdd.value;
//     options['required'] = controller.isRequired.value;

//     switch (fieldType) {
//       case 'Char':
//       case 'Text':
//         options['max_length'] =
//             int.tryParse(controller.maxLengthController.text) ??
//                 options['max_length'];
//         options['min_length'] =
//             int.tryParse(controller.minLengthController.text) ??
//                 options['min_length'];
//         break;
//       case 'Decimal':
//         options['max_digits'] =
//             int.tryParse(controller.maxDigitsController.text) ??
//                 options['max_digits'];
//         options['decimal_places'] =
//             int.tryParse(controller.decimalPlacesController.text) ??
//                 options['decimal_places'];
//         break;
//       case 'DateTime':
//       case 'Date':
//       case 'Time':
//       case 'Duration':
//         options['read_only'] = controller.isReadOnly.value;
//         break;
//     }

//     setState(() {
//       formFields.add(
//         DynamicFormField(
//           id: 'field_${formFields.length}',
//           label: fieldName,
//           type: fieldType,
//           options: options,
//         ),
//       );
//     });
//   }

//   void submitForm() {
//     if (_formKey.currentState!.validate()) {
//       final Map<String, dynamic> jsonData = {
//         'app_label': controller.appLabel.text,
//         'model_name': controller.modelName.text,
//         'fields': {}
//       };

//       // Add all form fields to the fields object
//       for (var field in formFields) {
//         jsonData['fields'].addAll(field.toJson());
//       }

//       print('Submitting data: ${jsonEncode(jsonData)}');
//       controller.createDynamicData();
//     }
//   }

//   void showAddFieldDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         final Size screenSize = MediaQuery.of(context).size;

//         final double dialogWidth = screenSize.width * 0.7;
//         // final double maxWidth = 500.0; // Maximum width
//         final double dialogHeight = screenSize.height * 0.8;
//         // final double maxHeight = 600.0; // Maximum height

//         return Obx(() => Center(
//               child: SizedBox(
//                 width: dialogWidth,
//                 height: dialogHeight,
//                 child: Dialog(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10))),
//                   child: Wrap(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             top: 10, bottom: 10, left: 30, right: 30),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Add New Field',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     color:
//                                         Theme.of(context).colorScheme.primary,
//                                     fontWeight: FontWeight.bold)),
//                             IconButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 icon: Icon(Icons.close))
//                           ],
//                         ),
//                       ),
//                       Divider(color: Colors.grey),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10, horizontal: 30),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               ResponsiveRow(
//                                   runSpacing: 10,
//                                   spacing: 20,
//                                   columns: [
//                                     ResponsiveColumn(
//                                       ResponsiveConstants().searchBreakPoint,
//                                       child: TextFormField(
//                                         controller:
//                                             controller.fieldNameController,
//                                         decoration: const InputDecoration(
//                                           labelText: 'Field Name',
//                                           border: OutlineInputBorder(),
//                                         ),
//                                       ),
//                                     ),
//                                     ResponsiveColumn(
//                                         ResponsiveConstants().searchBreakPoint,
//                                         child: DropdownButtonFormField<String>(
//                                         // child: CommonComponents.defaultDropdownSearch(context,
//                                           // compareFn:
//                                           //     controller.selectedFieldType,
//                                           // title: "Field Type",
//                                           // hintText: "Select Field Type",
//                                           decoration: const InputDecoration(
//                                             labelText: 'Field Type',
//                                             border: OutlineInputBorder(),
//                                           ),
//                                           items: getDefaultOptions()
//                                               .keys
//                                               .map((type) {
//                                             return DropdownMenuItem(
//                                               value: type,
//                                               child: Text(type),
//                                             );
//                                           }).toList(),
//                                           onChanged: (value) {
//                                             controller.selectedFieldType =
//                                                 value!;
//                                           },
//                                         ))
//                                   ]),
//                               buildFieldOptions(),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 20, horizontal: 30),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             OutlinedButton(
//                               onPressed: () => Navigator.pop(context),
//                               child: const Text('Cancel'),
//                             ),
//                             SizedBox(width: 10),
//                             ElevatedButton(
//                               onPressed: () {
//                                 print("gfsghfg ::: ${jsonEncode(formFields)}");
//                                 if (controller
//                                     .fieldNameController.text.isNotEmpty) {
//                                   _addNewField(
//                                     controller.fieldNameController.text,
//                                     controller.selectedFieldType,
//                                   );
//                                   controller.addFieldsDisposeController();
//                                   Navigator.pop(context);
//                                 }
//                               },
//                               child: const Text('Add Field'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ));
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CommonScaffoldWithAppBar(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               ResponsiveRow(
//                 runSpacing: 10,
//                 spacing: 20,
//                 columns: [
//                   ResponsiveColumn(
//                     ResponsiveConstants().searchBreakPoint,
//                     child: CommonComponents.defaultTextField(
//                       context,
//                       title: 'App Label',
//                       hintText: 'Enter App Label',
//                       controller: controller.appLabel,
//                       validator: (String? val) {
//                         if (val == '') {
//                           return 'Please enter a valid App Label';
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.text,
//                       textInputAction: TextInputAction.next,
//                       onChange: (val) {},
//                     ),
//                   ),
//                   ResponsiveColumn(
//                     ResponsiveConstants().searchBreakPoint,
//                     child: CommonComponents.defaultTextField(
//                       context,
//                       title: 'Model Name',
//                       hintText: 'Enter Model Name',
//                       controller: controller.modelName,
//                       validator: (String? val) {
//                         if (val == '') {
//                           return 'Please enter a valid Model Name';
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.text,
//                       textInputAction: TextInputAction.next,
//                       onChange: (val) {},
//                     ),
//                   ),
//                   ResponsiveColumn(
//                     ResponsiveConstants().textFormField,
//                     child: CommonComponents.defaultTextField(
//                       context,
//                       controller: controller.fieldNameController,
//                       title: 'Field Name',
//                       hintText: 'Enter Field Name',
//                       decoration: const InputDecoration(
//                         labelText: 'Field Name',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   ResponsiveColumn(ResponsiveConstants().searchBreakPoint,
//                       // child: DropdownButtonFormField<String>(
//                       child: Obx(() => CommonComponents.defaultDropdownSearch(
//                             context,
//                             compareFn: controller.selectedFieldType,
//                             title: "Field Type",
//                             hintText: "Select Field Type",
//                             // decoration: const InputDecoration(
//                             //   labelText: 'Field Type',
//                             //   border: OutlineInputBorder(),
//                             // ),
//                             asyncItems: (String filter) async {
//                               return getDefaultOptions().keys.map((type) {
//                                 return DropdownMenuItem(
//                                   value: type,
//                                   child: Text(type),
//                                 );
//                               }).toList();
//                             },
//                             onChanged: (value) {
//                               controller.selectedFieldType = value!;
//                             },
//                           ))),
//                   // ResponsiveColumn(ResponsiveConstants().textFormField, child: buildFieldOptions())
//                   // ResponsiveColumn(
//                   //   ResponsiveConstants().buttonBreakpoints,
//                   //   child: Padding(
//                   //     padding:
//                   //         const EdgeInsets.only(top: 12, right: 12, bottom: 12),
//                   //     child: MaterialButton(
//                   //       minWidth: 85,
//                   //       height: 45,
//                   //       elevation: 0.0,
//                   //       shape: RoundedRectangleBorder(
//                   //           borderRadius: BorderRadius.circular(10)),
//                   //       color: Theme.of(context).colorScheme.primary,
//                   //       highlightColor: Theme.of(context).colorScheme.primary,
//                   //       // onPressed: showAddFieldDialog,
//                   //       onPressed: () {},
//                   //       child: Text(
//                   //         "Add Fields",
//                   //         style: TextStyle(
//                   //           color: Theme.of(context).colorScheme.secondary,
//                   //           fontSize: 18,
//                   //           fontWeight: FontWeight.w600,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//               // if (formFields.isNotEmpty)
//               if (formFields.isNotEmpty) ...[
//                 buildFieldList(),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: submitForm,
//                   child: const Text('Submit'),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
