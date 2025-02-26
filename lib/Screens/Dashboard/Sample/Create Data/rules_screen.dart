import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/BreakPoints/breakpoints.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
import 'package:implementation_panel/Screens/Dashboard/advance%20Filters/advance_filter_controller.dart';
import 'package:implementation_panel/Screens/Dashboard/advance%20Filters/advance_filters_screen.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

// class RulesScreenWidget extends StatefulWidget {
//   const RulesScreenWidget({super.key});

//   @override
//   State<RulesScreenWidget> createState() => _RulesScreenWidgetState();
// }

// class _RulesScreenWidgetState extends State<RulesScreenWidget>
//     with SingleTickerProviderStateMixin {
//   final controller = Get.put(DynamicController());
//   final formKey = GlobalKey<FormState>();
//   int index = 0;
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   Widget buildIfCondition() {
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
//                 headingRowColor:
//                     const WidgetStatePropertyAll(Color(0xfff7fafc)),
//                 dataRowColor: WidgetStatePropertyAll(Color(0xffffffff)),
//                 columns: <DataColumn>[
//                   DataColumn(
//                       label: Text('S.No',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Field Name',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Change Type',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Change Field',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Change Value',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Mandatory',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Hide',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Disable',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                 ],
//                 rows: controller.formFields.isEmpty
//                     ? const []
//                     : controller.formFields.expand((entry) {
//                         index = 0;
//                         return entry.entries.map((field) {
//                           final fieldName = field.key;
//                           index++;
//                           final attributes =
//                               field.value as Map<String, dynamic>;
//                           return DataRow(cells: [
//                             DataCell(Text(
//                                 '${controller.dynamicDetails.fields1 != null ? index : controller.formFields.indexOf(entry) + 1}')),
//                             DataCell(Text(fieldName)),
//                             DataCell(
//                                 Text(attributes['change_type'].toString())),
//                             DataCell(
//                                 Text(attributes['change_field'].toString())),
//                             DataCell(
//                                 Text(attributes['change_value'].toString())),
//                             DataCell(Text(
//                                 attributes['mandatory']?.toString() ?? "-")),
//                             DataCell(
//                                 Text(attributes['hide']?.toString() ?? "-")),
//                             DataCell(
//                                 Text(attributes['disable']?.toString() ?? "-")),
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

//   Widget buildElseCondition() {
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
//                 headingRowColor:
//                     const WidgetStatePropertyAll(Color(0xfff7fafc)),
//                 dataRowColor: WidgetStatePropertyAll(Color(0xffffffff)),
//                 columns: <DataColumn>[
//                   DataColumn(
//                       label: Text('S.No',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Field Name',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Change Type',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Change Field',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Change Value',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Mandatory',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Hide',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                   DataColumn(
//                       label: Text('Disable',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black))),
//                 ],
//                 rows: controller.formFields.isEmpty
//                     ? const []
//                     : controller.formFields.expand((entry) {
//                         index = 0;
//                         return entry.entries.map((field) {
//                           final fieldName = field.key;
//                           index++;
//                           final attributes =
//                               field.value as Map<String, dynamic>;
//                           return DataRow(cells: [
//                             DataCell(Text(
//                                 '${controller.dynamicDetails.fields1 != null ? index : controller.formFields.indexOf(entry) + 1}')),
//                             DataCell(Text(fieldName)),
//                             DataCell(
//                                 Text(attributes['change_type'].toString())),
//                             DataCell(
//                                 Text(attributes['change_field'].toString())),
//                             DataCell(
//                                 Text(attributes['change_value'].toString())),
//                             DataCell(Text(
//                                 attributes['mandatory']?.toString() ?? "-")),
//                             DataCell(
//                                 Text(attributes['hide']?.toString() ?? "-")),
//                             DataCell(
//                                 Text(attributes['disable']?.toString() ?? "-")),
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

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.secondary,
//                 borderRadius: BorderRadius.circular(10.0),
//                 border: Border.all(color: Colors.grey.shade300),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//               child: Column(
//                 children: [
//                   ResponsiveRow(runSpacing: 10, spacing: 20, columns: [
//                     ResponsiveColumn(
//                       ResponsiveConstants().buttonBreakpoints,
//                       child: CommonComponents.defaultCheckBoxListTile(
//                         context,
//                         title: "New Record",
//                         value: controller.isNewRecord.value,
//                         onChanged: (bool? value) {
//                           if (value != null) {
//                             controller.updateIsNewRecord(value);
//                           }
//                         },
//                       ),
//                     ),
//                     ResponsiveColumn(
//                       ResponsiveConstants().buttonBreakpoints,
//                       child: CommonComponents.defaultCheckBoxListTile(
//                         context,
//                         title: "Edit Record",
//                         value: controller.isEditRecord.value,
//                         onChanged: (bool? value) {
//                           if (value != null) {
//                             controller.updateIsEditRecord(value);
//                           }
//                         },
//                       ),
//                     ),
//                     ResponsiveColumn(
//                       ResponsiveConstants().buttonBreakpoints,
//                       child: CommonComponents.defaultCheckBoxListTile(
//                         context,
//                         title: "On Load",
//                         value: controller.isOnLoad.value,
//                         onChanged: (bool? value) {
//                           if (value != null) {
//                             controller.updateIsOnLoad(value);
//                           }
//                         },
//                       ),
//                     ),
//                     ResponsiveColumn(
//                       ResponsiveConstants().buttonBreakpoints,
//                       child: CommonComponents.defaultCheckBoxListTile(
//                         context,
//                         title: "On Leave",
//                         value: controller.isOnLeave.value,
//                         onChanged: (bool? value) {
//                           if (value != null) {
//                             controller.updateIsOnLeave(value);
//                           }
//                         },
//                       ),
//                     ),
//                     // ResponsiveColumn(
//                     //   ResponsiveConstants().buttonBreakpoints,
//                     //   child: CommonComponents.defaultCheckBoxListTile(
//                     //     context,
//                     //     title: "On Enter",
//                     //     value: controller.isOnEnter.value,
//                     //     onChanged: (bool? value) {
//                     //     if (value != null) {
//                     //       controller.updateIsOnEnter(value);
//                     //     }
//                     //     },
//                     //   ),
//                     // ),
//                     ResponsiveColumn(
//                       ResponsiveConstants().buttonBreakpoints,
//                       child: CommonComponents.defaultCheckBoxListTile(
//                         context,
//                         title: "Status Change",
//                         value: controller.isActive.value,
//                         onChanged: (bool? value) {
//                           if (value != null) {
//                             controller.updateIsActive(value);
//                           }
//                         },
//                       ),
//                     ),
//                   ]),
//                 ],
//               ),
//             ),
//             SizedBox(height: 12.0),
//             TabBar(
//               labelPadding: const EdgeInsets.symmetric(horizontal: 15),
//               indicatorSize: TabBarIndicatorSize.label,
//               isScrollable: true,
//               tabAlignment: TabAlignment.start,
//               controller: _tabController,
//               tabs: const [
//                 Tab(text: "Search"),
//                 Tab(text: "Control"),
//               ],
//               indicatorColor: Colors.blue,
//               labelColor: Colors.black,
//               unselectedLabelColor: Colors.grey,
//             ),
//             Expanded(
//                 child: TabBar(controller: _tabController, tabs: [
//               Center(child: buildIfCondition()),
//               Center(child: buildElseCondition()),
//             ])),
//             Container(
//               width: 100,
//               color: Theme.of(context).colorScheme.secondary,
//               child: MaterialButton(
//                 elevation: 2,
//                 onPressed: () {
//                   print(
//                       "Printing the Rules ==>>>  ${jsonEncode(controller.addRule)}");
//                   controller.addRule();
//                   // controller.update();
//                 },
//                 height: 50,
//                 minWidth: 100,
//                 color: Theme.of(context).colorScheme.primary,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(6)),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Update",
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.secondary,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }


class RulesScreenWidget extends StatefulWidget {
  const RulesScreenWidget({super.key});

  @override
  State<RulesScreenWidget> createState() => _RulesScreenWidgetState();
}

// class _RulesScreenWidgetState extends State<RulesScreenWidget>
//     with SingleTickerProviderStateMixin {
//   final controller = Get.put(DynamicController());
//   final formKey = GlobalKey<FormState>();
//   int index = 0;
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

class _RulesScreenWidgetState extends State<RulesScreenWidget>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(DynamicController());
  final advanceFilterController = Get.put(AdvancedFilterController());
  final ValueNotifier<int> _selectedTab = ValueNotifier<int>(0);
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    
    // Listen for tab changes
    _tabController.addListener(() {
      _selectedTab.value = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _selectedTab.dispose();
    super.dispose();
  }


//   Widget buildDataTable({bool isIfCondition = true}) {
//   return Obx(() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300, width: 1.0),
//           borderRadius: BorderRadius.circular(10),
//           color: Theme.of(context).colorScheme.secondary,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             physics: const AlwaysScrollableScrollPhysics(),
//             child: DataTable(
//               showCheckboxColumn: true,
//               checkboxHorizontalMargin: 10.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               dataTextStyle: const TextStyle(fontWeight: FontWeight.w400),
//               headingRowColor: const WidgetStatePropertyAll(Color(0xfff7fafc)),
//               dataRowColor: const WidgetStatePropertyAll(Color(0xffffffff)),
//               columns: <DataColumn>[
//                 const DataColumn(
//                     label: Text('S.No',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black))),
//                 const DataColumn(
//                     label: Text('Field Name',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black))),
//                 const DataColumn(
//                     label: Text('Change Type',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black))),
//                 const DataColumn(
//                     label: Text('Change Field',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black))),
//                 const DataColumn(
//                     label: Text('Change Value',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black))),
//                 const DataColumn(
//                     label: Text('Mandatory',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black))),
//                 const DataColumn(
//                     label: Text('Hide',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black))),
//                 const DataColumn(
//                     label: Text('Disable',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black))),
//               ],
//               rows: controller.formFields.isEmpty
//                   ? const []
//                   : controller.formFields.expand((entry) {
//                       index = 0;
//                       return entry.entries.map((field) {
//                         final fieldName = field.key;
//                         index++;
//                         final attributes =
//                             field.value as Map<String, dynamic>;
//                         return DataRow(cells: [
//                           DataCell(Text(
//                               '${controller.dynamicDetails.fields1 != null ? index : controller.formFields.indexOf(entry) + 1}')),
//                           DataCell(Text(fieldName)),
//                           DataCell(Text(attributes['change_type'].toString())),
//                           DataCell(Text(attributes['change_field'].toString())),
//                           DataCell(Text(attributes['change_value'].toString())),
//                           DataCell(Checkbox(
//                             value: attributes['mandatory'] ?? false,
//                             onChanged: (bool? value) {
//                               if (value != null) {
//                                 controller.updateIsMandatory(value);
//                               }
//                             },
//                           )),
//                           DataCell(Checkbox(
//                             value: attributes['hide'] ?? false,
//                             onChanged: (bool? value) {
//                               if (value != null) {
//                                 controller.updateIsHide(value);
//                               }
//                             },
//                           )),
//                           DataCell(Checkbox(
//                             value: attributes['disable'] ?? false,
//                             onChanged: (bool? value) {
//                               if (value != null) {
//                                 controller.updateIsDisable(value);
//                               }
//                             },
//                           )),
//                         ]);
//                       }).toList();
//                     }).toList(),
//             ),
//           ),
//         ),
//       ),
//     );
//   });
// }

// At teh Starting i should get the single Row after that i should get the multiple rows keep + and delete icons at the last row
Widget buildDataTable({bool isIfCondition = true}) {
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
              dataRowColor: const WidgetStatePropertyAll(Color(0xffffffff)),
              columns: const [
                 DataColumn(label: Text('S.No', style: TextStyle(fontWeight: FontWeight.w600))),
                  DataColumn(label: Text('Field Name', style: TextStyle(fontWeight: FontWeight.w600))),
                  DataColumn(label: Text('Change Type', style: TextStyle(fontWeight: FontWeight.w600))),
                  DataColumn(label: Text('Change Field', style: TextStyle(fontWeight: FontWeight.w600))),
                  DataColumn(label: Text('Change Value', style: TextStyle(fontWeight: FontWeight.w600))),
                  DataColumn(label: Text('Mandatory', style: TextStyle(fontWeight: FontWeight.w600))),
                  DataColumn(label: Text('Hide', style: TextStyle(fontWeight: FontWeight.w600))),
                  DataColumn(label: Text('Disable', style: TextStyle(fontWeight: FontWeight.w600))),
                  // DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.w600))),
              ],
              rows: controller.formFields.isEmpty
                  ? []
                  : controller.formFields.expand((entry) {
                      int index = 0;
                      return entry.entries.map((field) {
                        final fieldName = field.key;
                        index++;
                        final attributes = field.value as Map<String, dynamic>;
                        return DataRow(cells: [
                          // S.No Column
                          DataCell(Text('${index}')),

                          // Field Name Dropdown
                          DataCell(DropdownButton<String>(
                            value: attributes['field_name'],
                            items: controller.formFields
                                .expand((map) => map.keys)
                                .map((field) => DropdownMenuItem<String>(
                                      value: field,
                                      child: Text(field),
                                    ))
                                .toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                attributes['field_name'] = newValue;
                                controller.update();
                              }
                            },
                          )),
                          DataCell(Text(attributes['change_type'].toString())),
                          DataCell(Text(attributes['change_field'].toString())),
                          DataCell(SizedBox(
                            width: 100,
                            height: 30,
                            child: TextFormField(
                              controller: isIfCondition == true ? controller.valueIfCondition : controller.valueElseCondition,
                              // initialValue: attributes['change_value'].toString(),
                              onChanged: (value) {
                                attributes['change_value'] = value;
                                controller.update();
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              ),
                            ),
                          )),
DataCell(
  DropdownButton<bool?>(dropdownColor: Theme.of(context).colorScheme.secondary,
    value: isIfCondition
        ? controller.isIfConditionMandatory.value
        : controller.isElseConditionMandatory.value,
    items: [
      const DropdownMenuItem(
        value: null,
        child: Text("None"),
      ),
      const DropdownMenuItem(
        value: true,
        child: Text("True"),
      ),
      const DropdownMenuItem(
        value: false,
        child: Text("False"),
      ),
    ],
    onChanged: (bool? newValue) {
      if (isIfCondition) {
        controller.updateIsIfConditionMandatory(newValue);
      } else {
        controller.updateIsElseConditionMandatory(newValue);
      }
    },
  ),
),
DataCell(
  DropdownButton<bool?>(dropdownColor: Theme.of(context).colorScheme.secondary,
    value: isIfCondition
        ? controller.isIfConditionHide.value
        : controller.isElseConditionHide.value,
    items: [
      const DropdownMenuItem(
        value: null,
        child: Text("None"),
      ),
      const DropdownMenuItem(
        value: true,
        child: Text("True"),
      ),
      const DropdownMenuItem(
        value: false,
        child: Text("False"),
      ),
    ],
    onChanged: (bool? newValue) {
      if (isIfCondition) {
        controller.updateIsIfConditionHide(newValue);
      } else {
        controller.updateIsElseConditionHide(newValue);
      }
    },
  ),
),
DataCell(
  DropdownButton<bool?>(dropdownColor: Theme.of(context).colorScheme.secondary,
    value: isIfCondition
        ? controller.isIfConditionDisable.value
        : controller.isElseConditionDisable.value,
    items: [
      const DropdownMenuItem(
        value: null,
        child: Text("None"),
      ),
      const DropdownMenuItem(
        value: true,
        child: Text("True"),
      ),
      const DropdownMenuItem(
        value: false,
        child: Text("False"),
      ),
    ],
    onChanged: (bool? newValue) {
      if (isIfCondition) {
        controller.updateIsIfConditionDisable(newValue);
      } else {
        controller.updateIsElseConditionDisable(newValue);
      }
    },
  ),
),
                          // DataCell(Checkbox(
                          //   value: isIfCondition == true ? controller.isIfConditionHide.value : controller.isElseConditionHide.value,
                          //   onChanged: (bool? value) {
                          //     if (value != null) {
                          //       isIfCondition == true ? controller.updateIsIfConditionHide(value) : controller.updateIsElseConditionHide(value);
                          //     }
                          //   },
                          // )),
                          // DataCell(Checkbox(
                          //   value: isIfCondition == true ? controller.isIfConditionDisable.value : controller.isIfConditionDisable.value,
                          //   onChanged: (bool? value) {
                          //     if (value != null) {
                          //       isIfCondition == true ? controller.updateIsIfConditionDisable(value) : controller.updateIsElseConditionDisable(value);
                          //     }
                          //   },
                          // )),
                          // DataCell(Row(
                          //   children: [
                          //     if (index == controller.formFields.length - 1)
                          //       IconButton(
                          //         icon: const Icon(Icons.add, color: Colors.green),
                          //         onPressed: () {
                          //           controller.addNewRow();
                          //         },
                          //       ),
                          //     if (controller.formFields.length > 1)
                          //       IconButton(
                          //         icon: const Icon(Icons.delete, color: Colors.red),
                          //         onPressed: () {
                          //           controller.removeRow(index);
                          //         },
                          //       ),
                          //   ],
                          // )),
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
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            ResponsiveRow(runSpacing: 10, spacing: 20, columns: [
              ResponsiveColumn(
                ResponsiveConstants().buttonBreakpoints,
                child: Obx(() => CommonComponents.defaultCheckBoxListTile(
                      context,
                      title: "New Record",
                      value: controller.isNewRecord.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          controller.updateIsNewRecord(value);
                        }
                      },
                    )),
              ),
              ResponsiveColumn(
                ResponsiveConstants().buttonBreakpoints,
                child: Obx(() => CommonComponents.defaultCheckBoxListTile(
                      context,
                      title: "Edit Record",
                      value: controller.isEditRecord.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          controller.updateIsEditRecord(value);
                        }
                      },
                    )),
              ),
              ResponsiveColumn(
                ResponsiveConstants().buttonBreakpoints,
                child: Obx(() => CommonComponents.defaultCheckBoxListTile(
                      context,
                      title: "On Load",
                      value: controller.isOnLoad.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          controller.updateIsOnLoad(value);
                        }
                      },
                    )),
              ),
              ResponsiveColumn(
                ResponsiveConstants().buttonBreakpoints,
                child: Obx(() => CommonComponents.defaultCheckBoxListTile(
                      context,
                      title: "On Leave",
                      value: controller.isOnLeave.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          controller.updateIsOnLeave(value);
                        }
                      },
                    )),
              ),
              ResponsiveColumn(
                ResponsiveConstants().buttonBreakpoints,
                child: Obx(() => CommonComponents.defaultCheckBoxListTile(
                      context,
                      title: "Status Change",
                      value: controller.isActive.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          controller.updateIsActive(value);
                        }
                      },
                    )),
              ),
              ResponsiveColumn(
                ResponsiveConstants().buttonBreakpoints,
                child: Obx(() => CommonComponents.defaultCheckBoxListTile(
                      context,
                      title: "No Condition",
                      value: controller.isNoCondition.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          controller.updateIsNoCondition(value);
                        }
                      },
                    )),
              ),
            ]),
          ],
        ),
      ),
      const SizedBox(height: 12.0),

      // Obx(() => Visibility(
      //         visible: controller.isNoCondition.value == false,
      //         child: Container(
      //           padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(12.0),
      //             border: Border.all(color: Colors.grey.shade300)),
      //             child: Row(
      //               children: [
      //                 Text("Condition: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      //                 const SizedBox(width: 10),
      //                 GestureDetector(
      //                   child: IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_outlined)),
      //                   onTap: () {
      //                     showDialog( barrierDismissible: false, context: context, builder: (BuildContext
      //                                                         context) {
      //                                                           return GetBuilder<DynamicController>(
      //                                                         builder: (_) {
      //                                                           return AlertDialog(
      //                                                             actionsAlignment: MainAxisAlignment.center,
      //                                                             title: Row(
      //                                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                                               children: [
      //                                                                 Text("Advance Filters",
      //                                                                   style: TextStyle(fontSize:18,fontWeight:FontWeight.w600,color: Colors.grey[800],
      //                                                                   ),
      //                                                                 ),
      //                                                                 IconButton(
      //                                                                   icon: const Icon(Icons.close),
      //                                                                   onPressed: () {
      //                                                                     advanceFilterController.clearFilters();
      //                                                                     Navigator.of(context).pop();
      //                                                                   },
      //                                                                 ),
      //                                                               ],
      //                                                             ),
      //                                                             content: SizedBox(
      //                                                               width: MediaQuery.of(context).size.width * 0.8,
      //                                                               height: MediaQuery.of(context).size.height * 0.8,
      //                                                               child: AdvancedFiltersScreen(),
      //                                                             ),
      //                                                           );
      //                                                         },
      //                                                       );
      //                                                     },
      //                                                   );
      //                   },
      //                 ),
      //               ],
      //             ),
      //             ))),
      // const SizedBox(height: 12.0),

      DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: const [
                Tab(text: "If Condition"),
                Tab(text: "Else Condition"),
              ],
              indicatorColor: Colors.blue,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 300, // Adjust height as needed
              child: TabBarView(
                children: [
                  buildDataTable(isIfCondition: true),
                  buildDataTable(isIfCondition: false),
                ],
              ),
            ),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          width: 100,
          color: Theme.of(context).colorScheme.secondary,
          child: MaterialButton(
            elevation: 2,
            onPressed: () {
              print("Printing the addRuleList ==>>>  ${controller.addRuleList}");
              print("Printing the addRule =====>>>  ${jsonEncode(controller.addRule)}");
              controller.addRule();
            },
            height: 50,
            minWidth: 100,
            color: Theme.of(context).colorScheme.primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Center(
              child: Text(
                "Save",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
    }