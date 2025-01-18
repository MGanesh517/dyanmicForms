// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:get/get.dart';
// // import 'package:implementation_panel/BreakPoints/breakpoints.dart';
// // import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
// // import 'package:implementation_panel/Common/Common%20Components/common_dialog_box.dart';
// // import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
// // import 'package:implementation_panel/Screens/Dashboard/custom_appbar.dart';
// // import 'package:responsive_toolkit/responsive_grid.dart';

// // class FieldConfig {
// //   String type;
// //   String name;
// //   bool required;
// //   int? maxLength;
// //   int? minLength;
// //   List<Map<String, dynamic>>? choices;
// //   String? format;
// //   String? value;
// //   dynamic fieldValue;

// //   FieldConfig({
// //     required this.type,
// //     required this.name,
// //     this.required = false,
// //     this.maxLength,
// //     this.minLength,
// //     this.choices,
// //     this.format,
// //     this.value,
// //     this.fieldValue
// //   });

// // //   Map<String, dynamic> toJson() {
// // //     return {
// // //       'type': type,
// // //       'name': name,
// // //       'required': required,
// // //       'max_length': maxLength,
// // //       'min_length': minLength,
// // //       'choices': choices,
// // //       'format': format,
// // //       'value': value,
// // //     };
// // //   }
// // // }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'type': type,
// //       'name': name,
// //       'required': required,
// //       'max_length': maxLength,
// //       'min_length': minLength,
// //       'choices': choices,
// //       'format': format,
// //       'value': value,
// //       'field_value': fieldValue,
// //     };
// //   }
// // }

// // // Create Field Dialog Content
// // class CreateFieldDialogContent extends StatefulWidget {
// //   final Function(FieldConfig) onFieldCreated;

// //   const CreateFieldDialogContent({super.key, required this.onFieldCreated});

// //   @override
// //   _CreateFieldDialogContentState createState() =>
// //       _CreateFieldDialogContentState();
// // }

// // class _CreateFieldDialogContentState extends State<CreateFieldDialogContent> {
// //   final _formKey = GlobalKey<FormState>();
// //   String selectedType = '';
// //   String fieldName = '';
// //   bool isRequired = false;
// //   TextEditingController maxLengthController = TextEditingController();
// //   TextEditingController minLengthController = TextEditingController();
// //   List<Map<String, dynamic>> choices = [];
// //   String format = '';

// //   void submitFormExternally() {
// //     submitForm();
// //   }

// //   void submitForm() {
// //     if (_formKey.currentState!.validate()) {
// //       final fieldConfig = FieldConfig(
// //         type: selectedType,
// //         name: fieldName,
// //         required: isRequired,
// //         maxLength: int.tryParse(maxLengthController.text),
// //         minLength: int.tryParse(minLengthController.text),
// //         choices: choices.isNotEmpty ? choices : null,
// //         format: format.isNotEmpty ? format : null,
// //       );
// //       widget.onFieldCreated(fieldConfig);
// //       Navigator.pop(context);
// //     }
// //   }

// //   final Map<String, Map<String, bool>> fieldTypes = {
// //     'Char': {'hasLength': true, 'hasChoices': false, 'hasFormat': false},
// //     'Text': {'hasLength': true, 'hasChoices': false, 'hasFormat': false},
// //     'Choice': {'hasLength': false, 'hasChoices': true, 'hasFormat': false},
// //     'Integer': {'hasLength': false, 'hasChoices': false, 'hasFormat': false},
// //     'DateTime': {'hasLength': false, 'hasChoices': false, 'hasFormat': true},
// //     'Date': {'hasLength': false, 'hasChoices': false, 'hasFormat': true},
// //     'Time': {'hasLength': false, 'hasChoices': false, 'hasFormat': true},
// //   };

// // // void submitForm() {
// // //   if (_formKey.currentState!.validate()) {
// // //     final fieldConfig = FieldConfig(
// // //       type: selectedType,
// // //       name: fieldName,
// // //       required: isRequired,
// // //       maxLength: int.tryParse(maxLengthController.text),
// // //       minLength: int.tryParse(minLengthController.text),
// // //       choices: choices.isNotEmpty ? choices : null,
// // //       format: format.isNotEmpty ? format : null,
// // //     );

// // //     print('FieldConfig Created: ${fieldConfig.toJson()}');
// // //     widget.onFieldCreated(fieldConfig);
// // //     Navigator.pop(context);
// // //   }
// // // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Form(
// //       key: _formKey,
// //       child: SingleChildScrollView(
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             // Field Type Dropdown
// //             DropdownButtonFormField<String>(
// //               decoration: InputDecoration(
// //                 labelText: 'Field Type',
// //                 border: OutlineInputBorder(),
// //               ),
// //               value: selectedType.isEmpty ? null : selectedType,
// //               items: fieldTypes.keys.map((String type) {
// //                 return DropdownMenuItem(
// //                   value: type,
// //                   child: Text(type),
// //                 );
// //               }).toList(),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please select a field type';
// //                 }
// //                 return null;
// //               },
// //               onChanged: (String? newValue) {
// //                 setState(() {
// //                   selectedType = newValue ?? '';
// //                 });
// //               },
// //             ),
// //             SizedBox(height: 16),

// //             // Field Name
// //             // TextFormField(
// //             //   decoration: InputDecoration(
// //             //     labelText: 'Field Name',
// //             //     border: OutlineInputBorder(),
// //             //   ),
// //             //   validator: (value) {
// //             //     if (value == null || value.isEmpty) {
// //             //       return 'Please enter a field name';
// //             //     }
// //             //     return null;
// //             //   },
// //             //   onChanged: (value) {
// //             //     fieldName = value;
// //             //   },
// //             // ),
// //             // SizedBox(height: 16),

// //             // Required Checkbox
// //             CheckboxListTile(
// //               title: Text('Required'),
// //               value: isRequired,
// //               onChanged: (bool? value) {
// //                 setState(() {
// //                   isRequired = value ?? false;
// //                 });
// //               },
// //             ),

// //             // Conditional Fields based on type
// //             if (fieldTypes[selectedType]?['hasLength'] ?? false) ...[
// //               SizedBox(height: 16),
// //               TextFormField(
// //                 controller: maxLengthController,
// //                 decoration: InputDecoration(
// //                   labelText: 'Max Length',
// //                   border: OutlineInputBorder(),
// //                 ),
// //                 keyboardType: TextInputType.number,
// //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //               ),
// //               SizedBox(height: 16),
// //               TextFormField(
// //                 controller: minLengthController,
// //                 decoration: InputDecoration(
// //                   labelText: 'Min Length',
// //                   border: OutlineInputBorder(),
// //                 ),
// //                 keyboardType: TextInputType.number,
// //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //               ),
// //             ],

// //             if (fieldTypes[selectedType]?['hasChoices'] ?? false) ...[
// //               SizedBox(height: 16),
// //               Text('Choices', style: TextStyle(fontWeight: FontWeight.bold)),
// //               ListView.builder(
// //                 shrinkWrap: true,
// //                 physics: NeverScrollableScrollPhysics(),
// //                 padding: EdgeInsets.symmetric(horizontal: 8),
// //                 itemCount: choices.length + 1,
// //                 itemBuilder: (context, index) {
// //                   if (index == choices.length) {
// //                     return TextButton.icon(
// //                       onPressed: () {
// //                         setState(() {
// //                           choices.add({'label': '', 'value': ''});
// //                         });
// //                       },
// //                       icon: Icon(Icons.add),
// //                       label: Text('Add Choice'),
// //                     );
// //                   }
// //                   return Row(
// //                     children: [
// //                       Expanded(
// //                         child: TextFormField(
// //                           decoration: InputDecoration(
// //                             labelText: 'Choice ${index + 1}',
// //                             border: OutlineInputBorder(),
// //                           ),
// //                           onChanged: (value) {
// //                             choices[index]['label'] = value;
// //                             choices[index]['value'] = index + 1;
// //                           },
// //                         ),
// //                       ),
// //                       IconButton(
// //                         icon: Icon(Icons.delete, color: Colors.red),
// //                         onPressed: () {
// //                           setState(() {
// //                             choices.removeAt(index);
// //                           });
// //                         },
// //                       ),
// //                     ],
// //                   );
// //                 },
// //               ),
// //             ],

// //             if (fieldTypes[selectedType]?['hasFormat'] ?? false) ...[
// //               SizedBox(height: 16),
// //               TextFormField(
// //                 decoration: InputDecoration(
// //                   labelText: 'Format',
// //                   border: OutlineInputBorder(),
// //                   hintText: 'e.g., dd-MM-yyyy',
// //                 ),
// //                 onChanged: (value) {
// //                   format = value;
// //                 },
// //               ),
// //             ],
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // Main Screen
// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   final fieldDialogKey = GlobalKey<_CreateFieldDialogContentState>();
// //   final controller = Get.put(DynamicController());
// //   final _formKey = GlobalKey<FormState>();
// //   List<FieldConfig> createdFields = [];
// //   Map<String, dynamic> formData = {};

// //   Widget _buildDynamicField(FieldConfig field) {
// //     InputDecoration getDecoration() {
// //       return InputDecoration(
// //         labelText: field.name,
// //         border: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //         errorText: field.required ? '${field.name} is required' : null,
// //       );
// //     }

// //     switch (field.type) {
// //       case 'Char':
// //       case 'Text':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           maxLength: field.maxLength,
// //           validator: (value) {
// //             if (field.required && (value == null || value.isEmpty)) {
// //               return '${field.name} is required';
// //             }
// //             if (field.minLength != null && value!.length < field.minLength!) {
// //               return 'Minimum length is ${field.minLength}';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             setState(() {
// //               field.fieldValue = value;
// //               formData[field.name] = value;
// //             });
// //           },
// //         );

// //       case 'Integer':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           keyboardType: TextInputType.number,
// //           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //           validator: (value) {
// //             if (field.required && (value == null || value.isEmpty)) {
// //               return '${field.name} is required';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             setState(() {
// //               field.fieldValue = int.tryParse(value);
// //               formData[field.name] = field.fieldValue;
// //             });
// //           },
// //         );

// //       case 'Choice':
// //         return DropdownButtonFormField<String>(
// //           decoration: getDecoration(),
// //           value: field.fieldValue,
// //           items: field.choices?.map<DropdownMenuItem<String>>((choice) {
// //             return DropdownMenuItem<String>(
// //               value: choice['label'],
// //               child: Text(choice['label']),
// //             );
// //           }).toList(),
// //           validator: (value) {
// //             if (field.required && value == null) {
// //               return '${field.name} is required';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             setState(() {
// //               field.fieldValue = value;
// //               formData[field.name] = value;
// //             });
// //           },
// //         );

// //       case 'DateTime':
// //       case 'Date':
// //       case 'Time':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           readOnly: true,
// //           controller: TextEditingController(text: field.fieldValue?.toString()),
// //           onTap: () async {
// //             if (field.type == 'Time') {
// //               final TimeOfDay? picked = await showTimePicker(
// //                 context: context,
// //                 initialTime: TimeOfDay.now(),
// //               );
// //               if (picked != null) {
// //                 setState(() {
// //                   field.fieldValue = '${picked.hour}:${picked.minute}';
// //                   formData[field.name] = field.fieldValue;
// //                 });
// //               }
// //             } else {
// //               final DateTime? picked = await showDatePicker(
// //                 context: context,
// //                 initialDate: DateTime.now(),
// //                 firstDate: DateTime(1900),
// //                 lastDate: DateTime(2100),
// //               );
// //               if (picked != null) {
// //                 setState(() {
// //                   field.fieldValue = picked.toString().split(' ')[0];
// //                   formData[field.name] = field.fieldValue;
// //                 });
// //               }
// //             }
// //           },
// //           validator: (value) {
// //             if (field.required && (value == null || value.isEmpty)) {
// //               return '${field.name} is required';
// //             }
// //             return null;
// //           },
// //         );

// //       default:
// //         return Container();
// //     }
// //   }

// //   void _submitForm() {
// //     if (_formKey.currentState!.validate()) {
// //       // Add app label and model name to form data
// //       formData['app_label'] = controller.appLabel.text;
// //       formData['model_name'] = controller.modelName.text;
      
// //       print('Form Data: $formData');
// //       // Here you can send the form data to your backend or process it as needed
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Form submitted successfully!')),
// //       );
// //     }
// //   }

// //   Widget _buildFieldCard(FieldConfig field) {
// //     return Card(
// //       margin: EdgeInsets.symmetric(vertical: 8),
// //       child: Padding(
// //         padding: EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   field.name,
// //                   style: TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 16,
// //                   ),
// //                 ),
// //                 Container(
// //                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// //                   decoration: BoxDecoration(
// //                     color: Theme.of(context).primaryColor.withOpacity(0.1),
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   child: Text(
// //                     field.type,
// //                     style: TextStyle(
// //                       color: Theme.of(context).primaryColor,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 8),
// //             if (field.required)
// //               Chip(
// //                 label: Text('Required'),
// //                 backgroundColor: Colors.blue.withOpacity(0.1),
// //               ),
// //             if (field.maxLength != null) Text('Max Length: ${field.maxLength}'),
// //             if (field.minLength != null) Text('Min Length: ${field.minLength}'),
// //             if (field.choices != null && field.choices!.isNotEmpty)
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text('Choices:',
// //                       style: TextStyle(fontWeight: FontWeight.bold)),
// //                   ...field.choices!.map(
// //                     (choice) => Padding(
// //                       padding: EdgeInsets.only(left: 16),
// //                       child: Text('• ${choice['label']}'),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             if (field.format != null) Text('Format: ${field.format}'),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) => LayoutBuilder(
// //         builder: (context, constraints) {
// //           final bool isLargeScreen = constraints.maxWidth > 500;

// //           return CommonScaffoldWithAppBar(
// //             body: Form(
// //               key: _formKey,
// //               child: Padding(
// //                 padding: isLargeScreen ? EdgeInsets.all(24.0) : EdgeInsets.all(16.0),
// //                 child: Column(
// //                   crossAxisAlignment: isLargeScreen
// //                       ? CrossAxisAlignment.start
// //                       : CrossAxisAlignment.center,
// //                   children: [
// //                     Text("Create Data",
// //                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
// //                     SizedBox(height: isLargeScreen ? 25.0 : 12.0),
// //                     // ... [Rest of your existing UI code]
// //                     SizedBox(height: isLargeScreen ? 25.0 : 12.0),
// //                   ResponsiveRow(
// //                     runSpacing: 10,
// //                     spacing: 20,
// //                     columns: [
// //                       ResponsiveColumn(
// //                         ResponsiveConstants().searchBreakPoint,
// //                         child: CommonComponents.defaultTextField(
// //                           context,
// //                           title: 'App Label',
// //                           hintText: 'Enter App Label',
// //                           controller: controller.appLabel,
// //                           validator: (String? val) {
// //                             if (val == '') {
// //                               return 'Please enter a valid App Label';
// //                             }
// //                             return null;
// //                           },
// //                           keyboardType: TextInputType.text,
// //                           textInputAction: TextInputAction.next,
// //                           onChange: (val) {},
// //                         ),
// //                       ),
// //                       ResponsiveColumn(
// //                         ResponsiveConstants().searchBreakPoint,
// //                         child: CommonComponents.defaultTextField(
// //                           context,
// //                           title: 'Model Name',
// //                           hintText: 'Enter Model Name',
// //                           controller: controller.appLabel,
// //                           validator: (String? val) {
// //                             if (val == '') {
// //                               return 'Please enter a valid Model Name';
// //                             }
// //                             return null;
// //                           },
// //                           keyboardType: TextInputType.text,
// //                           textInputAction: TextInputAction.next,
// //                           onChange: (val) {},
// //                         ),
// //                       ),
// //                       ResponsiveColumn(
// //                         ResponsiveConstants().buttonBreakpoints,
// //                         child: Padding(
// //                           padding: const EdgeInsets.only(
// //                               top: 12, right: 12, bottom: 12),
// //                           child: MaterialButton(
// //                             minWidth: 85,
// //                             height: 35,
// //                             elevation: 0.0,
// //                             shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(10)),
// //                             color: Theme.of(context).colorScheme.primary,
// //                             highlightColor:
// //                                 Theme.of(context).colorScheme.primary,
// //                             onPressed: () {
// //                               AnimatedDialog.show(
// //                                 context: context,
// //                                 title: 'Create Field',
// //                                 dialogHeight: DialogHeight.large,
// //                                 dialogWidth: DialogWidth.extraSmall,
// //                                 confirmButtonText: 'Create',
// //                                 onConfirm: () {
// //                                   print("dfhshsfgcdxfdsfs");
// //                                   fieldDialogKey.currentState?.submitForm();
// //                                 },
// //                                 cancelButtonText: 'Cancel',
// //                                 animationType: DialogAnimationType.slideLeft,
// //                                 customContent: CreateFieldDialogContent(
// //                                   onFieldCreated: (FieldConfig fieldConfig) {
// //                                     setState(() {
// //                                       createdFields.add(fieldConfig);
// //                                     });
// //                                   },
// //                                 ),
// //                               );
// //                             },
// //                             child: Text(
// //                               "Add Fields",
// //                               style: TextStyle(
// //                                 color: Theme.of(context).colorScheme.secondary,
// //                                 fontSize: 18,
// //                                 fontWeight: FontWeight.w600,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
                    
// //                     // Add Submit Button
// //                     if (createdFields.isNotEmpty)
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(vertical: 16.0),
// //                         child: ElevatedButton(
// //                           onPressed: _submitForm,
// //                           child: Text('Submit Form'),
// //                         ),
// //                       ),


// // SizedBox(height: 24),
// //                   if (createdFields.isNotEmpty) ...[
// //                     Text(
// //                       "Created Fields",
// //                       style:
// //                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
// //                     ),
// //                     SizedBox(height: 16),
// //                     Flexible(
// //                       child: ListView.builder(
// //                         itemCount: createdFields.length,
// //                         itemBuilder: (context, index) =>
// //                             _buildFieldCard(createdFields[index]),
// //                       ),
// //                     ),
// //                   ],
                      
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //       );
// // }







// // // class HomeScreen extends StatefulWidget {
// // //   const HomeScreen({super.key});

// // //   @override
// // //   State<HomeScreen> createState() => _HomeScreentate();
// // // }

// // // class _HomeScreentate extends State<HomeScreen> {
// // //   final fieldDialogKey = GlobalKey<_CreateFieldDialogContentState>();
// // //   final controller = Get.put(DynamicController());
// // //   List<FieldConfig> createdFields = [];

// // //   Widget _buildFieldCard(FieldConfig field) {
// // //     return Card(
// // //       margin: EdgeInsets.symmetric(vertical: 8),
// // //       child: Padding(
// // //         padding: EdgeInsets.all(16),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 Text(
// // //                   field.name,
// // //                   style: TextStyle(
// // //                     fontWeight: FontWeight.bold,
// // //                     fontSize: 16,
// // //                   ),
// // //                 ),
// // //                 Container(
// // //                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// // //                   decoration: BoxDecoration(
// // //                     color: Theme.of(context).primaryColor.withOpacity(0.1),
// // //                     borderRadius: BorderRadius.circular(12),
// // //                   ),
// // //                   child: Text(
// // //                     field.type,
// // //                     style: TextStyle(
// // //                       color: Theme.of(context).primaryColor,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //             SizedBox(height: 8),
// // //             if (field.required)
// // //               Chip(
// // //                 label: Text('Required'),
// // //                 backgroundColor: Colors.blue.withOpacity(0.1),
// // //               ),
// // //             if (field.maxLength != null) Text('Max Length: ${field.maxLength}'),
// // //             if (field.minLength != null) Text('Min Length: ${field.minLength}'),
// // //             if (field.choices != null && field.choices!.isNotEmpty)
// // //               Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Text('Choices:',
// // //                       style: TextStyle(fontWeight: FontWeight.bold)),
// // //                   ...field.choices!.map(
// // //                     (choice) => Padding(
// // //                       padding: EdgeInsets.only(left: 16),
// // //                       child: Text('• ${choice['label']}'),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             if (field.format != null) Text('Format: ${field.format}'),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) => LayoutBuilder(
// // //         builder: (context, constraints) {
// // //           final bool isLargeScreen = constraints.maxWidth > 500;

// // //           return CommonScaffoldWithAppBar(
// // //             body: Padding(
// // //               padding:
// // //                   isLargeScreen ? EdgeInsets.all(24.0) : EdgeInsets.all(16.0),
// // //               child: Column(
// // //                 crossAxisAlignment: isLargeScreen
// // //                     ? CrossAxisAlignment.start
// // //                     : CrossAxisAlignment.center,
// // //                 children: [
// // //                   Text("Create Data",
// // //                       style:
// // //                           TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
// // //                   SizedBox(height: isLargeScreen ? 25.0 : 12.0),
// // //                   ResponsiveRow(
// // //                     runSpacing: 10,
// // //                     spacing: 20,
// // //                     columns: [
// // //                       ResponsiveColumn(
// // //                         ResponsiveConstants().searchBreakPoint,
// // //                         child: CommonComponents.defaultTextField(
// // //                           context,
// // //                           title: 'App Label',
// // //                           hintText: 'Enter App Label',
// // //                           controller: controller.appLabel,
// // //                           validator: (String? val) {
// // //                             if (val == '') {
// // //                               return 'Please enter a valid App Label';
// // //                             }
// // //                             return null;
// // //                           },
// // //                           keyboardType: TextInputType.text,
// // //                           textInputAction: TextInputAction.next,
// // //                           onChange: (val) {},
// // //                         ),
// // //                       ),
// // //                       ResponsiveColumn(
// // //                         ResponsiveConstants().searchBreakPoint,
// // //                         child: CommonComponents.defaultTextField(
// // //                           context,
// // //                           title: 'Model Name',
// // //                           hintText: 'Enter Model Name',
// // //                           controller: controller.appLabel,
// // //                           validator: (String? val) {
// // //                             if (val == '') {
// // //                               return 'Please enter a valid Model Name';
// // //                             }
// // //                             return null;
// // //                           },
// // //                           keyboardType: TextInputType.text,
// // //                           textInputAction: TextInputAction.next,
// // //                           onChange: (val) {},
// // //                         ),
// // //                       ),
// // //                       ResponsiveColumn(
// // //                         ResponsiveConstants().buttonBreakpoints,
// // //                         child: Padding(
// // //                           padding: const EdgeInsets.only(
// // //                               top: 12, right: 12, bottom: 12),
// // //                           child: MaterialButton(
// // //                             minWidth: 85,
// // //                             height: 35,
// // //                             elevation: 0.0,
// // //                             shape: RoundedRectangleBorder(
// // //                                 borderRadius: BorderRadius.circular(10)),
// // //                             color: Theme.of(context).colorScheme.primary,
// // //                             highlightColor:
// // //                                 Theme.of(context).colorScheme.primary,
// // //                             onPressed: () {
// // //                               AnimatedDialog.show(
// // //                                 context: context,
// // //                                 title: 'Create Field',
// // //                                 dialogHeight: DialogHeight.large,
// // //                                 dialogWidth: DialogWidth.extraSmall,
// // //                                 confirmButtonText: 'Create',
// // //                                 onConfirm: () {
// // //                                   fieldDialogKey.currentState?.submitForm();
// // //                                 },
// // //                                 cancelButtonText: 'Cancel',
// // //                                 animationType: DialogAnimationType.slideLeft,
// // //                                 customContent: CreateFieldDialogContent(
// // //                                   onFieldCreated: (FieldConfig fieldConfig) {
// // //                                     setState(() {
// // //                                       createdFields.add(fieldConfig);
// // //                                     });
// // //                                   },
// // //                                 ),
// // //                               );
// // //                             },
// // //                             child: Text(
// // //                               "Add Fields",
// // //                               style: TextStyle(
// // //                                 color: Theme.of(context).colorScheme.secondary,
// // //                                 fontSize: 18,
// // //                                 fontWeight: FontWeight.w600,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   SizedBox(height: 24),
// // //                   if (createdFields.isNotEmpty) ...[
// // //                     Text(
// // //                       "Created Fields",
// // //                       style:
// // //                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
// // //                     ),
// // //                     SizedBox(height: 16),
// // //                     Flexible(
// // //                       child: ListView.builder(
// // //                         itemCount: createdFields.length,
// // //                         itemBuilder: (context, index) =>
// // //                             _buildFieldCard(createdFields[index]),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ],
// // //               ),
// // //             ),
// // //           );
// // //         },
// // //       );
// // // }







// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:get/get.dart';
// // import 'package:implementation_panel/BreakPoints/breakpoints.dart';
// // import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
// // import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
// // import 'package:implementation_panel/Screens/Dashboard/custom_appbar.dart';
// // import 'package:responsive_toolkit/responsive_grid.dart';

// // class DynamicFormField {
// //   final String id;
// //   final String label;
// //   final String type;
// //   final bool isRequired;
// //   final List<String>? options;
// //   final Color borderColor;
// //   dynamic value;
// //   String? errorText;

// //   DynamicFormField({
// //     required this.id,
// //     required this.label,
// //     required this.type,
// //     this.isRequired = false,
// //     this.options,
// //     required this.borderColor,
// //     this.value,
// //     this.errorText,
// //   });
  
// //   toJson() {}
// // }

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   _HomeScreenState createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   final controller = Get.put(DynamicController());
// //   final _formKey = GlobalKey<FormState>();
// //   List<DynamicFormField> formFields = [];
// //   Map<String, dynamic> formData = {};
  
// //   final List<String> fieldTypes = [
// //                 'Char',
// //                 'Text',
// //                 'Choice',
// //                 'Integer',
// //                 'DateTime',
// //                 'Date',
// //                 'Time',
// //   ];

// //   final TextEditingController _fieldNameController = TextEditingController();
// //   String selectedFieldType = 'text';
// //   List<String>? _dropdownOptions = [];
// //   Color _selectedBorderColor = Colors.blue;

// //   @override
// //   void dispose() {
// //     _fieldNameController.dispose();
// //     super.dispose();
// //   }

// //   void _showAddFieldDialog() {
// //     _fieldNameController.clear();
// //     _dropdownOptions?.clear();
// //     _selectedBorderColor = Colors.blue;
    
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return StatefulBuilder(
// //           builder: (context, setStateDialog) {
// //             return AlertDialog(
// //               title: const Text('Add New Field'),
// //               content: SingleChildScrollView(
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     TextField(
// //                       controller: _fieldNameController,
// //                       decoration: const InputDecoration(
// //                         labelText: 'Field Name',
// //                         border: OutlineInputBorder(),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 16),
// //                     DropdownButtonFormField<String>(
// //                       value: selectedFieldType,
// //                       decoration: const InputDecoration(
// //                         labelText: 'Field Type',
// //                         border: OutlineInputBorder(),
// //                       ),
// //                       items: fieldTypes.map((type) {
// //                         return DropdownMenuItem(
// //                           value: type,
// //                           child: Text(type.toUpperCase()),
// //                         );
// //                       }).toList(),
// //                       onChanged: (value) {
// //                         setStateDialog(() {
// //                           selectedFieldType = value!;
// //                         });
// //                       },
// //                     ),
// //                     const SizedBox(height: 16),
// //                     // Row(
// //                     //   children: [
// //                     //     const Text('Border Color: '),
// //                     //     const SizedBox(width: 8),
// //                     //     InkWell(
// //                     //       onTap: () {
// //                     //         showDialog(
// //                     //           context: context,
// //                     //           builder: (BuildContext context) {
// //                     //             return AlertDialog(
// //                     //               title: const Text('Pick Border Color'),
// //                     //               content: SingleChildScrollView(
// //                     //                 child: ColorPicker(
// //                     //                 selectedPickerTypeColor: _selectedBorderColor,
// //                     //                   onColorChanged: (Color color) {
// //                     //                     setStateDialog(() {
// //                     //                       _selectedBorderColor = color;
// //                     //                     });
// //                     //                   },
// //                     //                   // pickerAreaHeightPercent: 0.8,
// //                     //                 ),
// //                     //               ),
// //                     //               actions: [
// //                     //                 TextButton(
// //                     //                   onPressed: () => Navigator.pop(context),
// //                     //                   child: const Text('Done'),
// //                     //                 ),
// //                     //               ],
// //                     //             );
// //                     //           },
// //                     //         );
// //                     //       },
// //                     //       child: Container(
// //                     //         width: 40,
// //                     //         height: 40,
// //                     //         decoration: BoxDecoration(
// //                     //           color: _selectedBorderColor,
// //                     //           border: Border.all(color: Colors.grey),
// //                     //           borderRadius: BorderRadius.circular(4),
// //                     //         ),
// //                     //       ),
// //                     //     ),
// //                     //   ],
// //                     // ),
// //                     if (selectedFieldType == 'dropdown') ...[
// //                       const SizedBox(height: 16),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           TextEditingController optionController = TextEditingController();
// //                           showDialog(
// //                             context: context,
// //                             builder: (BuildContext context) {
// //                               return AlertDialog(
// //                                 title: const Text('Add Option'),
// //                                 content: TextField(
// //                                   controller: optionController,
// //                                   decoration: const InputDecoration(
// //                                     labelText: 'Option Text',
// //                                     border: OutlineInputBorder(),
// //                                   ),
// //                                 ),
// //                                 actions: [
// //                                   TextButton(
// //                                     onPressed: () {
// //                                       Navigator.pop(context);
// //                                     },
// //                                     child: const Text('Cancel'),
// //                                   ),
// //                                   ElevatedButton(
// //                                     onPressed: () {
// //                                       if (optionController.text.isNotEmpty) {
// //                                         setStateDialog(() {
// //                                           _dropdownOptions ??= [];
// //                                           _dropdownOptions!.add(optionController.text);
// //                                         });
// //                                         Navigator.pop(context);
// //                                       }
// //                                     },
// //                                     child: const Text('Add'),
// //                                   ),
// //                                 ],
// //                               );
// //                             },
// //                           );
// //                         },
// //                         child: const Text('Add Dropdown Option'),
// //                       ),
// //                       if (_dropdownOptions != null && _dropdownOptions!.isNotEmpty)
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: _dropdownOptions!.map((option) {
// //                             return Chip(
// //                               label: Text(option),
// //                               onDeleted: () {
// //                                 setStateDialog(() {
// //                                   _dropdownOptions!.remove(option);
// //                                 });
// //                               },
// //                             );
// //                           }).toList(),
// //                         ),
// //                     ],
// //                   ],
// //                 ),
// //               ),


// //               actions: [
// //                 TextButton(
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                   },
// //                   child: const Text('Cancel'),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     if (_fieldNameController.text.isNotEmpty) {
// //                       _addNewField(
// //                         _fieldNameController.text,
// //                         selectedFieldType,
// //                         _dropdownOptions,
// //                         _selectedBorderColor,
// //                       );
// //                       Navigator.pop(context);
// //                     }
// //                   },
// //                   child: const Text('Add Field'),
// //                 ),
// //               ],
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }

// //   void _addNewField(String fieldName, String fieldType, List<String>? options, Color borderColor) {
// //     setState(() {
// //       formFields.add(
// //         DynamicFormField(
// //           id: 'field_${formFields.length}',
// //           label: fieldName,
// //           type: fieldType,
// //           options: options,
// //           isRequired: true,
// //           borderColor: borderColor,
// //         ),
// //       );
// //     });
// //   }

// //   Widget _buildDynamicField(DynamicFormField field) {
// //     InputDecoration getDecoration() {
// //       return InputDecoration(
// //         labelText: field.label,
// //         border: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(8),
// //           borderSide: BorderSide(color: field.borderColor, width: 2),
// //         ),
// //         enabledBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(8),
// //           borderSide: BorderSide(color: field.borderColor),
// //         ),
// //         focusedBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(8),
// //           borderSide: BorderSide(color: field.borderColor, width: 2),
// //         ),
// //       );
// //     }

// //     switch (field.type) {
// //       case 'text':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           validator: (value) {
// //             if (field.isRequired && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             formData[field.id] = value;
// //           },
// //         );

// //       case 'email':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           keyboardType: TextInputType.emailAddress,
// //           validator: (value) {
// //             if (field.isRequired && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             if (value != null && value.isNotEmpty && !value.contains('@')) {
// //               return 'Please enter a valid email';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             formData[field.id] = value;
// //           },
// //         );

// //       case 'phone':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
// //           maxLength: 10,
// //           keyboardType: TextInputType.phone,
// //           validator: (value) {
// //             if (field.isRequired && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             formData[field.id] = value;
// //           },
// //         );

// //       case 'number':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           keyboardType: TextInputType.number,
// //           validator: (value) {
// //             if (field.isRequired && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             if (value != null && value.isNotEmpty) {
// //               final number = num.tryParse(value);
// //               if (number == null) {
// //                 return 'Please enter a valid number';
// //               }
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             formData[field.id] = num.tryParse(value);
// //           },
// //         );

// //       case 'dropdown':
// //         return DropdownButtonFormField<String>(
// //           decoration: getDecoration(),
// //           value: field.value,
// //           items: field.options?.map((option) {
// //             return DropdownMenuItem(
// //               value: option,
// //               child: Text(option),
// //             );
// //           }).toList(),
// //           validator: (value) {
// //             if (field.isRequired && value == null) {
// //               return '${field.label} is required';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             setState(() {
// //               field.value = value;
// //               formData[field.id] = value;
// //             });
// //           },
// //         );

// //       case 'date':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           readOnly: true,
// //           onTap: () async {
// //             final DateTime? picked = await showDatePicker(
// //               context: context,
// //               initialDate: DateTime.now(),
// //               firstDate: DateTime(1900),
// //               lastDate: DateTime(2100),
// //             );
// //             if (picked != null) {
// //               setState(() {
// //                 field.value = picked.toString().split(' ')[0];
// //                 formData[field.id] = field.value;
// //               });
// //             }
// //           },
// //           controller: TextEditingController(text: field.value),
// //           validator: (value) {
// //             if (field.isRequired && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             return null;
// //           },
// //         );

// //       default:
// //         return Container();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return CommonScaffoldWithAppBar(
// //       // appBar: AppBar(
// //       //   title: const Text('Dynamic Form'),
// //       // ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             children: [
// //               ResponsiveRow(
// //                     runSpacing: 10,
// //                     spacing: 20,
// //                     columns: [
// //                       ResponsiveColumn(
// //                         ResponsiveConstants().searchBreakPoint,
// //                         child: CommonComponents.defaultTextField(
// //                           context,
// //                           title: 'App Label',
// //                           hintText: 'Enter App Label',
// //                           controller: controller.appLabel,
// //                           validator: (String? val) {
// //                             if (val == '') {
// //                               return 'Please enter a valid App Label';
// //                             }
// //                             return null;
// //                           },
// //                           keyboardType: TextInputType.text,
// //                           textInputAction: TextInputAction.next,
// //                           onChange: (val) {},
// //                         ),
// //                       ),
// //                       ResponsiveColumn(
// //                         ResponsiveConstants().searchBreakPoint,
// //                         child: CommonComponents.defaultTextField(
// //                           context,
// //                           title: 'Model Name',
// //                           hintText: 'Enter Model Name',
// //                           controller: controller.modelName,
// //                           validator: (String? val) {
// //                             if (val == '') {
// //                               return 'Please enter a valid Model Name';
// //                             }
// //                             return null;
// //                           },
// //                           keyboardType: TextInputType.text,
// //                           textInputAction: TextInputAction.next,
// //                           onChange: (val) {},
// //                         ),
// //                       ),
// //                       ResponsiveColumn(
// //                         ResponsiveConstants().buttonBreakpoints,
// //                         child: Padding(
// //                           padding: const EdgeInsets.only(
// //                               top: 12, right: 12, bottom: 12),
// //                           child: MaterialButton(
// //                             minWidth: 85,
// //                             height: 35,
// //                             elevation: 0.0,
// //                             shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(10)),
// //                             color: Theme.of(context).colorScheme.primary,
// //                             highlightColor:
// //                                 Theme.of(context).colorScheme.primary,
// //                             onPressed: _showAddFieldDialog,
// //                             child: Text(
// //                               "Add Fields",
// //                               style: TextStyle(
// //                                 color: Theme.of(context).colorScheme.secondary,
// //                                 fontSize: 18,
// //                                 fontWeight: FontWeight.w600,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //               // ...formFields.map((field) => Padding(
// //               //   padding: const EdgeInsets.symmetric(vertical: 8),
// //               //   child: Row(
// //               //     children: [
// //               //       Expanded(child: _buildDynamicField(field)),
// //               //       IconButton(
// //               //         icon: const Icon(Icons.delete),
// //               //         onPressed: () {
// //               //           setState(() {
// //               //             formFields.remove(field);
// //               //             formData.remove(field.id);
// //               //           });
// //               //         },
// //               //       ),
// //               //     ],
// //               //   ),
// //               // )),
// //               const SizedBox(height: 20),
// //               // if (formFields.isNotEmpty)
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     if (_formKey.currentState!.validate()) {
// //                       print('Form Data: $formData');
// //                       controller.createDynamicData();
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         const SnackBar(content: Text('Form submitted successfully!')),
// //                       );
// //                     }
// //                   },
// //                   child: const Text('Submit'),
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       // floatingActionButton: FloatingActionButton(
// //       //   onPressed: _showAddFieldDialog,
// //       //   tooltip: 'Add Field',
// //       //   child: const Icon(Icons.add),
// //       // ),
// //     );
// //   }
// // }









// /////////////////////////////////////////////////////////////////////////////
// ///
// ///
// ///
// ///
// ///
// ///
// ///// class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   HomeScreenState createState() => HomeScreenState();
// // }

// // class HomeScreenState extends State<HomeScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   List<DynamicFormField> formFields = [];
// //   Map<String, dynamic> formData = {};
  
// //   final List<String> fieldTypes = [
// //     'Char',
// //     'Text',
// //     'Choice',
// //     'Integer',
// //     'DateTime',
// //     'Date',
// //     'Time',
// //   ];

// //   final TextEditingController _fieldNameController = TextEditingController();
// //   final TextEditingController _maxLengthController = TextEditingController();
// //   final TextEditingController _minLengthController = TextEditingController();
// //   final TextEditingController _defaultValueController = TextEditingController();
// //   final TextEditingController _formatController = TextEditingController();
  
// //   String selectedFieldType = 'Char';
// //   List<Map<dynamic, String>> _choices = [];
// //   bool _isRequired = false;
// //   bool _readOnly = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeFormFields();
// //   }

// //   void _initializeFormFields() {
// //     final Map<String, Map<String, dynamic>> formConfig = {
// //       'name': {'type': 'Char', 'required': false, 'max_length': 100, 'min_length': 1},
// //       'description': {'type': 'Text', 'required': false, 'max_length': 1000, 'min_length': 5},
// //       'gender': {
// //         'type': 'Choice',
// //         'required': false,
// //         'default': 1,
// //         'choices': [[1, 'Male'], [2, 'Female'], [3, 'Others']]
// //       },
// //       'age': {'type': 'Integer', 'required': false, 'default': 0},
// //       'datetime': {
// //         'type': 'DateTime',
// //         'required': false,
// //         'format': '%d-%m-%Y %I:%M %p',
// //         'input_formats': ['%d-%m-%Y %I:%M %p'],
// //         'read_only': true
// //       },
// //       'date': {
// //         'type': 'Date',
// //         'required': false,
// //         'format': '%d-%m-%Y',
// //         'input_formats': ['%d-%m-%Y'],
// //         'read_only': true
// //       },
// //       'time': {
// //         'type': 'Time',
// //         'required': false,
// //         'format': '%I:%M %p',
// //         'input_formats': ['%I:%M %p'],
// //         'read_only': true
// //       },
// //     };

// //     setState(() {
// //       formFields = formConfig.entries.map((entry) {
// //         final key = entry.key;
// //         final value = entry.value;
// //         return DynamicFormField(
// //           id: key,
// //           label: key.replaceFirst(key[0], key[0].toUpperCase()),
// //           type: value['type'],
// //           isRequired: value['required'] ?? false,
// //           maxLength: value['max_length'],
// //           minLength: value['min_length'],
// //           choices: value['type'] == 'Choice'
// //               ? (value['choices'] as List).map((choice) => {
// //                     choice[0]: choice[1].toString(),
// //                   }).toList()
// //               : null,
// //           format: value['format'],
// //           inputFormats: value['input_formats']?.cast<String>(),
// //           readOnly: value['read_only'],
// //           defaultValue: value['default'],
// //         );
// //       }).toList();
// //     });
// //   }

// //   void _resetDialogControllers() {
// //     _fieldNameController.clear();
// //     _maxLengthController.clear();
// //     _minLengthController.clear();
// //     _defaultValueController.clear();
// //     _formatController.clear();
// //     _choices = [];
// //     _isRequired = false;
// //     _readOnly = false;
// //     selectedFieldType = 'Char';
// //   }

// //   Widget _buildFieldTypeSpecificInputs(StateSetter setStateDialog) {
// //     switch (selectedFieldType) {
// //       case 'Char':
// //       case 'Text':
// //         return Column(
// //           children: [
// //             const SizedBox(height: 16),
// //             TextField(
// //               controller: _maxLengthController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Max Length',
// //                 border: OutlineInputBorder(),
// //                 hintText: 'Enter maximum length',
// //               ),
// //               keyboardType: TextInputType.number,
// //               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //             ),
// //             const SizedBox(height: 16),
// //             TextField(
// //               controller: _minLengthController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Min Length',
// //                 border: OutlineInputBorder(),
// //                 hintText: 'Enter minimum length',
// //               ),
// //               keyboardType: TextInputType.number,
// //               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //             ),
// //           ],
// //         );

// //       case 'Choice':
// //         return Column(
// //           children: [
// //             const SizedBox(height: 16),
// //             TextField(
// //               controller: _defaultValueController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Default Value',
// //                 border: OutlineInputBorder(),
// //                 hintText: 'Enter default value',
// //               ),
// //               keyboardType: TextInputType.number,
// //             ),
// //             const SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: () => _showAddChoiceDialog(setStateDialog),
// //               child: const Text('Add Choice'),
// //             ),
// //             const SizedBox(height: 8),
// //             Wrap(
// //               spacing: 8,
// //               children: _choices.map((choice) {
// //                 return Chip(
// //                   label: Text(choice.values.first),
// //                   onDeleted: () {
// //                     setStateDialog(() {
// //                       _choices.remove(choice);
// //                     });
// //                   },
// //                 );
// //               }).toList(),
// //             ),
// //           ],
// //         );

// //       case 'Integer':
// //         return Column(
// //           children: [
// //             const SizedBox(height: 16),
// //             TextField(
// //               controller: _defaultValueController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Default Value',
// //                 border: OutlineInputBorder(),
// //                 hintText: 'Enter default value',
// //               ),
// //               keyboardType: TextInputType.number,
// //               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //             ),
// //           ],
// //         );

// //       case 'DateTime':
// //       case 'Date':
// //       case 'Time':
// //         return Column(
// //           children: [
// //             const SizedBox(height: 16),
// //             TextField(
// //               controller: _formatController,
// //               decoration: InputDecoration(
// //                 labelText: 'Format',
// //                 border: const OutlineInputBorder(),
// //                 hintText: selectedFieldType == 'DateTime'
// //                     ? '%d-%m-%Y %I:%M %p'
// //                     : selectedFieldType == 'Date'
// //                         ? '%d-%m-%Y'
// //                         : '%I:%M %p',
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             SwitchListTile(
// //               title: const Text('Read Only'),
// //               value: _readOnly,
// //               onChanged: (value) {
// //                 setStateDialog(() {
// //                   _readOnly = value;
// //                 });
// //               },
// //             ),
// //           ],
// //         );

// //       default:
// //         return const SizedBox.shrink();
// //     }
// //   }

// //   void _showAddChoiceDialog(StateSetter setStateDialog) {
// //     final valueController = TextEditingController();
// //     final labelController = TextEditingController();

// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text('Add Choice'),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               TextField(
// //                 controller: valueController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Choice Value',
// //                   border: OutlineInputBorder(),
// //                   hintText: 'Enter numeric value',
// //                 ),
// //                 keyboardType: TextInputType.number,
// //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //               ),
// //               const SizedBox(height: 16),
// //               TextField(
// //                 controller: labelController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Choice Label',
// //                   border: OutlineInputBorder(),
// //                   hintText: 'Enter label text',
// //                 ),
// //               ),
// //             ],
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: const Text('Cancel'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 if (valueController.text.isNotEmpty && labelController.text.isNotEmpty) {
// //                   setStateDialog(() {
// //                     _choices.add({int.parse(valueController.text): labelController.text});
// //                   });
// //                   Navigator.pop(context);
// //                 }
// //               },
// //               child: const Text('Add'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   void _showAddFieldDialog() {
// //     _resetDialogControllers();
    
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return StatefulBuilder(
// //           builder: (context, setStateDialog) {
// //             return AlertDialog(
// //               title: const Text('Add New Field'),
// //               content: SingleChildScrollView(
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     TextField(
// //                       controller: _fieldNameController,
// //                       decoration: const InputDecoration(
// //                         labelText: 'Field Name',
// //                         border: OutlineInputBorder(),
// //                         hintText: 'Enter field name',
// //                       ),
// //                     ),
// //                     const SizedBox(height: 16),
// //                     DropdownButtonFormField<String>(
// //                       value: selectedFieldType,
// //                       decoration: const InputDecoration(
// //                         labelText: 'Field Type',
// //                         border: OutlineInputBorder(),
// //                       ),
// //                       items: fieldTypes.map((type) {
// //                         return DropdownMenuItem(
// //                           value: type,
// //                           child: Text(type),
// //                         );
// //                       }).toList(),
// //                       onChanged: (value) {
// //                         setStateDialog(() {
// //                           selectedFieldType = value!;
// //                         });
// //                       },
// //                     ),
// //                     const SizedBox(height: 16),
// //                     SwitchListTile(
// //                       title: const Text('Required'),
// //                       value: _isRequired,
// //                       onChanged: (value) {
// //                         setStateDialog(() {
// //                           _isRequired = value;
// //                         });
// //                       },
// //                     ),
// //                     _buildFieldTypeSpecificInputs(setStateDialog),
// //                   ],
// //                 ),
// //               ),
// //               actions: [
// //                 TextButton(
// //                   onPressed: () => Navigator.pop(context),
// //                   child: const Text('Cancel'),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     if (_fieldNameController.text.isNotEmpty) {
// //                       setState(() {
// //                         formFields.add(DynamicFormField(
// //                           id: _fieldNameController.text.toLowerCase(),
// //                           label: _fieldNameController.text,
// //                           type: selectedFieldType,
// //                           isRequired: _isRequired,
// //                           maxLength: int.tryParse(_maxLengthController.text),
// //                           minLength: int.tryParse(_minLengthController.text),
// //                           choices: _choices.isNotEmpty ? _choices : null,
// //                           format: _formatController.text.isNotEmpty
// //                               ? _formatController.text
// //                               : null,
// //                           readOnly: _readOnly,
// //                           defaultValue: _defaultValueController.text.isNotEmpty
// //                               ? int.tryParse(_defaultValueController.text)
// //                               : null,
// //                         ));
// //                       });
// //                       Navigator.pop(context);
// //                     }
// //                   },
// //                   child: const Text('Add Field'),
// //                 ),
// //               ],
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }

// //   Widget _buildDynamicField(DynamicFormField field) {
// //     InputDecoration getDecoration() {
// //       return InputDecoration(
// //         labelText: field.label,
// //         border: const OutlineInputBorder(),
// //         errorText: field.errorText,
// //       );
// //     }

// //     switch (field.type) {
// //       case 'Char':
// //       case 'Text':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           maxLength: field.maxLength,
// //           maxLines: field.type == 'Text' ? 3 : 1,
// //           initialValue: field.value,
// //           validator: (value) {
// //             if (field.isRequired && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             if (value != null) {
// //               if (field.minLength != null && value.length < field.minLength!) {
// //                 return 'Minimum length is ${field.minLength}';
// //               }
// //               if (field.maxLength != null && value.length > field.maxLength!) {
// //                 return 'Maximum length is ${field.maxLength}';
// //               }
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             formData[field.id] = value;
// //           },
// //         );

// //       case 'Choice':
// //         return DropdownButtonFormField<dynamic>(
// //           decoration: getDecoration(),
// //           value: field.value ?? field.defaultValue,
// //           items: field.choices?.map((choice) {
// //             return DropdownMenuItem(
// //               value: choice.keys.first,
// //               child: Text(choice.values.first),
// //             );
// //           }).toList(),
// //           validator: (value) {
// //             if (field.isRequired && value == null) {
// //               return '${field.label} is required';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             setState(() {
// //               field.value = value;
// //               formData[field.id] = value;
// //             });
// //           },
// //         );

// //       case 'Integer':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           keyboardType: TextInputType.number,
// //           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //           initialValue: field.value?.toString() ?? field.defaultValue?.toString(),
// //           validator: (value) {
// //             if (field.isRequired && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// // return null;
// //           },
// //           onChanged: (value) {
// //             formData[field.id] = int.tryParse(value);
// //           },
// //         );

// //       case 'DateTime':
// //       case 'Date':
// //       case 'Time':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           readOnly: field.readOnly ?? false,
// //           controller: TextEditingController(text: field.value),
// //           onTap: () async {
// //             if (field.readOnly ?? false) return;

// //             if (field.type == 'Date' || field.type == 'DateTime') {
// //               final DateTime? picked = await showDatePicker(
// //                 context: context,
// //                 initialDate: DateTime.now(),
// //                 firstDate: DateTime(1900),
// //                 lastDate: DateTime(2100),
// //               );
              
// //               if (picked != null) {
// //                 if (field.type == 'DateTime') {
// //                   final TimeOfDay? time = await showTimePicker(
// //                     context: context,
// //                     initialTime: TimeOfDay.now(),
// //                   );
                  
// //                   if (time != null) {
// //                     setState(() {
// //                       final DateTime dateTime = DateTime(
// //                         picked.year,
// //                         picked.month,
// //                         picked.day,
// //                         time.hour,
// //                         time.minute,
// //                       );
// //                       field.value = DateFormat(field.format ?? 'dd-MM-yyyy HH:mm').format(dateTime);
// //                       formData[field.id] = field.value;
// //                     });
// //                   }
// //                 } else {
// //                   setState(() {
// //                     field.value = DateFormat(field.format ?? 'dd-MM-yyyy').format(picked);
// //                     formData[field.id] = field.value;
// //                   });
// //                 }
// //               }
// //             } else if (field.type == 'Time') {
// //               final TimeOfDay? time = await showTimePicker(
// //                 context: context,
// //                 initialTime: TimeOfDay.now(),
// //               );
              
// //               if (time != null) {
// //                 setState(() {
// //                   final now = DateTime.now();
// //                   final DateTime dateTime = DateTime(
// //                     now.year,
// //                     now.month,
// //                     now.day,
// //                     time.hour,
// //                     time.minute,
// //                   );
// //                   field.value = DateFormat(field.format ?? 'hh:mm a').format(dateTime);
// //                   formData[field.id] = field.value;
// //                 });
// //               }
// //             }
// //           },
// //           validator: (value) {
// //             if (field.isRequired && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             return null;
// //           },
// //         );

// //       default:
// //         return Container();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         // title: const Text('Dynamic Form'),
// //       ),
// //       body: SafeArea(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Form(
// //             key: _formKey,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       'Form Fields',
// //                       style: Theme.of(context).textTheme.headlineSmall,
// //                     ),
// //                     ElevatedButton.icon(
// //                       onPressed: _showAddFieldDialog,
// //                       icon: const Icon(Icons.add),
// //                       label: const Text('Add Field'),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 16),
// //                 Expanded(
// //                   child: ListView.builder(
// //                     itemCount: formFields.length,
// //                     itemBuilder: (context, index) {
// //                       return Padding(
// //                         padding: const EdgeInsets.only(bottom: 16.0),
// //                         child: _buildDynamicField(formFields[index]),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     if (_formKey.currentState?.validate() ?? false) {
// //                       // Print form data for debugging
// //                       print('Form Data: $formData');
                      
// //                       // Show success message
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         const SnackBar(
// //                           content: Text('Form submitted successfully!'),
// //                           backgroundColor: Colors.green,
// //                         ),
// //                       );
// //                     }
// //                   },
// //                   child: const Padding(
// //                     padding: EdgeInsets.symmetric(vertical: 16.0),
// //                     child: Text(
// //                       'Submit',
// //                       style: TextStyle(fontSize: 16),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _fieldNameController.dispose();
// //     _maxLengthController.dispose();
// //     _minLengthController.dispose();
// //     _defaultValueController.dispose();
// //     _formatController.dispose();
// //     super.dispose();
// //   }
// // }






// /////////////////////////////////////////////////////////////////////////////




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/BreakPoints/breakpoints.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
import 'package:implementation_panel/Screens/Dashboard/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class DynamicFormField {
  final String id;
  final String label;
  final String type;
  final bool isRequired;
  final List<Map<dynamic, String>>? choices;
  final int? maxLength;
  final int? minLength;
  final String? format;
  final List<String>? inputFormats;
  final bool? readOnly;
  final dynamic defaultValue;
  dynamic value;
  String? errorText;

  DynamicFormField({
    required this.id,
    required this.label,
    required this.type,
    this.isRequired = false,
    this.choices,
    this.maxLength,
    this.minLength,
    this.format,
    this.inputFormats,
    this.readOnly,
    this.defaultValue,
    this.value,
    this.errorText,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(DynamicController());
  List<DynamicFormField> formFields = [];
  Map<String, dynamic> formData = {};

  final List<String> fieldTypes = [
    'Char',
    'Text',
    'Choice',
    'Integer',
    'DateTime',
    'Date',
    'Time',
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create Data',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  ElevatedButton.icon(
                    onPressed: _showFieldListDialog,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Fields'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ResponsiveRow(
                runSpacing: 10,
                spacing: 20,
                columns: [
                  ResponsiveColumn(
                    ResponsiveConstants().searchBreakPoint,
                    child: CommonComponents.defaultTextField(
                      context,
                      title: 'App Label',
                      hintText: 'Enter App Label',
                      controller: controller.appLabel,
                      validator: (String? val) {
                        if (val == '') {
                          return 'Please enter a valid App Label';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onChange: (val) {},
                    ),
                  ),
                  ResponsiveColumn(
                    ResponsiveConstants().searchBreakPoint,
                    child: CommonComponents.defaultTextField(
                      context,
                      title: 'Model Name',
                      hintText: 'Enter Model Name',
                      controller: controller.modelName,
                      validator: (String? val) {
                        if (val == '') {
                          return 'Please enter a valid Model Name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onChange: (val) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (formFields.isNotEmpty) ...[
                Text(
                  'Added Fields',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: formFields.length,
                    itemBuilder: (context, index) {
                      final field = formFields[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(field.label),
                          subtitle: Text('Type: ${field.type}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                formFields.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
              const SizedBox(height: 20),
                if(formFields.isNotEmpty)...[
ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Handle form submission
                    final formConfig = {
                      'app_label': controller.appLabel.text,
                      'model_name': controller.modelName.text,
                      'fields': formFields.map((field) => {
                        'id': field.id,
                        'label': field.label,
                        'type': field.type,
                        'required': field.isRequired,
                        'max_length': field.maxLength,
                        'min_length': field.minLength,
                        'choices': field.choices,
                        'format': field.format,
                        'read_only': field.readOnly,
                        // 'default_value': field.defaultValue,
                      }).toList(),
                    };
                    print('Form Data: $formConfig');
                  }
                },
                // if(formFields.isNotEmpty)...[]
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Save Data'),
                ),
              ),
                ]

              
            ],
          ),
        ),
      ),
    );
  }

  void _showFieldListDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DynamicFieldDialog(
          onFieldsAdded: (List<DynamicFormField> newFields) {
            setState(() {
              formFields.addAll(newFields);
            });
          },
        );
      },
    );
  }


  @override
  void dispose() {
    controller.appLabel.dispose();
    controller.modelName.dispose();
    super.dispose();
  }
}

class DynamicFieldDialog extends StatefulWidget {
  final Function(List<DynamicFormField>) onFieldsAdded;

  const DynamicFieldDialog({
    Key? key,
    required this.onFieldsAdded,
  }) : super(key: key);

  @override
  _DynamicFieldDialogState createState() => _DynamicFieldDialogState();
}

class _DynamicFieldDialogState extends State<DynamicFieldDialog> {
  final List<DynamicFormField> _fields = [];
  final TextEditingController _fieldNameController = TextEditingController();
  final TextEditingController _maxLengthController = TextEditingController();
  final TextEditingController _minLengthController = TextEditingController();
  final TextEditingController _defaultValueController = TextEditingController();
  final TextEditingController _formatController = TextEditingController();
  String selectedFieldType = 'Char';
  List<Map<dynamic, String>> _choices = [];
  bool _isRequired = false;
  bool _readOnly = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Fields'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _fieldNameController,
              decoration: const InputDecoration(
                labelText: 'Field Name',
                hintText: 'Enter field name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedFieldType,
              decoration: const InputDecoration(
                labelText: 'Field Type',
                border: OutlineInputBorder(),
              ),
              items: [
                'Char',
                'Text',
                'Choice',
                'Integer',
                'DateTime',
                'Date',
                'Time',
              ].map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFieldType = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('Required'),
              value: _isRequired,
              onChanged: (value) {
                setState(() {
                  _isRequired = value ?? false;
                });
              },
            ),
            _buildFieldTypeSpecificInputs(),
            const SizedBox(height: 16),
            if (_fields.isNotEmpty) ...[
              const Divider(),
              Text(
                'Added Fields',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ...List.generate(_fields.length, (index) {
                final field = _fields[index];
                return ListTile(
                  title: Text(field.label),
                  subtitle: Text('Type: ${field.type}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _fields.removeAt(index);
                      });
                    },
                  ),
                );
              }),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            _addField();
          },
          child: const Text('Add Field'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onFieldsAdded(_fields);
            Navigator.pop(context);
          },
          child: const Text('Save Fields'),
        ),
      ],
    );
  }

  Widget _buildFieldTypeSpecificInputs() {
    // This remains the same as in your previous implementation
    // Add the specific input fields based on the selected field type
    switch (selectedFieldType) {
      case 'Char':
      case 'Text':
        return Column(
          children: [
            TextField(
              controller: _maxLengthController,
              decoration: const InputDecoration(
                labelText: 'Max Length',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _minLengthController,
              decoration: const InputDecoration(
                labelText: 'Min Length',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        );
      // Add other cases for different field types
      default:
        return Container();
    }
  }

  void _addField() {
    if (_fieldNameController.text.isNotEmpty) {
      setState(() {
        _fields.add(DynamicFormField(
          id: _fieldNameController.text.toLowerCase(),
          label: _fieldNameController.text,
          type: selectedFieldType,
          isRequired: _isRequired,
          maxLength: int.tryParse(_maxLengthController.text),
          minLength: int.tryParse(_minLengthController.text),
          choices: _choices.isNotEmpty ? _choices : null,
          format: _formatController.text.isNotEmpty ? _formatController.text : null,
          readOnly: _readOnly,
          defaultValue: _defaultValueController.text.isNotEmpty
              ? int.tryParse(_defaultValueController.text)
              : null,
        ));
        
        // Clear the input fields
        _fieldNameController.clear();
        _maxLengthController.clear();
        _minLengthController.clear();
        _defaultValueController.clear();
        _formatController.clear();
        _choices = [];
        _isRequired = false;
        _readOnly = false;
        selectedFieldType = 'Char';
      });
    }
  }

  @override
  void dispose() {
    _fieldNameController.dispose();
    _maxLengthController.dispose();
    _minLengthController.dispose();
    _defaultValueController.dispose();
    _formatController.dispose();
    super.dispose();
  }
}




// // import 'package:flutter/material.dart';

// // class DynamicFormField {
// //   final String id;
// //   final String label;
// //   final String type;
// //   final bool isRequired;
// //   final List<Map<dynamic, String>>? choices;
// //   final int? maxLength;
// //   final int? minLength;
// //   final String? format;
// //   final List<String>? inputFormats;
// //   final bool? readOnly;
// //   final dynamic defaultValue;
// //   dynamic value;
// //   String? errorText;

// //   DynamicFormField({
// //     required this.id,
// //     required this.label,
// //     required this.type,
// //     this.isRequired = false,
// //     this.choices,
// //     this.maxLength,
// //     this.minLength,
// //     this.format,
// //     this.inputFormats,
// //     this.readOnly,
// //     this.defaultValue,
// //     this.value,
// //     this.errorText,
// //   });
// // }

// // class HomeScreen extends StatefulWidget {
// //   @override
// //   _HomeScreenState createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   List<DynamicFormField> formFields = [];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Dynamic Form"),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             children: [
// //               ElevatedButton(
// //                 onPressed: _showFieldDialog,
// //                 child: const Text("Add Field"),
// //               ),
// //               const SizedBox(height: 20),
// //               Expanded(
// //                 child: ListView.builder(
// //                   itemCount: formFields.length,
// //                   itemBuilder: (context, index) {
// //                     final field = formFields[index];
// //                     return _buildField(field);
// //                   },
// //                 ),
// //               ),
// //               ElevatedButton(
// //                 onPressed: _saveData,
// //                 child: const Text("Save Data"),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildField(DynamicFormField field) {
// //     switch (field.type) {
// //       case 'Char':
// //       case 'Text':
// //         return Padding(
// //           padding: const EdgeInsets.only(bottom: 16.0),
// //           child: TextFormField(
// //             decoration: InputDecoration(
// //               labelText: field.label,
// //               border: const OutlineInputBorder(),
// //             ),
// //             maxLength: field.maxLength,
// //             // validator: (value) {
// //             //   if (field.isRequired && (value == null || value.isEmpty)) {
// //             //     return "${field.label} is required.";
// //             //   }
// //             //   return null;
// //             // },
// //             onChanged: (value) {
// //               field.value = value;
// //             },
// //           ),
// //         );
// //       case 'Choice':
// //         return Padding(
// //           padding: const EdgeInsets.only(bottom: 16.0),
// //           child: DropdownButtonFormField(
// //             decoration: InputDecoration(
// //               labelText: field.label,
// //               border: const OutlineInputBorder(),
// //             ),
// //             items: field.choices
// //                 ?.map((choice) => DropdownMenuItem(
// //                       value: choice.keys.first,
// //                       child: Text(choice.values.first),
// //                     ))
// //                 .toList(),
// //             onChanged: (value) {
// //               field.value = value;
// //             },
// //           ),
// //         );
// //       case 'Integer':
// //         return Padding(
// //           padding: const EdgeInsets.only(bottom: 16.0),
// //           child: TextFormField(
// //             decoration: InputDecoration(
// //               labelText: field.label,
// //               border: const OutlineInputBorder(),
// //             ),
// //             keyboardType: TextInputType.number,
// //             validator: (value) {
// //               if (field.isRequired && (value == null || value.isEmpty)) {
// //                 return "${field.label} is required.";
// //               }
// //               return null;
// //             },
// //             onChanged: (value) {
// //               field.value = int.tryParse(value ?? '');
// //             },
// //           ),
// //         );
// //       case 'DateTime':
// //       case 'Date':
// //       case 'Time':
// //         return Padding(
// //           padding: const EdgeInsets.only(bottom: 16.0),
// //           child: TextFormField(
// //             decoration: InputDecoration(
// //               labelText: field.label,
// //               hintText: field.format,
// //               border: const OutlineInputBorder(),
// //             ),
// //             readOnly: field.readOnly ?? false,
// //             onChanged: (value) {
// //               field.value = value;
// //             },
// //           ),
// //         );
// //       default:
// //         return const SizedBox.shrink();
// //     }
// //   }

// //   void _showFieldDialog() {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return FieldDialog(
// //           onFieldAdded: (DynamicFormField newField) {
// //             setState(() {
// //               formFields.add(newField);
// //             });
// //           },
// //         );
// //       },
// //     );
// //   }

// //   void _saveData() {
// //     if (_formKey.currentState?.validate() ?? false) {
// //       final formData = {
// //         "fields": formFields.map((field) {
// //           return {
// //             "id": field.id,
// //             "label": field.label,
// //             "type": field.type,
// //             // "value": field.value,
// //           };
// //         }).toList(),
// //       };
// //       print("Form Data: $formData");
// //     }
// //   }
// // }

// // class FieldDialog extends StatefulWidget {
// //   final Function(DynamicFormField) onFieldAdded;

// //   const FieldDialog({required this.onFieldAdded});

// //   @override
// //   _FieldDialogState createState() => _FieldDialogState();
// // }

// // class _FieldDialogState extends State<FieldDialog> {
// //   final TextEditingController _fieldNameController = TextEditingController();
// //   String selectedFieldType = 'Char';
// //   final TextEditingController _maxLengthController = TextEditingController();
// //   final TextEditingController _minLengthController = TextEditingController();
// //   bool _isRequired = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return AlertDialog(
// //       title: const Text("Add Field"),
// //       content: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           TextField(
// //             controller: _fieldNameController,
// //             decoration: const InputDecoration(
// //               labelText: "Field Name",
// //               border: OutlineInputBorder(),
// //             ),
// //           ),
// //           const SizedBox(height: 10),
// //           DropdownButtonFormField<String>(
// //             value: selectedFieldType,
// //             items: ['Char', 'Text', 'Choice', 'Integer', 'DateTime', 'Date', 'Time']
// //                 .map((type) => DropdownMenuItem(value: type, child: Text(type)))
// //                 .toList(),
// //             onChanged: (value) {
// //               setState(() {
// //                 selectedFieldType = value!;
// //               });
// //             },
// //             decoration: const InputDecoration(
// //               labelText: "Field Type",
// //               border: OutlineInputBorder(),
// //             ),
// //           ),
// //           const SizedBox(height: 10),
// //           TextField(
// //             controller: _maxLengthController,
// //             decoration: const InputDecoration(
// //               labelText: "Max Length (Optional)",
// //               border: OutlineInputBorder(),
// //             ),
// //             keyboardType: TextInputType.number,
// //           ),
// //           const SizedBox(height: 10),
// //           TextField(
// //             controller: _minLengthController,
// //             decoration: const InputDecoration(
// //               labelText: "Min Length (Optional)",
// //               border: OutlineInputBorder(),
// //             ),
// //             keyboardType: TextInputType.number,
// //           ),
// //           const SizedBox(height: 10),
// //           CheckboxListTile(
// //             title: const Text("Required"),
// //             value: _isRequired,
// //             onChanged: (value) {
// //               setState(() {
// //                 _isRequired = value ?? false;
// //               });
// //             },
// //           ),
// //         ],
// //       ),
// //       actions: [
// //         TextButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           child: const Text("Cancel"),
// //         ),
// //         ElevatedButton(
// //           onPressed: () {
// //             final field = DynamicFormField(
// //               id: _fieldNameController.text.trim().toLowerCase(),
// //               label: _fieldNameController.text.trim(),
// //               type: selectedFieldType,
// //               isRequired: _isRequired,
// //               maxLength: int.tryParse(_maxLengthController.text),
// //               minLength: int.tryParse(_minLengthController.text),
// //             );
// //             widget.onFieldAdded(field);
// //             Navigator.pop(context);
// //           },
// //           child: const Text("Add"),
// //         ),
// //       ],
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _fieldNameController.dispose();
// //     _maxLengthController.dispose();
// //     _minLengthController.dispose();
// //     super.dispose();
// //   }
// // }






// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';

// // class DynamicFieldConfig {
// //   final String id;
// //   final String label;
// //   final String type;
// //   final bool required;
// //   final List<Map<String, dynamic>>? options;
// //   final Color borderColor;
// //   final int? maxLength;
// //   final int? minLength;
// //   dynamic value;
// //   String? errorText;

// //   DynamicFieldConfig({
// //     required this.id,
// //     required this.label,
// //     required this.type,
// //     this.required = false,
// //     this.options,
// //     required this.borderColor,
// //     this.maxLength,
// //     this.minLength,
// //     this.value,
// //     this.errorText,
// //   });

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'label': label,
// //       'type': type,
// //       'required': required,
// //       'options': options,
// //       'value': value,
// //       'maxLength': maxLength,
// //       'minLength': minLength,
// //     };
// //   }
// // }

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({Key? key}) : super(key: key);

// //   @override
// //   _HomeScreenState createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   final TextEditingController _formNameController = TextEditingController();
// //   List<DynamicFieldConfig> formFields = [];
// //   Map<String, dynamic> formData = {};

// //   final List<String> fieldTypes = [
// //     'text',
// //     'number',
// //     'email',
// //     'phone',
// //     'dropdown',
// //     'date',
// //     'time',
// //   ];

// //   void _showAddFieldDialog() {
// //     String fieldLabel = '';
// //     String selectedType = 'text';
// //     bool isRequired = false;
// //     Color selectedColor = Colors.blue;
// //     List<Map<String, dynamic>> options = [];
// //     int? maxLength;
// //     int? minLength;

// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return StatefulBuilder(
// //           builder: (context, setState) {
// //             return AlertDialog(
// //               title: const Text('Add New Field'),
// //               content: SingleChildScrollView(
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     TextField(
// //                       decoration: const InputDecoration(
// //                         labelText: 'Field Label',
// //                         border: OutlineInputBorder(),
// //                       ),
// //                       onChanged: (value) => fieldLabel = value,
// //                     ),
// //                     const SizedBox(height: 16),
// //                     DropdownButtonFormField<String>(
// //                       value: selectedType,
// //                       decoration: const InputDecoration(
// //                         labelText: 'Field Type',
// //                         border: OutlineInputBorder(),
// //                       ),
// //                       items: fieldTypes.map((type) {
// //                         return DropdownMenuItem(
// //                           value: type,
// //                           child: Text(type.toUpperCase()),
// //                         );
// //                       }).toList(),
// //                       onChanged: (value) {
// //                         setState(() {
// //                           selectedType = value!;
// //                         });
// //                       },
// //                     ),
// //                     const SizedBox(height: 16),
// //                     if (selectedType != 'dropdown') ...[
// //                       TextField(
// //                         decoration: const InputDecoration(
// //                           labelText: 'Max Length',
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         keyboardType: TextInputType.number,
// //                         onChanged: (value) => maxLength = int.tryParse(value),
// //                       ),
// //                       const SizedBox(height: 16),
// //                       TextField(
// //                         decoration: const InputDecoration(
// //                           labelText: 'Min Length',
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         keyboardType: TextInputType.number,
// //                         onChanged: (value) => minLength = int.tryParse(value),
// //                       ),
// //                     ],
// //                     if (selectedType == 'dropdown')
// //                       Column(
// //                         children: [
// //                           ElevatedButton(
// //                             onPressed: () {
// //                               TextEditingController optionController = TextEditingController();
// //                               showDialog(
// //                                 context: context,
// //                                 builder: (BuildContext context) {
// //                                   return AlertDialog(
// //                                     title: const Text('Add Option'),
// //                                     content: TextField(
// //                                       controller: optionController,
// //                                       decoration: const InputDecoration(
// //                                         labelText: 'Option Text',
// //                                         border: OutlineInputBorder(),
// //                                       ),
// //                                     ),
// //                                     actions: [
// //                                       TextButton(
// //                                         onPressed: () => Navigator.pop(context),
// //                                         child: const Text('Cancel'),
// //                                       ),
// //                                       ElevatedButton(
// //                                         onPressed: () {
// //                                           if (optionController.text.isNotEmpty) {
// //                                             setState(() {
// //                                               options.add({
// //                                                 'label': optionController.text,
// //                                                 'value': optionController.text,
// //                                               });
// //                                             });
// //                                             Navigator.pop(context);
// //                                           }
// //                                         },
// //                                         child: const Text('Add'),
// //                                       ),
// //                                     ],
// //                                   );
// //                                 },
// //                               );
// //                             },
// //                             child: const Text('Add Option'),
// //                           ),
// //                           if (options.isNotEmpty) ...[
// //                             const SizedBox(height: 8),
// //                             Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: options.map((option) {
// //                                 return Chip(
// //                                   label: Text(option['label']),
// //                                   onDeleted: () {
// //                                     setState(() {
// //                                       options.remove(option);
// //                                     });
// //                                   },
// //                                 );
// //                               }).toList(),
// //                             ),
// //                           ],
// //                         ],
// //                       ),
// //                     const SizedBox(height: 16),
// //                     // Row(
// //                     //   children: [
// //                     //     const Text('Border Color: '),
// //                     //     const SizedBox(width: 8),
// //                     //     InkWell(
// //                     //       onTap: () {
// //                     //         showDialog(
// //                     //           context: context,
// //                     //           builder: (BuildContext context) {
// //                     //             return AlertDialog(
// //                     //               title: const Text('Pick Border Color'),
// //                     //               content: SingleChildScrollView(
// //                     //                 child: ColorPicker(
// //                     //                   color: selectedColor,
// //                     //                   onColorChanged: (Color color) {
// //                     //                     setState(() {
// //                     //                       selectedColor = color;
// //                     //                     });
// //                     //                   },
// //                     //                 ),
// //                     //               ),
// //                     //               actions: [
// //                     //                 TextButton(
// //                     //                   onPressed: () => Navigator.pop(context),
// //                     //                   child: const Text('Done'),
// //                     //                 ),
// //                     //               ],
// //                     //             );
// //                     //           },
// //                     //         );
// //                     //       },
// //                     //       child: Container(
// //                     //         width: 40,
// //                     //         height: 40,
// //                     //         decoration: BoxDecoration(
// //                     //           color: selectedColor,
// //                     //           border: Border.all(color: Colors.grey),
// //                     //           borderRadius: BorderRadius.circular(4),
// //                     //         ),
// //                     //       ),
// //                     //     ),
// //                     //   ],
// //                     // ),
// //                     const SizedBox(height: 16),
// //                     CheckboxListTile(
// //                       title: const Text('Required'),
// //                       value: isRequired,
// //                       onChanged: (bool? value) {
// //                         setState(() {
// //                           isRequired = value!;
// //                         });
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               actions: [
// //                 TextButton(
// //                   onPressed: () => Navigator.pop(context),
// //                   child: const Text('Cancel'),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     if (fieldLabel.isNotEmpty) {
// //                       _addNewField(
// //                         fieldLabel,
// //                         selectedType,
// //                         isRequired,
// //                         selectedColor,
// //                         options,
// //                         maxLength,
// //                         minLength,
// //                       );
// //                       Navigator.pop(context);
// //                     }
// //                   },
// //                   child: const Text('Add Field'),
// //                 ),
// //               ],
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }

// //   void _addNewField(
// //     String label,
// //     String type,
// //     bool required,
// //     Color borderColor,
// //     List<Map<String, dynamic>> options,
// //     int? maxLength,
// //     int? minLength,
// //   ) {
// //     setState(() {
// //       formFields.add(
// //         DynamicFieldConfig(
// //           id: 'field_${formFields.length}',
// //           label: label,
// //           type: type,
// //           required: required,
// //           options: type == 'dropdown' ? options : null,
// //           borderColor: borderColor,
// //           maxLength: maxLength,
// //           minLength: minLength,
// //         ),
// //       );
// //     });
// //   }

// //   Widget _buildDynamicField(DynamicFieldConfig field) {
// //     InputDecoration getDecoration() {
// //       return InputDecoration(
// //         labelText: field.label,
// //         border: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(8),
// //           borderSide: BorderSide(color: field.borderColor, width: 2),
// //         ),
// //         enabledBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(8),
// //           borderSide: BorderSide(color: field.borderColor),
// //         ),
// //         focusedBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(8),
// //           borderSide: BorderSide(color: field.borderColor, width: 2),
// //         ),
// //         errorText: field.errorText,
// //       );
// //     }

// //     switch (field.type) {
// //       case 'text':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           maxLength: field.maxLength,
// //           validator: (value) {
// //             if (field.required && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             if (field.minLength != null && value!.length < field.minLength!) {
// //               return 'Minimum length is ${field.minLength}';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             setState(() {
// //               field.value = value;
// //               formData[field.id] = value;
// //             });
// //           },
// //         );

// //       case 'email':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           keyboardType: TextInputType.emailAddress,
// //           validator: (value) {
// //             if (field.required && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             if (value != null && value.isNotEmpty && !value.contains('@')) {
// //               return 'Please enter a valid email';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             setState(() {
// //               field.value = value;
// //               formData[field.id] = value;
// //             });
// //           },
// //         );

// //       case 'phone':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           keyboardType: TextInputType.phone,
// //           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //           maxLength: 10,
// //           validator: (value) {
// //             if (field.required && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             setState(() {
// //               field.value = value;
// //               formData[field.id] = value;
// //             });
// //           },
// //         );

// //       case 'number':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           keyboardType: TextInputType.number,
// //           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //           validator: (value) {
// //             if (field.required && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             setState(() {
// //               field.value = int.tryParse(value);
// //               formData[field.id] = field.value;
// //             });
// //           },
// //         );

// //       case 'dropdown':
// //         return DropdownButtonFormField<String>(
// //           decoration: getDecoration(),
// //           value: field.value,
// //           items: field.options?.map<DropdownMenuItem<String>>((option) {
// //             return DropdownMenuItem<String>(
// //               value: option['value'],
// //               child: Text(option['label']),
// //             );
// //           }).toList(),
// //           validator: (value) {
// //             if (field.required && value == null) {
// //               return '${field.label} is required';
// //             }
// //             return null;
// //           },
// //           onChanged: (value) {
// //             setState(() {
// //               field.value = value;
// //               formData[field.id] = value;
// //             });
// //           },
// //         );

// //       case 'date':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           readOnly: true,
// //           controller: TextEditingController(text: field.value?.toString()),
// //           onTap: () async {
// //             final DateTime? picked = await showDatePicker(
// //               context: context,
// //               initialDate: DateTime.now(),
// //               firstDate: DateTime(1900),
// //               lastDate: DateTime(2100),
// //             );
// //             if (picked != null) {
// //               setState(() {
// //                 field.value = picked.toString().split(' ')[0];
// //                 formData[field.id] = field.value;
// //               });
// //             }
// //           },
// //           validator: (value) {
// //             if (field.required && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             return null;
// //           },
// //         );

// //       case 'time':
// //         return TextFormField(
// //           decoration: getDecoration(),
// //           readOnly: true,
// //           controller: TextEditingController(text: field.value?.toString()),
// //           onTap: () async {
// //             final TimeOfDay? picked = await showTimePicker(
// //               context: context,
// //               initialTime: TimeOfDay.now(),
// //             );
// //             if (picked != null) {
// //               setState(() {
// //                 field.value = '${picked.hour}:${picked.minute}';
// //                 formData[field.id] = field.value;
// //               });
// //             }
// //           },
// //           validator: (value) {
// //             if (field.required && (value == null || value.isEmpty)) {
// //               return '${field.label} is required';
// //             }
// //             return null;
// //           },
// //         );

// //       default:
// //         return Container();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Dynamic Form Builder'),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               TextField(
// //                 controller: _formNameController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Form Name',
// //                   border: OutlineInputBorder(),
// //                 ),
// //               ),
// //               const SizedBox(height: 24),
// //               Text(
// //                 'Form Fields',
// //                 style: Theme.of(context).textTheme.titleLarge,
// //               ),
// //               const SizedBox(height: 16),
// //               if (formFields.isEmpty)
// //                 const Center(
// //                   child: Text(
// //                     'No fields added yet. Click the + button to add fields.',
// //                     style: TextStyle(
// //                       color: Colors.grey,
// //                       fontSize: 16,
// //                     ),
// //                   ),
// //                 ),
// //               ...formFields.map((field) => Padding(
// //                 padding: const EdgeInsets.only(bottom: 16),
// //                 child: Stack(
// //                   children: [
// //                     _buildDynamicField(field),
// //                     Positioned(
// //                       right: 0,
// //                       top: 0,
// //                       child: IconButton(
// //                         icon: const Icon(Icons.delete, color: Colors.red),
// //                         onPressed: () {
// //                           setState(() {
// //                             formFields.remove(field);
// //                             formData.remove(field.id);
// //                           });
// //                         },
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               )).toList(),
// //               if (formFields.isNotEmpty) ...[
// //                 const SizedBox(height: 24),
// //                 Center(
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       padding: const EdgeInsets.symmetric(
// //                         horizontal: 32,
// //                         vertical: 16,
// //                       ),
// //                     ),
// //                     onPressed: () {
// //                       if (_formKey.currentState!.validate()) {
// //                         print("Printing the formData :::: $formData");                        // Create form submission data
// //                         final formSubmission = {
// //                           'formName': _formNameController.text,
// //                           'fields': formFields.map((field) => field.toJson()).toList(),
// //                           'formData': formData,
// //                         };
                        
// //                         // Show submission dialog
// //                         showDialog(
// //                           context: context,
// //                           builder: (BuildContext context) {
// //                             return AlertDialog(
// //                               title: const Text('Form Submitted'),
// //                               content: SingleChildScrollView(
// //                                 child: Column(
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   mainAxisSize: MainAxisSize.min,
// //                                   children: [
// //                                     Text('Form Name: ${_formNameController.text}'),
// //                                     const SizedBox(height: 16),
// //                                     const Text('Form Data:'),
// //                                     const SizedBox(height: 8),
// //                                     ...formFields.map((field) => Padding(
// //                                       padding: const EdgeInsets.only(bottom: 8),
// //                                       child: Text(
// //                                         '${field.label}: ${field.value ?? "Not provided"}',
// //                                         style: const TextStyle(fontSize: 14),
// //                                       ),
// //                                     )),
// //                                   ],
// //                                 ),
// //                               ),
// //                               actions: [
// //                                 TextButton(
// //                                   onPressed: () {
// //                                     Navigator.pop(context);
// //                                     // Reset form
// //                                     setState(() {
// //                                       _formNameController.clear();
// //                                       formFields.clear();
// //                                       formData.clear();
// //                                     });
// //                                   },
// //                                   child: const Text('OK'),
// //                                 ),
// //                               ],
// //                             );
// //                           },
// //                         );
// //                       }
// //                     },
// //                     child: const Text('Submit Form'),
// //                   ),
// //                 ),
// //               ],
// //             ],
// //           ),
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _showAddFieldDialog,
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _formNameController.dispose();
// //     super.dispose();
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class DynamicFormField {
//   final String id;
//   final String label;
//   final String type;
//   final Map<String, dynamic> options;
//   dynamic value;

//   DynamicFormField({
//     required this.id,
//     required this.label,
//     required this.type,
//     required this.options,
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

// // class _HomeScreenState extends State<HomeScreen> {
//   final controller = Get.put(DynamicController());
//   final _formKey = GlobalKey<FormState>();
//   List<DynamicFormField> formFields = [];
  
//   final TextEditingController _fieldNameController = TextEditingController();
//   final TextEditingController _maxLengthController = TextEditingController();
//   final TextEditingController _minLengthController = TextEditingController();
//   final TextEditingController _maxDigitsController = TextEditingController();
//   final TextEditingController _decimalPlacesController = TextEditingController();
  
//   String selectedFieldType = 'Char';
//   bool _isRequired = false;
//   bool _isReadOnly = false;

//   Map<String, Map<String, dynamic>> getDefaultOptions() {
//     // Same as before
//     return {
//       'Char': {
//         'required': false,
//         'max_length': 100,
//         'min_length': 1,
//       },
//       // ... other field types
//     };
//   }

//   Widget _buildFieldOptions() {
//     final options = getDefaultOptions()[selectedFieldType] ?? {};
//     List<Widget> optionWidgets = [];

//     // Replace CheckboxListTile with Switch
//     optionWidgets.add(
//       ListTile(
//         title: const Text('Required'),
//         trailing: Switch(
//           value: _isRequired,
//           onChanged: (value) {
//             setState(() {
//               _isRequired = value;
//             });
//           },
//         ),
//       ),
//     );

//     // Type-specific options (same as before)
//     switch (selectedFieldType) {
//       case 'Char':
//       case 'Text':
//         optionWidgets.addAll([
//           TextField(
//             controller: _maxLengthController,
//             decoration: const InputDecoration(
//               labelText: 'Max Length',
//               border: OutlineInputBorder(),
//             ),
//             keyboardType: TextInputType.number,
//           ),
//           const SizedBox(height: 8),
//           TextField(
//             controller: _minLengthController,
//             decoration: const InputDecoration(
//               labelText: 'Min Length',
//               border: OutlineInputBorder(),
//             ),
//             keyboardType: TextInputType.number,
//           ),
//         ]);
//         break;
//       // ... other cases
//     }

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: optionWidgets,
//     );
//   }

//   Widget _buildFieldList() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: formFields.length,
//       itemBuilder: (context, index) {
//         final field = formFields[index];
//         return Card(
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           child: ListTile(
//             title: Text(field.label),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Type: ${field.type}'),
//                 ...field.options.entries.map((e) => 
//                   Text('${e.key}: ${e.value}')
//                 ).toList(),
//               ],
//             ),
//             trailing: IconButton(
//               icon: const Icon(Icons.delete),
//               onPressed: () {
//                 setState(() {
//                   formFields.removeAt(index);
//                 });
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       final Map<String, dynamic> jsonData = {
//         'app_label': controller.appLabel.text,
//         'model_name': controller.modelName.text,
//         'fields': {}
//       };

//       for (var field in formFields) {
//         jsonData['fields'].addAll(field.toJson());
//       }

//       print('Final JSON Data: $jsonData');
//       // Send to server here
//       controller.createDynamicData(jsonData);
//     }
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
//                     ResponsiveConstants().buttonBreakpoints,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 12, right: 12, bottom: 12),
//                       child: MaterialButton(
//                         minWidth: 85,
//                         height: 35,
//                         elevation: 0.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)
//                         ),
//                         color: Theme.of(context).colorScheme.primary,
//                         highlightColor: Theme.of(context).colorScheme.primary,
//                         onPressed: _showAddFieldDialog,
//                         child: Text(
//                           "Add Fields",
//                           style: TextStyle(
//                             color: Theme.of(context).colorScheme.secondary,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               if (formFields.isNotEmpty) ...[
//                 _buildFieldList(),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _submitForm,
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

// // Add this to your DynamicController class
// class DynamicController extends GetxController {
//   final TextEditingController appLabel = TextEditingController();
//   final TextEditingController modelName = TextEditingController();

//   void createDynamicData(Map<String, dynamic> data) {
//     // Add your API call here
//     print('Sending to server: $data');
//   }
// }