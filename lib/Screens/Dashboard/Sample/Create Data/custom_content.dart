// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class FieldConfig {
//   final String type;
//   final bool required;
//   final dynamic defaultValue;
//   final Map<String, dynamic>? constraints;
//   final List<List<dynamic>>? choices;
//   final String? format;
//   final List<String>? inputFormats;
//   final bool readOnly;

//   FieldConfig({
//     required this.type,
//     this.required = false,
//     this.defaultValue,
//     this.constraints,
//     this.choices,
//     this.format,
//     this.inputFormats,
//     this.readOnly = false,
//   });
// }

// class DynamicForm extends StatefulWidget {
//   const DynamicForm({super.key});

//   @override
//   _DynamicFormState createState() => _DynamicFormState();
// }

// class _DynamicFormState extends State<DynamicForm> {
//   final _formKey = GlobalKey<FormState>();
//   List<Map<String, dynamic>> formFields = [];
//   Map<String, dynamic> formData = {};

//   // Predefined field configurations
//   final Map<String, FieldConfig> fieldsDict = {
//     'Char': FieldConfig(
//       type: 'Char',
//       required: false,
//       constraints: {'maxLength': 100, 'minLength': 1},
//     ),
//     'Text': FieldConfig(
//       type: 'Text',
//       required: false,
//       constraints: {'maxLength': 1000, 'minLength': 5},
//     ),
//     'Choice': FieldConfig(
//       type: 'Choice',
//       required: false,
//       defaultValue: 1,
//       choices: [
//         [1, 'Male'],
//         [2, 'Female'],
//         [3, 'Others']
//       ],
//     ),
//     'Integer': FieldConfig(
//       type: 'Integer',
//       required: false,
//       defaultValue: 0,
//     ),
//     'DateTime': FieldConfig(
//       type: 'DateTime',
//       required: false,
//       format: 'dd-MM-yyyy hh:mm a',
//       inputFormats: ['dd-MM-yyyy hh:mm a'],
//       readOnly: true,
//     ),
//     'Date': FieldConfig(
//       type: 'Date',
//       required: false,
//       format: 'dd-MM-yyyy',
//       inputFormats: ['dd-MM-yyyy'],
//       readOnly: true,
//     ),
//     'Time': FieldConfig(
//       type: 'Time',
//       required: false,
//       format: 'hh:mm a',
//       inputFormats: ['hh:mm a'],
//       readOnly: true,
//     ),
//     'Duration': FieldConfig(
//       type: 'Duration',
//       required: false,
//       format: 'dd-MM-yyyy hh:mm a',
//       inputFormats: ['dd-MM-yyyy hh:mm a'],
//       readOnly: true,
//     ),
//   };

//   final TextEditingController _fieldNameController = TextEditingController();
//   String selectedFieldType = 'Char';

//   @override
//   void dispose() {
//     _fieldNameController.dispose();
//     super.dispose();
//   }

//   void _showAddFieldDialog() {
//     _fieldNameController.clear();
    
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setStateDialog) {
//             return AlertDialog(
//               title: const Text('Add New Field'),
//               content: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextFormField(
//                       controller: _fieldNameController,
//                       decoration: const InputDecoration(
//                         labelText: 'Field Name',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     DropdownButtonFormField<String>(
//                       value: selectedFieldType,
//                       decoration: const InputDecoration(
//                         labelText: 'Field Type',
//                         border: OutlineInputBorder(),
//                       ),
//                       items: fieldsDict.keys.map((type) {
//                         return DropdownMenuItem(
//                           value: type,
//                           child: Text(type),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setStateDialog(() {
//                           selectedFieldType = value!;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('Cancel'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_fieldNameController.text.isNotEmpty) {
//                       _addNewField(
//                         _fieldNameController.text,
//                         selectedFieldType,
//                       );
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: const Text('Add Field'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   void _addNewField(String fieldName, String fieldType) {
//     setState(() {
//       formFields.add({
//         'name': fieldName,
//         'type': fieldType,
//         'config': fieldsDict[fieldType]!,
//       });
//     });
//   }

//   Widget _buildDynamicField(Map<String, dynamic> field) {
//     final FieldConfig config = field['config'];
//     final String fieldName = field['name'];

//     switch (config.type) {
//       case 'Char':
//       case 'Text':
//         return TextFormField(
//           decoration: InputDecoration(
//             labelText: fieldName,
//             border: const OutlineInputBorder(),
//           ),
//           maxLength: config.constraints?['maxLength'],
//           maxLines: config.type == 'Text' ? 3 : 1,
//           validator: (value) {
//             if (config.required && (value == null || value.isEmpty)) {
//               return '$fieldName is required';
//             }
//             if (value != null && value.length < (config.constraints?['minLength'] ?? 0)) {
//               return '$fieldName must be at least ${config.constraints?['minLength']} characters';
//             }
//             return null;
//           },
//           onChanged: (value) {
//             formData[fieldName] = value;
//           },
//         );

//       // case 'Choice':
//       //   return DropdownButtonFormField<int>(
//       //     decoration: InputDecoration(
//       //       labelText: fieldName,
//       //       border: const OutlineInputBorder(),
//       //     ),
//       //     value: config.defaultValue,
//       //     items: config.choices?.map((choice) {
//       //       return DropdownMenuItem(
//       //         value: choice[0],
//       //         child: Text(choice[1]),
//       //       );
//       //     }).toList(),
//       //     validator: (value) {
//       //       if (config.required && value == null) {
//       //         return '$fieldName is required';
//       //       }
//       //       return null;
//       //     },
//       //     onChanged: (value) {
//       //       setState(() {
//       //         formData[fieldName] = value;
//       //       });
//       //     },
//       //   );

//       case 'Integer':
//         return TextFormField(
//           decoration: InputDecoration(
//             labelText: fieldName,
//             border: const OutlineInputBorder(),
//           ),
//           keyboardType: TextInputType.number,
//           initialValue: config.defaultValue?.toString(),
//           validator: (value) {
//             if (config.required && (value == null || value.isEmpty)) {
//               return '$fieldName is required';
//             }
//             if (value != null && int.tryParse(value) == null) {
//               return 'Please enter a valid number';
//             }
//             return null;
//           },
//           onChanged: (value) {
//             formData[fieldName] = int.tryParse(value);
//           },
//         );

//       case 'DateTime':
//       case 'Date':
//       case 'Time':
//         return TextFormField(
//           decoration: InputDecoration(
//             labelText: fieldName,
//             border: const OutlineInputBorder(),
//           ),
//           readOnly: config.readOnly,
//           onTap: () async {
//             if (config.type == 'Date' || config.type == 'DateTime') {
//               final DateTime? picked = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(1900),
//                 lastDate: DateTime(2100),
//               );
//               if (picked != null) {
//                 if (config.type == 'DateTime') {
//                   final TimeOfDay? time = await showTimePicker(
//                     context: context,
//                     initialTime: TimeOfDay.now(),
//                   );
//                   if (time != null) {
//                     setState(() {
//                       final DateTime datetime = DateTime(
//                         picked.year,
//                         picked.month,
//                         picked.day,
//                         time.hour,
//                         time.minute,
//                       );
//                       formData[fieldName] = DateFormat(config.format).format(datetime);
//                     });
//                   }
//                 } else {
//                   setState(() {
//                     formData[fieldName] = DateFormat(config.format).format(picked);
//                   });
//                 }
//               }
//             } else if (config.type == 'Time') {
//               final TimeOfDay? time = await showTimePicker(
//                 context: context,
//                 initialTime: TimeOfDay.now(),
//               );
//               if (time != null) {
//                 setState(() {
//                   final DateTime now = DateTime.now();
//                   final DateTime datetime = DateTime(
//                     now.year,
//                     now.month,
//                     now.day,
//                     time.hour,
//                     time.minute,
//                   );
//                   formData[fieldName] = DateFormat(config.format).format(datetime);
//                 });
//               }
//             }
//           },
//           controller: TextEditingController(text: formData[fieldName]),
//           validator: (value) {
//             if (config.required && (value == null || value.isEmpty)) {
//               return '$fieldName is required';
//             }
//             return null;
//           },
//         );

//       default:
//         return Container();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dynamic Form Builder'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               ...formFields.map((field) => Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: Row(
//                   children: [
//                     Expanded(child: _buildDynamicField(field)),
//                     IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () {
//                         setState(() {
//                           formFields.remove(field);
//                           formData.remove(field['name']);
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               )),
//               const SizedBox(height: 20),
//               if (formFields.isNotEmpty)
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       print('Form Data: $formData');
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Form submitted successfully!')),
//                       );
//                     }
//                   },
//                   child: const Text('Submit'),
//                 ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddFieldDialog,
//         tooltip: 'Add Field',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DynamicFormDialog extends StatefulWidget {
  @override
  _DynamicFormDialogState createState() => _DynamicFormDialogState();
}

class _DynamicFormDialogState extends State<DynamicFormDialog> {
  String? selectedType;
  final Map<String, Map<String, dynamic>> fieldsDict = {
    'name': {'type': 'Char', 'required': false, 'max_length': 100, 'min_length': 1},
    'description': {'type': 'Text', 'required': false, 'max_length': 1000, 'min_length': 5},
    'gender': {'type': 'Choice', 'required': false, 'default': 1, 'choices': [[1, 'Male'], [2, 'Female'], [3, 'Others']]},
    'age': {'type': 'Integer', 'required': false, 'default': 0},
  };

  void openDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Type'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                hint: Text('Select Type'),
                value: selectedType,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedType = newValue;
                  });
                },
                items: fieldsDict.keys.map<DropdownMenuItem<String>>((String key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                }).toList(),
              ),
              if (selectedType != null) ..._buildFields(selectedType!),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildFields(String type) {
    List<Widget> fields = [];
    var fieldInfo = fieldsDict[type];

    if (fieldInfo != null) {
      if (fieldInfo['type'] == 'Char') {
        fields.add(TextFormField(
          decoration: InputDecoration(labelText: 'Name (max ${fieldInfo['max_length']})'),
        ));
      } else if (fieldInfo['type'] == 'Text') {
        fields.add(TextFormField(
          decoration: InputDecoration(labelText: 'Description (min ${fieldInfo['min_length']})'),
          maxLength: fieldInfo['max_length'],
        ));
      } else if (fieldInfo['type'] == 'Choice') {
        fields.add(DropdownButton<int>(
          hint: Text('Select Gender'),
          value: fieldInfo['default'],
          onChanged: (int? newValue) {
            setState(() {
              fieldInfo['default'] = newValue;
            });
          },
          items: (fieldInfo['choices'] as List).map<DropdownMenuItem<int>>((choice) {
            return DropdownMenuItem<int>(
              value: choice[0],
              child: Text(choice[1]),
            );
          }).toList(),
        ));
      }
      // Add more conditions for other types as needed
    }

    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Form Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: openDialog,
          child: Text('Open Form Dialog'),
        ),
      ),
    );
  }
}
