
// import 'package:flutter/material.dart';
// import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class FieldDataSource extends DataGridSource {
//   final BuildContext context;
//   final DynamicController controller;
  
//   FieldDataSource(List<Map<String, dynamic>> fields, this.context, this.controller) {
//     updateData(fields);
//   }

//   List<DataGridRow> fieldData = [];
//   List<String> get columnOrder => [
//     'sNo', 'fieldName', 'fieldType', 'required', 'showView',
//     'showReport', 'showEdit', 'showFilter', 'showList', 'showAdd',
//     'choices', 'minLength', 'maxLength', 'readOnly', 'maxDigits',
//     'decimalPlace', 'rangeFilter', 'default', 'multipleFilter', 'actions'
//   ];

//   void moveRow(int fromIndex, int toIndex) {
//     if (fromIndex < 0 || toIndex < 0 || fromIndex >= fieldData.length || toIndex >= fieldData.length) {
//       return;
//     }

//     final movedRow = fieldData.removeAt(fromIndex);
//     fieldData.insert(toIndex, movedRow);

//     notifyListeners(); // Refresh UI
//   }


//   rearrangeColumns(int fromIndex, int toIndex) {
//     if (fromIndex < 0 || toIndex < 0 || fromIndex >= columnOrder.length || toIndex >= columnOrder.length) {
//       return;
//     }

//     final String movedColumn = columnOrder.removeAt(fromIndex);
//     columnOrder.insert(toIndex, movedColumn);

//     // Reorder data cells according to new column order
//     fieldData = fieldData.map((row) {
//       final cells = row.getCells();
//       final reorderedCells = columnOrder.map<DataGridCell<Object>>((columnName) {
//         return cells.firstWhere((cell) => cell.columnName == columnName) as DataGridCell<Object>;
//       }).toList();
      
//       return DataGridRow(cells: reorderedCells);
//     }).toList();

//     notifyListeners();
//   }

//   void shuffleDataTB() {
//     if (fieldData.isNotEmpty) {
//       final firstRow = fieldData.removeAt(0); // Remove the top row
//       fieldData.add(firstRow); // Append it to the bottom
//       notifyListeners(); // Notify the grid to update
//     }
//   }

//   void shuffleDataBT() {
//     if (fieldData.isNotEmpty) {
//       final lastRow = fieldData.removeAt(fieldData.length - 1); // Remove the bottom row
//       fieldData.insert(0, lastRow); // Insert it at the top
//       notifyListeners(); // Notify the grid to update
//     }
//   }

//   void updateData(List<Map<String, dynamic>> fields) {
//     try {
//       print('Fields received: $fields');
      
//       if (fields.isEmpty) {
//         fieldData = [createEmptyRow()];
//         notifyListeners();
//         return;
//       }

//       int rowIndex = 1;
//       fieldData = [];

//       for (var field in fields) {
//         field.forEach((fieldName, attributes) {
//           fieldData.add(DataGridRow(
//             cells: columnOrder.map<DataGridCell>((column) {
//               switch (column) {
//                 case 'sNo':
//                   return DataGridCell<int>(columnName: column, value: rowIndex);
//                 case 'fieldName':
//                   return DataGridCell<String>(columnName: column, value: fieldName);
//                 case 'fieldType':
//                   return DataGridCell<String>(columnName: column, value: attributes['type']?.toString() ?? '-');
//                 case 'required':
//                   return DataGridCell<String>(columnName: column, value: attributes['required']?.toString() ?? '-');
//                 case 'showView':
//                   return DataGridCell<String>(columnName: column, value: attributes['show_in_view']?.toString() ?? '-');
//                 case 'showReport':
//                   return DataGridCell<String>(columnName: column, value: attributes['show_in_report']?.toString() ?? '-');
//                 case 'showEdit':
//                   return DataGridCell<String>(columnName: column, value: attributes['show_in_edit']?.toString() ?? '-');
//                 case 'showFilter':
//                   return DataGridCell<String>(columnName: column, value: attributes['show_in_filter']?.toString() ?? '-');
//                 case 'showList':
//                   return DataGridCell<String>(columnName: column, value: attributes['show_in_list']?.toString() ?? '-');
//                 case 'showAdd':
//                   return DataGridCell<String>(columnName: column, value: attributes['show_in_add']?.toString() ?? '-');
//                 case 'choices':
//                   if (attributes['type'] == 'Choice' && attributes['choices'] != null) {
//                     return DataGridCell<List>(columnName: column, value: attributes['choices'] as List);
//                   }
//                   return DataGridCell<String>(columnName: column, value: '-');
//                 case 'minLength':
//                   return DataGridCell<String>(columnName: column, value: attributes['min_length']?.toString() ?? '-');
//                 case 'maxLength':
//                   return DataGridCell<String>(columnName: column, value: attributes['max_length']?.toString() ?? '-');
//                 case 'readOnly':
//                   return DataGridCell<String>(columnName: column, value: attributes['read_only']?.toString() ?? '-');
//                 case 'maxDigits':
//                   return DataGridCell<String>(columnName: column, value: attributes['max_digits']?.toString() ?? '-');
//                 case 'decimalPlace':
//                   return DataGridCell<String>(columnName: column, value: attributes['decimal_places']?.toString() ?? '-');
//                 case 'rangeFilter':
//                   return DataGridCell<String>(columnName: column, value: attributes['range_filter']?.toString() ?? '-');
//                 case 'default':
//                   return DataGridCell<String>(columnName: column, value: attributes['default']?.toString() ?? '-');
//                 case 'multipleFilter':
//                   return DataGridCell<String>(columnName: column, value: attributes['multiple_filter']?.toString() ?? '-');
//                 case 'actions':
//                   return DataGridCell<Map<String, dynamic>>(
//                     columnName: column,
//                     value: {'index': rowIndex - 1, 'attributes': attributes}
//                   );
//                 default:
//                   return DataGridCell<String>(columnName: column, value: '-');
//               }
//             }).toList(),
//           ));
//           rowIndex++;
//         });
//       }
      
//       notifyListeners();
//     } catch (e, stackTrace) {
//       print('Error updating data: $e');
//       print('Stack trace: $stackTrace');
//       fieldData = [createEmptyRow()];
//       notifyListeners();
//     }
//   }

//   DataGridRow createEmptyRow() {
//     return DataGridRow(
//       cells: columnOrder.map<DataGridCell>((column) {
//         return DataGridCell<String>(
//           columnName: column,
//           value: column == 'fieldName' ? 'No Records Found' : ''
//         );
//       }).toList(),
//     );
//   }

//   @override
//   List<DataGridRow> get rows => fieldData;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//       cells: row.getCells().map<Widget>((cell) {
//         if (cell.columnName == 'choices' && cell.value is List) {
//           return buildChoicesDropdown(cell.value as List);
//         } else if (cell.columnName == 'actions' && cell.value is Map<String, dynamic>) {
//           return buildActionButtons(cell.value as Map<String, dynamic>);
//         }
        
//         return Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             cell.value?.toString() ?? '',
//             style: const TextStyle(fontWeight: FontWeight.w400),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget buildChoicesDropdown(List choices) {
//     return Container(
//       margin: const EdgeInsets.all(5.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         border: Border.all(color: Colors.grey.shade300)
//       ),
//       child: DropdownButton<String>(
//         menuMaxHeight: 150,
//         borderRadius: BorderRadius.circular(10.0),
//         dropdownColor: Theme.of(context).colorScheme.secondary,
//         value: null,
//         items: choices.map<DropdownMenuItem<String>>((choice) {
//           return DropdownMenuItem<String>(
//             value: choice[1].toString(),
//             child: Text(choice[1].toString()),
//           );
//         }).toList(),
//         onChanged: (String? newValue) {
//           // controller.selectedChoice = newValue;
//           print('Selected: $newValue');
//         },
//       ),
//     );
//   }

//   Widget buildActionButtons(Map<String, dynamic> actionData) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           icon: const Icon(Icons.edit),
//           onPressed: () => controller.editField(actionData['index'], actionData['attributes']),
//         ),
//         IconButton(
//           icon: const Icon(Icons.delete),
//           onPressed: () => controller.deleteField(actionData['index']),
//         ),
//       ],
//     );
//   }

//   String getColumnLabel(String columnName) {
//     final labels = {
//       'sNo': 'S.No',
//       'fieldName': 'Field Name',
//       'fieldType': 'Field Type',
//       'required': 'Required',
//       'showView': 'Show View',
//       'showReport': 'Show Report',
//       'showEdit': 'Show Edit',
//       'showFilter': 'Show Filter',
//       'showList': 'Show List',
//       'showAdd': 'Show Add',
//       'choices': 'Choices',
//       'minLength': 'Min Length',
//       'maxLength': 'Max Length',
//       'readOnly': 'Read Only',
//       'maxDigits': 'Max Digits',
//       'decimalPlace': 'Decimal Place',
//       'rangeFilter': 'Range Filter',
//       'default': 'Default',
//       'multipleFilter': 'Multiple Filter',
//       'actions': 'Actions'
//     };
//     return labels[columnName] ?? columnName;
//   }
// }