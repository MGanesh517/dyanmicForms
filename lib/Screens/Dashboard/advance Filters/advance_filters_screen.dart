// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/BreakPoints/breakpoints.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
import 'package:implementation_panel/Screens/Dashboard/advance%20Filters/advance_filter_controller.dart';
import 'package:implementation_panel/Screens/Dashboard/advance%20Filters/filters_common_cards.dart';
import 'package:implementation_panel/Screens/Dashboard/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class AdvancedFiltersScreen extends StatelessWidget {
  final FilterNode? node;
  final controller = Get.put(AdvancedFilterController());

  AdvancedFiltersScreen({super.key, this.node});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Container(
        color: Colors.grey[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Expanded(
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(width: 0.5, color: Colors.grey),
                  ),
                  // child: Obx(() => ListView(
                  //       children: controller.filters
                  //           .map((node) => FilterNodeWidget(
                  //                 node: node,
                  //                 parent: null,
                  //                 controller: controller,
                  //               ))
                  //           .toList(),
                  //     )),
                  child: FilterNodeWidget(
                                  node: controller.filters,
                                  parent: null,
                                  controller: controller,
                                ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  CommonButton(
                    onPressed: () => controller.addFilterNode(node),
                    icon: Icons.add,
                    text: 'Add Condition',
                  ),
                  SizedBox(width: 12),
                  CommonButton(
                    onPressed: () {
                      // final query =
                      //     controller.generateQuery(controller.filters);
                      print(jsonEncode(controller.filters));
                    },
                    icon: Icons.check,
                    text: 'Submit',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // void printQuery() {
  //   final controller = Get.find<AdvancedFilterController>();
  //   final query = generateQuery(controller.filters);
  //   debugPrint(jsonEncode(query));
  // }
}

class FilterNodeWidget extends StatelessWidget {
  final FilterNode node;
  final FilterNode? parent;
  final AdvancedFilterController controller;
  final int depth;

  const FilterNodeWidget({
    super.key,
    required this.node,
    required this.parent,
    required this.controller,
    this.depth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                if (parent != null)
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 20,
                    child: Container(
                      width: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (parent != null)
                      Container(
                        margin: EdgeInsets.only(top: 27.0),
                        // alignment: Alignment.center,
                        width: 30,
                        height: 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildOperatorRow(context),
                          if (node.isExpanded.value) ...[
                            const SizedBox(height: 8),
                            buildConditions(context),
                            // if (controller.isLogicalOperator(node.operator.value)) ...[
                              const SizedBox(height: 8),
                          
                              buildAddButtons(context),
                            // ],
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                // if (parent != null)
                //   Positioned(
                //     bottom: 0,
                //     left: 0,
                //     child: Container(
                //       width: 30,
                //       height: 2,
                //       color: Theme.of(context).colorScheme.primary,
                //     ),
                //   ),
              ],
            ),
          ],
        ));
  }

  Widget buildOperatorRow(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // DropdownButton<String>(
                //   dropdownColor: Theme.of(context).colorScheme.secondary,
                //   value: node.operator.value,
                //   underline: const SizedBox(),
                //   items: controller.operatorTypes
                //       .map((op) => DropdownMenuItem(
                //             value: op,
                //             child: Text(op),
                //           ))
                //       .toList(),
                //   onChanged: (val) => node.operator.value = val!,
                // ),
                Container(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: DropdownButton<String>(
                      dropdownColor: Theme.of(context).colorScheme.secondary,
                      value: node.operator.value,
                      underline: const SizedBox(),
                      items: controller.operatorTypes
                          .map((op) => DropdownMenuItem(
                                value: op,
                                child: Text(
                                  op,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                              ))
                          .toList(),
                      onChanged: (val) => node.operator.value = val!,
                      iconSize: 20,
                      // isExpanded: true,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (controller.isLogicalOperator(node.operator.value))
            IconButton(
              icon: Icon(
                node.isExpanded.value ? Icons.expand_less : Icons.expand_more,
                size: 20,
              ),
              onPressed: () => node.isExpanded.toggle(),
            ),
          IconButton(
            icon: const Icon(Icons.delete_outline, size: 20),
            onPressed: () => controller.removeFilterNode(node, parent),
            color: Colors.red[400],
          ),
        ],
      ),
    );
  }

  Widget buildConditions(BuildContext context) {
    if (controller.isLogicalOperator(node.operator.value)) {
      return Column(
        children: [
          ...node.children.map((child) => Padding(
                padding: const EdgeInsets.only(left: 24),
                child: FilterNodeWidget(
                  node: child,
                  parent: node,
                  controller: controller,
                  depth: depth + 1,
                ),
              )),
        ],
      );
    } else {
      return buildConditionFields(context);
    }
  }

  Widget buildConditionFields(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ResponsiveRow(
        alignment: ResponsiveAlignment.center,
        crossAxisAlignment: ResponsiveCrossAlignment.center,
        columns: [
          ResponsiveColumn(
            ResponsiveConstants().buttonBreakpoints,
            child: CommonComponents.defaultTextFormField(
              context,
              hintText: 'Enter Key',
              onChange: (val) => node.key.value = val,
            ),
          ),
          ResponsiveColumn(
            ResponsiveConstants().smallBreakpoints,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                controller.getOperatorSymbol(node.operator.value),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          ResponsiveColumn(
            ResponsiveConstants().buttonBreakpoints,
            child: CommonComponents.defaultTextFormField(
              context,
              hintText: 'Enter Value',
              onChange: (val) => node.value.value = val,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: Colors.grey.shade300)),
        child: TextButton.icon(
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Add Field', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
          onPressed: () => controller.addFilterNode(node),
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}




// // // class AdvancedFilterController extends GetxController {
// // //   var filters = <FilterNode>[].obs;

// // //   List<String> get operatorTypes => [
// // //         'AND',
// // //         'OR',
// // //         'NAG',
// // //         'EQ (=)',
// // //         'NEQ (!=)',
// // //         'GT (>)',
// // //         'GTE (>=)',
// // //         'LT (<)',
// // //         'LTE (<=)',
// // //         'CONTAINS'
// // //       ];

// // //   void addFilterNode(FilterNode? parent) {
// // //     final newNode = FilterNode();
// // //     if (parent == null) {
// // //       filters.add(newNode);
// // //     } else {
// // //       parent.children.add(newNode);
// // //     }
// // //   }

// // //   void removeFilterNode(FilterNode node, FilterNode? parent) {
// // //     if (parent == null) {
// // //       filters.remove(node);
// // //     } else {
// // //       parent.children.remove(node);
// // //     }
// // //   }
// // // }

// // // class FilterNode {
// // //   RxString operator = 'AND'.obs;
// // //   RxString operator2 = 'OR'.obs;
// // //   RxString conditionField = ''.obs;
// // //   RxString conditionValue = ''.obs;
// // //   RxList<FilterNode> children = <FilterNode>[].obs;
// // // }

// // // class AdvancedFiltersScreen extends StatelessWidget {
// // //   final controller = Get.put(AdvancedFilterController());

// // //   AdvancedFiltersScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return CommonScaffoldWithAppBar(
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text(
// // //               "Advanced Filters",
// // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
// // //             ),
// // //             const SizedBox(height: 12.0),
// // //             Expanded(
// // //               child: Container(
// // //                 width: Get.width,
// // //                   padding: const EdgeInsets.all(16.0),
// // //                   decoration: BoxDecoration(
// // //                     color: Colors.white,
// // //                     borderRadius: BorderRadius.circular(14.0),
// // //                     border: Border.all(width: 0.5, color: Colors.grey),
// // //                   ),
// // //                 child: Obx(() => ListView(
// // //                       children: controller.filters
// // //                           .map((node) => FilterNodeWidget(
// // //                                 node: node,
// // //                                 parent: null,
// // //                                 controller: controller,
// // //                               ))
// // //                           .toList(),
// // //                     )),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 20),
// // //             // Container(
// // //             //     width: 150,
// // //             //     color: Theme.of(context).colorScheme.secondary,
// // //             //     child: MaterialButton(
// // //             //       elevation: 2,
// // //             //       onPressed: () => controller.addFilterNode(null),
// // //             //       height: 50,
// // //             //       minWidth: 100,
// // //             //       color: Theme.of(context).colorScheme.primary,
// // //             //       shape: const RoundedRectangleBorder(
// // //             //         borderRadius: BorderRadius.all(Radius.circular(6)),
// // //             //       ),
// // //             //       child: Center(
// // //             //         child: Row(
// // //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //             //           children: [
// // //             //             Icon(Icons.add,
// // //             //                 color: Theme.of(context).colorScheme.secondary),
// // //             //             Text(
// // //             //               "Add Condition",
// // //             //               style: TextStyle(
// // //             //                 color: Theme.of(context).colorScheme.secondary,
// // //             //                 fontSize: 15,
// // //             //                 fontWeight: FontWeight.w600,
// // //             //               ),
// // //             //             ),
// // //             //           ],
// // //             //         ),
// // //             //       ),
// // //             //     )),
// // //             CommonButton(
// // //               onPressed: () => controller.addFilterNode(null),
// // //               text: "Add Condition",
// // //               icon: Icons.add,
// // //             )
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class FilterNodeWidget extends StatelessWidget {
// // //   final FilterNode node;
// // //   final FilterNode? parent;
// // //   final AdvancedFilterController controller;
// // //   final int depth;
// // //   const FilterNodeWidget({
// // //     super.key,
// // //     required this.node,
// // //     required this.parent,
// // //     required this.controller,
// // //     this.depth = 0,
// // //   });
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Padding(
// // //       padding: EdgeInsets.only(left: depth * 16.0),
// // //       child: Obx(() => Column(
// // //             children: [
// // //               Stack(
// // //                 children: [
// // //                   if (parent != null)
// // //                     Positioned(
// // //                       left: 0,
// // //                       top: 0,
// // //                       bottom: 0,
// // //                       child: Container(
// // //                         width: 2,
// // //                         color: Theme.of(context).colorScheme.primary,
// // //                       ),
// // //                     ),
// // //                   Row(
// // //                     children: [
// // //                       if (parent != null)
// // //                         Container(
// // //                           width: 30,
// // //                           height: 2,
// // //                           color: Theme.of(context).colorScheme.primary,
// // //                         ),
// // //                       // Flexible(
// // //                       //   child: Checkbox(value: false, onChanged: (bool? val) {}),
// // //                       // ),
// // //                       Flexible(
// // //                         child: Container(
// // //                           margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
// // //                           decoration: BoxDecoration(
// // //                             border: Border.all(color: Colors.grey.shade300),
// // //                             borderRadius: BorderRadius.circular(10.0),
// // //                           ),
// // //                           child: DropdownButton<String>(
// // //                             focusColor: Theme.of(context).colorScheme.secondary,
// // //                             underline: Container(
// // //                                 color: Theme.of(context).colorScheme.secondary),
// // //                             isExpanded: true,
// // //                             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0.0),
// // //                             menuMaxHeight: 350,
// // //                             borderRadius: BorderRadius.circular(10.0),
// // //                             dropdownColor: Theme.of(context).colorScheme.secondary,
// // //                             value: node.operator.value,
// // //                             items: controller.operatorTypes
// // //                                 .map((op) {
// // //                               return DropdownMenuItem(value: op, child: Text(op));
// // //                             }).toList(),
// // //                             onChanged: (val) => node.operator.value = val ?? 'AND',
// // //                           ),
// // //                         ),
// // //                         // child: FilterCommonDropdown(
// // //                         //   typeValue: node.operator.value,
// // //                         //   typeOnChanged: (val) => node.operator.value = val ?? 'AND',
// // //                         //   typeItems: controller.operatorTypes
// // //                         //         .map((op) {
// // //                         //       return DropdownMenuItem(value: op, child: Text(op));
// // //                         //     }).toList(),
// // //                         // ),
// // //                       ),
// // //                       const SizedBox(width: 20),
// // //                       Flexible(
// // //                         flex: 1,
// // //                         child: CommonComponents.defaultTextFormField(
// // //                           context,
// // //                           hintText: 'Enter Key',
// // //                           onChange: (val) => node.conditionValue.value = val,
// // //                         ),
// // //                       ),
// // //                       // Flexible(
// // //                       //   flex: 1,
// // //                       //   child: MultiLevelDropdown(),
// // //                       // ),
// // //                       // Flexible(
// // //                       //   child: Container(
// // //                       //     margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
// // //                       //     decoration: BoxDecoration(
// // //                       //       border: Border.all(color: Colors.grey.shade300),
// // //                       //       borderRadius: BorderRadius.circular(10.0),
// // //                       //     ),
// // //                       //     child: DropdownButton<String>(
// // //                       //       focusColor: Theme.of(context).colorScheme.secondary,
// // //                       //       underline: Container(
// // //                       //           color: Theme.of(context).colorScheme.secondary),
// // //                       //       isExpanded: true,
// // //                       //       padding: const EdgeInsets.symmetric(horizontal: 5),
// // //                       //       menuMaxHeight: 350,
// // //                       //       borderRadius: BorderRadius.circular(10.0),
// // //                       //       dropdownColor: Theme.of(context).colorScheme.secondary,
// // //                       //       value: node.operator2.value,
// // //                       //       items: controller.operatorTypes
// // //                       //           .map((op) {
// // //                       //         return DropdownMenuItem(value: op, child: Text(op));
// // //                       //       }).toList(),
// // //                       //       onChanged: (val) => node.operator2.value = val ?? 'AND',
// // //                       //     ),
// // //                       //   )
// // //                       // //   child: FilterCommonDropdown(
// // //                       // //     typeValue: node.operator2.value,
// // //                       // //     typeOnChanged: (val) => node.operator2.value = val ?? 'AND',
// // //                       // //     typeItems: controller.operatorTypes
// // //                       // //           .map((op) {
// // //                       // //         return DropdownMenuItem(value: op, child: Text(op));
// // //                       // //       }).toList(),
// // //                       // //   ),
// // //                       // ),
// // //                       const SizedBox(width: 10),
// // //                       Flexible(
// // //                         flex: 1,
// // //                         child: CommonComponents.defaultTextFormField(
// // //                           context,
// // //                           hintText: 'Enter Value',
// // //                           onChange: (val) => node.conditionValue.value = val,
// // //                         ),
// // //                       ),
// // //                       Spacer(),
// // //                       IconButton(
// // //                         icon: Icon(Icons.delete, color: Colors.red),
// // //                         onPressed: () => controller.removeFilterNode(node, parent),
// // //                       ),
// // //                       IconButton(
// // //                         icon: Icon(Icons.add, color: Colors.green),
// // //                         onPressed: () => controller.addFilterNode(node),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //               if (node.children.isNotEmpty)
// // //                 Padding(
// // //                   padding: const EdgeInsets.only(left: 20.0),
// // //                   child: Column(
// // //                     children: node.children
// // //                         .map((child) => FilterNodeWidget(
// // //                               node: child,
// // //                               parent: node,
// // //                               controller: controller,
// // //                               depth: depth + 1,
// // //                             ))
// // //                         .toList(),
// // //                   ),
// // //                 ),
// // //             ],
// // //           )),
// // //     );
// // //   }
// // // }

// // // Condition Object(Json)
// // // Condition Array for (OR, AND)
// // // Condition Object(Key , Value)

// // // class MultiLevelDropdown extends StatefulWidget {
// // //   const MultiLevelDropdown({super.key});
// // //   @override
// // //   _MultiLevelDropdownState createState() => _MultiLevelDropdownState();
// // // }
// // // class _MultiLevelDropdownState extends State<MultiLevelDropdown> {
// // //   String? selectedValue;
// // //   // final DropdownController dropdownController = Get.put(DropdownController());
// // //   final Map<String, Map<String, List<String>>> dropdownData = {
// // //     "California": {
// // //       "Los Angeles": ["Beverly Hills", "Hollywood", "Santa Monica"],
// // //       "San Francisco": ["Mission District", "Fisherman's Wharf", "Chinatown"]
// // //     },
// // //     "Texas": {
// // //       "Houston": ["Downtown", "Midtown", "Uptown"],
// // //       "Dallas": ["Deep Ellum", "Bishop Arts District", "Oak Lawn"]
// // //     },
// // //     "New York": {
// // //       "New York City": ["Brooklyn", "Manhattan", "Queens"],
// // //       "Buffalo": ["Allentown", "Elmwood Village", "North Buffalo"]
// // //     },
// // //     "Florida": {
// // //       "Miami": ["Little Havana", "Wynwood", "Coconut Grove"],
// // //       "Orlando": ["Lake Nona", "Winter Park", "Downtown Orlando"]
// // //     }
// // //   };
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return PopupMenuButton<String>(
// // //       constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
// // //       color: Theme.of(context).colorScheme.secondary,
// // //       offset: Offset(00, 48),
// // //       onSelected: (value) {
// // //         setState(() {
// // //           selectedValue = value;
// // //         });
// // //       },
// // //       itemBuilder: (context) => dropdownData.entries.map((province) {
// // //         return PopupMenuItem<String>(
// // //           child: SizedBox(
// // //             // width: 100,
// // //             child: SubMenu(
// // //               title: province.key,
// // //               subItems: province.value,
// // //               onSelected: (value) {
// // //                 setState(() {
// // //                   selectedValue = value;
// // //                 });
// // //               },
// // //             ),
// // //           ),
// // //         );
// // //       }).toList(),
// // //       child: Container(
// // //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // //         decoration: BoxDecoration(
// // //           border: Border.all(color: Colors.grey),
// // //           borderRadius: BorderRadius.circular(8),
// // //         ),
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //           mainAxisSize: MainAxisSize.min,
// // //           children: [
// // //             Flexible(
// // //               child: Text(selectedValue ?? "Please select",
// // //                   overflow: TextOverflow.ellipsis),
// // //             ),
// // //             const Icon(Icons.arrow_drop_down),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // // class SubMenu extends StatelessWidget {
// // //   final String title;
// // //   final Map<String, List<String>> subItems;
// // //   final ValueChanged<String> onSelected;
// // //   const SubMenu({
// // //     super.key,
// // //     required this.title,
// // //     required this.subItems,
// // //     required this.onSelected,
// // //   });
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return PopupMenuButton<String>(
// // //       constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
// // //       offset: Offset(100, 0),
// // //       color: Theme.of(context).colorScheme.secondary,
// // //       onSelected: onSelected,
// // //       itemBuilder: (context) => subItems.entries.expand((city) {
// // //         return [
// // //           PopupMenuItem<String>(
// // //             child: SizedBox(
// // //               width: 100,
// // //               child: PopupMenuButton<String>(
// // //                 constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
// // //                 color: Theme.of(context).colorScheme.secondary,
// // //                 offset: Offset(100, 0),
// // //                 onSelected: (area) {
// // //                   onSelected("$area");
// // //                   debugPrint("printing the data ::::: =====>    $area");
// // //                   debugPrint(
// // //                       "printing the data ::::: =====>    $title / ${city.key} / $area");
// // //                 },
// // //                 itemBuilder: (context) => city.value
// // //                     .map((area) => PopupMenuItem<String>(
// // //                           value: "$title/${city.key}/$area",
// // //                           child: SizedBox(
// // //                             width: 100,
// // //                             child: Text(area, overflow: TextOverflow.ellipsis),
// // //                           ),
// // //                         ))
// // //                     .toList(),
// // //                 child: Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Flexible(
// // //                         child: Text(city.key, overflow: TextOverflow.ellipsis)),
// // //                     const Icon(Icons.arrow_right),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ];
// // //       }).toList(),
// // //       child: Row(
// // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //         children: [
// // //           Flexible(child: Text(title, overflow: TextOverflow.ellipsis)),
// // //           const Icon(Icons.arrow_right),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // AND, OR - Condition Array
// // // NAG - Condition JSON
// // // Others -  Key-Value JSON

// // // Condition Object(Json)
// // // Condition Array for (OR, AND)
// // // Condition Object(Key , Value)

// class AdvancedFiltersScreen extends StatelessWidget {
//   final FilterNode? node;
//   final controller = Get.put(AdvancedFilterController());

//   AdvancedFiltersScreen({super.key, this.node});

//   @override
//   Widget build(BuildContext context) {
//     return CommonScaffoldWithAppBar(
//       body: Container(
//         color: Colors.grey[50],
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Condition",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey[800],
//                     ),
//                   ),
//                   // IconButton(
//                   //   icon: Icon(Icons.more_horiz),
//                   //   onPressed: () {},
//                   // ),
//                 ],
//               ),
//               const SizedBox(height: 12.0),
//               Expanded(
//                 child: Container(
//                   width: Get.width,
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(14.0),
//                     border: Border.all(width: 0.5, color: Colors.grey),
//                   ),
//                   child: Obx(() => ListView(
//                         children: controller.filters
//                             .map((node) => FilterNodeWidget(
//                                   node: node,
//                                   parent: null,
//                                   controller: controller,
//                                 ))
//                             .toList(),
//                       )),
//                 ),
//               ),
//               Row(
//                 children: [
//                   TextButton.icon(
//                     icon: Icon(Icons.add, size: 20),
//                     label: Text('Add condition'),
//                     onPressed: () => controller.addFilterNode(node),
//                     style: TextButton.styleFrom(
//                       foregroundColor: Colors.grey[700],
//                     ),
//                   ),
//                   // const SizedBox(width: 16),
//                   // TextButton.icon(
//                   //   icon: Icon(Icons.add, size: 20),
//                   //   label: Text('Add group'),
//                   //   onPressed: () => controller.addFilterNode(node),
//                   //   style: TextButton.styleFrom(
//                   //     foregroundColor: Colors.grey[700],
//                   //   ),
//                   // ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class FilterNodeWidget extends StatelessWidget {
// //   final FilterNode node;
// //   final FilterNode? parent;
// //   final AdvancedFilterController controller;
// //   final int depth;

// //   const FilterNodeWidget({
// //     super.key,
// //     required this.node,
// //     required this.parent,
// //     required this.controller,
// //     this.depth = 0,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Obx(() => Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [

// //         Stack(
// //           children: [
// //             if (parent != null)
// //                     Positioned(
// //                       left: 0,
// //                       top: 0,
// //                       bottom: 0,
// //                       child: Container(
// //                         width: 2,
// //                         color: Theme.of(context).colorScheme.primary,
// //                       ),
// //                     ),
// //             Row(
// //               children: [
// //                 // SizedBox(width: depth * 24.0),
// //                 // if (parent != null) _buildConnector(),
// //                 if (parent != null)
// //                         Container(
// //                           width: 30,
// //                           height: 2,
// //                           color: Theme.of(context).colorScheme.primary,
// //                         ),
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       _buildOperatorRow(context),
// //                       if (node.isExpanded.value) ...[
// //                         const SizedBox(height: 8),
// //                         _buildConditions(context),
// //                         const SizedBox(height: 8),
// //                         _buildAddButtons(context),
// //                       ],
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ],
// //     ));
// //   }

// //   Widget _buildOperatorRow(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(vertical: 8),
// //       child: Row(
// //         children: [
// //           Container(
// //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0.0),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               border: Border.all(color: Colors.grey[300]!),
// //               borderRadius: BorderRadius.circular(4),
// //             ),
// //             child: Row(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 DropdownButton<String>(
// //                   value: node.operator.value,
// //                   underline: SizedBox(),
// //                   items: controller.operatorTypes
// //                       .map((op) => DropdownMenuItem(
// //                             value: op,
// //                             child: Text(op),
// //                           ))
// //                       .toList(),
// //                   onChanged: (val) => node.operator.value = val!,
// //                 ),
// //                 // Icon(Icons.arrow_drop_down, size: 20),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(width: 8),
// //           IconButton(
// //             icon: Icon(
// //               node.isExpanded.value
// //                   ? Icons.expand_less
// //                   : Icons.expand_more,
// //               size: 20,
// //             ),
// //             onPressed: () => node.isExpanded.toggle(),
// //           ),
// //           IconButton(
// //             icon: Icon(Icons.more_horiz, size: 20),
// //             onPressed: () {},
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildConditions(BuildContext context) {
// //     return Column(
// //       children: [
// //         ...node.children.map((child) => Padding(
// //           padding: const EdgeInsets.only(left: 24),
// //           child: FilterNodeWidget(
// //             node: child,
// //             parent: node,
// //             controller: controller,
// //             depth: depth + 1,
// //           ),
// //         )),
// //         if (node.children.isEmpty)
// //           _buildConditionRow(context),
// //       ],
// //     );
// //   }

// //   Widget _buildConditionRow(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 4),
// //       child: ResponsiveRow(columns: [
// //         // ignore: duplicate_ignore
// //         // ignore: unrelated_type_equality_checks
// //         if (controller.operatorTypes != 'AND' || controller.operatorTypes != 'OR')
// //             ResponsiveColumn(ResponsiveConstants().buttonBreakpoints, child: CommonComponents.defaultTextFormField(
// //                           context,
// //                           hintText: 'Enter Key',
// //                           onChange: (val) => node.value.value = val,
// //                         )),
// //                          if (controller.operatorTypes != 'AND' || controller.operatorTypes != 'OR')
// //             ResponsiveColumn(ResponsiveConstants().smallBreakpoints, child: CommonComponents.defaultTextFormField(
// //                           context,
// //                           hintText: 'Selected Operator Condition',
// //                           readOnly: true,
// //                           onChange: (val) => node.value2.value = val,
// //                         )),
// //                          if (controller.operatorTypes != 'AND' || controller.operatorTypes != 'OR')
// //             ResponsiveColumn(ResponsiveConstants().buttonBreakpoints, child: CommonComponents.defaultTextFormField(
// //                           context,
// //                           hintText: 'Enter Value',
// //                           onChange: (val) => node.value2.value = val,
// //                         ))
// //           ]),
// //       // child: Row(
// //       //   children: [
// //       //     // Checkbox(
// //       //     //   value: node.isChecked.value,
// //       //     //   onChanged: (val) => node.isChecked.value = val!,
// //       //     // ),
// //       //     // Expanded(
// //       //     //   child: _buildDropdown(
// //       //     //     'Choose a value',
// //       //     //     node.field.value,
// //       //     //     (val) => node.field.value = val!,
// //       //     //   ),
// //       //     // ),
// //       //     // Flexible(
// //       //     //   flex: 1,
// //       //     //   child: CommonComponents.defaultTextFormField(
// //       //     //                 context,
// //       //     //                 hintText: 'Enter Value',
// //       //     //                 onChange: (val) => node.value.value = val,
// //       //     //               )),
// //       //     // const SizedBox(width: 8),
// //       //     // Expanded(
// //       //     //   child: _buildDropdown(
// //       //     //     'is equal to',
// //       //     //     node.operator2.value,
// //       //     //     (val) => node.operator2.value = val!,
// //       //     //     ['is equal to', 'is not equal to', 'contains', 'does not contain'],
// //       //     //   ),
// //       //     // ),
// //       //     // const SizedBox(width: 8),
// //       //     // Flexible(
// //       //     //   flex: 1,
// //       //     //   child: CommonComponents.defaultTextFormField(
// //       //     //                 context,
// //       //     //                 hintText: 'Enter Value',
// //       //     //                 onChange: (val) => node.value2.value = val,
// //       //     //               )
// //       //     // ),
// //       //     // IconButton(
// //       //     //   icon: Icon(Icons.more_horiz, size: 20),
// //       //     //   onPressed: () {},
// //       //     // ),
// //       //   ],
// //       // ),
// //     );
// //   }

// //   Widget _buildAddButtons(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.only(left: 24),
// //       child: Row(
// //         children: [
// //           TextButton.icon(
// //             icon: Icon(Icons.add, size: 20),
// //             label: Text('Add condition'),
// //             onPressed: () => controller.addFilterNode(node),
// //             style: TextButton.styleFrom(
// //               foregroundColor: Colors.grey[700],
// //             ),
// //           ),
// //           // const SizedBox(width: 16),
// //           // TextButton.icon(
// //           //   icon: Icon(Icons.add, size: 20),
// //           //   label: Text('Add group'),
// //           //   onPressed: () => controller.addFilterNode(node),
// //           //   style: TextButton.styleFrom(
// //           //     foregroundColor: Colors.grey[700],
// //           //   ),
// //           // ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// //   // Widget _buildDropdown(
// //   //   String hint,
// //   //   String value,
// //   //   Function(String?) onChanged, [
// //   //   List<String>? items,
// //   // ]) {
// //   //   return Container(
// //   //     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
// //   //     decoration: BoxDecoration(
// //   //       border: Border.all(color: Colors.grey[300]!),
// //   //       borderRadius: BorderRadius.circular(4),
// //   //     ),
// //   //     child: DropdownButton<String>(
// //   //       value: value.isEmpty ? null : value,
// //   //       hint: Text(hint),
// //   //       isExpanded: true,
// //   //       underline: SizedBox(),
// //   //       items: (items ?? ['Choose a value'])
// //   //           .map((item) => DropdownMenuItem(
// //   //                 value: item,
// //   //                 child: Text(item),
// //   //               ))
// //   //           .toList(),
// //   //       onChanged: onChanged,
// //   //     ),
// //   //   );
// //   // }

// // // // class MultiLevelDropdown extends StatefulWidget {
// // // //   const MultiLevelDropdown({super.key});
// // // //   @override
// // // //   _MultiLevelDropdownState createState() => _MultiLevelDropdownState();
// // // // }
// // // // class _MultiLevelDropdownState extends State<MultiLevelDropdown> {
// // // //   String? selectedValue;
// // // //   final DropdownController dropdownController = Get.put(DropdownController());
// // // //   final Map<String, dynamic> dropdownData = {
// // // //     "AND": ["Condition1", "Condition2"],
// // // //     "OR": ["Condition3", "Condition4"],
// // // //     "NAG": {
// // // //       "EQ": ["Value1", "Value2"],
// // // //       "NEQ": ["Value3", "Value4"]
// // // //     }
// // // //   };
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return PopupMenuButton<String>(
// // // //       constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
// // // //       color: Theme.of(context).colorScheme.secondary,
// // // //       offset: Offset(00, 48),
// // // //       onSelected: (value) {
// // // //         setState(() {
// // // //           selectedValue = value;
// // // //         });
// // // //       },
// // // //       itemBuilder: (context) => dropdownData.entries.map((entry) {
// // // //         return PopupMenuItem<String>(
// // // //           child: SizedBox(
// // // //             child: SubMenu(
// // // //               title: entry.key,
// // // //               subItems: entry.value,
// // // //               onSelected: (value) {
// // // //                 setState(() {
// // // //                   selectedValue = value;
// // // //                 });
// // // //               },
// // // //             ),
// // // //           ),
// // // //         );
// // // //       }).toList(),
// // // //       child: Container(
// // // //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // // //         decoration: BoxDecoration(
// // // //           border: Border.all(color: Colors.grey),
// // // //           borderRadius: BorderRadius.circular(8),
// // // //         ),
// // // //         child: Row(
// // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //           mainAxisSize: MainAxisSize.min,
// // // //           children: [
// // // //             Flexible(
// // // //               child: Text(selectedValue ?? "Please select",
// // // //                   overflow: TextOverflow.ellipsis),
// // // //             ),
// // // //             const Icon(Icons.arrow_drop_down),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // // class SubMenu extends StatelessWidget {
// // // //   final String title;
// // // //   final dynamic subItems;
// // // //   final ValueChanged<String> onSelected;
// // // //   const SubMenu({
// // // //     super.key,
// // // //     required this.title,
// // // //     required this.subItems,
// // // //     required this.onSelected,
// // // //   });
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return PopupMenuButton<String>(
// // // //       constraints: BoxConstraints(minWidth: 110, maxWidth: 110),
// // // //       offset: Offset(100, 0),
// // // //       color: Theme.of(context).colorScheme.secondary,
// // // //       onSelected: onSelected,
// // // //       itemBuilder: (context) {
// // // //         if (subItems is List) {
// // // //           return subItems
// // // //               .map((item) => PopupMenuItem<String>(
// // // //                     value: "$title/$item",
// // // //                     child: Text(item, overflow: TextOverflow.ellipsis),
// // // //                   ))
// // // //               .toList();
// // // //         } else if (subItems is Map) {
// // // //           return subItems.entries.expand((entry) {
// // // //             return [
// // // //               PopupMenuItem<String>(
// // // //                 child: SizedBox(
// // // //                   child: SubMenu(
// // // //                     title: entry.key,
// // // //                     subItems: entry.value,
// // // //                     onSelected: onSelected,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ];
// // // //           }).toList();
// // // //         }
// // // //         return [];
// // // //       },
// // // //       child: Row(
// // // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //         children: [
// // // //           Flexible(child: Text(title, overflow: TextOverflow.ellipsis)),
// // // //           const Icon(Icons.arrow_right, color: Colors.blue),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// class AdvancedFilterController extends GetxController {
//   var filters = <FilterNode>[].obs;
//   final operatorTypes = [
//     'AND',
//     'OR',
//     'NAG',
//     'EQ (=)',
//     'NEQ (!=)',
//     'GT (>)',
//     'GTE (>=)',
//     'LT (<)',
//     'LTE (<=)',
//     'CONTAINS'
//   ];

//   void addFilterNode(FilterNode? parent) {
//     final newNode = FilterNode();
//     if (parent == null) {
//       filters.add(newNode);
//     } else {
//       parent.children.add(newNode);
//     }
//   }

//   void removeFilterNode(FilterNode node, FilterNode? parent) {
//     if (parent == null) {
//       filters.remove(node);
//     } else {
//       parent.children.remove(node);
//     }
//   }
// }

// class FilterNode {
//   RxString operator = 'AND'.obs;
//   RxString field = ''.obs;
//   RxString operator2 = 'is equal to'.obs;
//   RxString value = ''.obs;
//   RxString value2 = ''.obs;
//   RxBool isExpanded = true.obs;
//   RxList<FilterNode> children = <FilterNode>[].obs;
// }

// class FilterNodeWidget extends StatelessWidget {
//   final FilterNode node;
//   final FilterNode? parent;
//   final AdvancedFilterController controller;
//   final int depth;

//   const FilterNodeWidget({
//     super.key,
//     required this.node,
//     required this.parent,
//     required this.controller,
//     this.depth = 0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 if (parent != null)
//                   Positioned(
//                     left: 0,
//                     top: 0,
//                     bottom: 0,
//                     child: Container(
//                       width: 2,
//                       color: Theme.of(context).colorScheme.primary,
//                     ),
//                   ),
//                 Row(
//                   children: [
//                     if (parent != null)
//                       Container(
//                         width: 30,
//                         height: 2,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           if (controller.operatorTypes != 'AND' ||
//                               controller.operatorTypes != 'OR')
//                             _buildOperatorRow(context),
//                           if (node.isExpanded.value) ...[
//                             const SizedBox(height: 8),
//                             _buildConditions(context),
//                             const SizedBox(height: 8),
//                             _buildAddButtons(context),
//                           ],
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ));
//   }

//   Widget _buildOperatorRow(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: Colors.grey[300]!),
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 DropdownButton<String>(
//                   value: node.operator.value,
//                   underline: const SizedBox(),
//                   items: controller.operatorTypes
//                       .map((op) => DropdownMenuItem(
//                             value: op,
//                             child: Text(op),
//                           ))
//                       .toList(),
//                   onChanged: (val) => node.operator.value = val!,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 8),
//           // IconButton(
//           //   icon: Icon(
//           //     node.isExpanded.value ? Icons.expand_less : Icons.expand_more,
//           //     size: 20,
//           //   ),
//           //   onPressed: () => node.isExpanded.toggle(),
//           // ),
//           // IconButton(
//           //   icon: const Icon(Icons.more_horiz, size: 20),
//           //   onPressed: () {},
//           // ),
//           IconButton(
//             icon: const Icon(Icons.delete_outline, size: 20),
//             onPressed: () => controller.removeFilterNode(node, parent),
//             color: Colors.red[400],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildConditions(BuildContext context) {
//     return Obx(() => Column(
//           children: [
//             ...node.children.map((child) => Padding(
//                   padding: const EdgeInsets.only(left: 24),
//                   child: FilterNodeWidget(
//                     node: child,
//                     parent: node,
//                     controller: controller,
//                     depth: depth + 1,
//                   ),
//                 )),
//             if (node.children.isEmpty) _buildConditionRow(context),
//           ],
//         ));
//   }

//   Widget _buildConditionRow(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
      
//       child: ResponsiveRow(
//         columns: [
//           // if (controller.operatorTypes != 'AND' ||
//           //     controller.operatorTypes != 'OR')
//             ResponsiveColumn(
//               ResponsiveConstants().buttonBreakpoints,
//               child: CommonComponents.defaultTextFormField(
//                 context,
//                 hintText: 'Enter Key',
//                 onChange: (val) => node.value.value = val,
//               ),
//             ),
//           if (controller.operatorTypes != 'AND' ||
//               controller.operatorTypes != 'OR')
//             ResponsiveColumn(
//               ResponsiveConstants().smallBreakpoints,
//               child: CommonComponents.defaultTextFormField(
//                 context,
//                 hintText: 'Selected Operator Condition',
//                 readOnly: true,
//                 onChange: (val) => node.value2.value = val,
//               ),
//             ),
//           if (controller.operatorTypes != 'AND' ||
//               controller.operatorTypes != 'OR')
//             ResponsiveColumn(
//               ResponsiveConstants().buttonBreakpoints,
//               child: CommonComponents.defaultTextFormField(
//                 context,
//                 hintText: 'Enter Value',
//                 onChange: (val) => node.value2.value = val,
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAddButtons(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 24),
//       child: Row(
//         children: [
//           TextButton.icon(
//             icon: const Icon(Icons.add, size: 20),
//             label: const Text('Add condition'),
//             onPressed: () => controller.addFilterNode(node),
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.grey[700],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
