import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final Map<String, dynamic> options;
  // final bool isRequired;
  dynamic value;

  DynamicFormField({
    required this.id,
    required this.label,
    required this.type,
    required this.options,
    // this.isRequired = false,
    this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      label: {
        'type': type,
        ...options,
      }
    };
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(DynamicController());
  final _formKey = GlobalKey<FormState>();
  List<DynamicFormField> formFields = [];
  String _selectedFieldType = 'Char';
  bool _isRequired = false;
  bool _isReadOnly = false;
  
  Map<String, Map<String, dynamic>> getDefaultOptions() {
    return {
      'Char': {
        'required': false,
        'max_length': 100,
        'min_length': 1,
      },
      'Text': {
        'required': false,
        'max_length': 1000,
        'min_length': 5,
      },
      'Choice': {
        'required': false,
        'default': 1,
        'choices': [[1, 'Male'], [2, 'Female'], [3, 'Others']],
      },
      'Integer': {
        'required': false,
        'default': 0,
      },
      'DateTime': {
        'required': false,
        'format': '%d-%m-%Y %I:%M %p',
        'input_formats': ['%d-%m-%Y %I:%M %p'],
        'read_only': true,
      },
      'Date': {
        'required': false,
        'format': '%d-%m-%Y',
        'input_formats': ['%d-%m-%Y'],
        'read_only': true,
      },
      'Time': {
        'required': false,
        'format': '%I:%M %p',
        'input_formats': ['%I:%M %p'],
        'read_only': true,
      },
      'Duration': {
        'required': false,
        'format': '%d-%m-%Y %I:%M %p',
        'input_formats': ['%d-%m-%Y %I:%M %p'],
        'read_only': true,
      },
      'Decimal': {
        'required': false,
        'max_digits': 9,
        'decimal_places': 2,
        'default': 0,
      },
      'ManyToMany': {
        'to': 'auth.Group',
        'read_fields': ['name'],
        'required': true,
        'related_name': 'sample_multi',
      },
      'ForeignKey': {
        'to': 'auth.Group',
        'read_fields': ['name'],
        'required': false,
        'related_name': 'sample',
      },
    };
  }

  Widget _buildFieldOptions() {
    final options = getDefaultOptions()[_selectedFieldType] ?? {};
    List<Widget> optionWidgets = [];

    // Common options
     optionWidgets.add(
      ListTile(
        title: const Text('Required'),
        trailing: Switch(
          value: _isRequired,
          onChanged: (value) {
            setState(() {
              _isRequired = value;
            });
          },
        ),
      ),
    );
    // Type-specific options
    switch (_selectedFieldType) {
      case 'Char':
      case 'Text':
        optionWidgets.addAll([
          TextField(
            controller: controller.maxLengthController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: 'Max Length',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller.minLengthController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: 'Min Length',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ]);
        break;

      case 'Decimal':
        optionWidgets.addAll([
          TextField(
            controller: controller.maxDigitsController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: 'Max Digits',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller.decimalPlacesController,
            decoration: const InputDecoration(
              labelText: 'Decimal Places',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ]);
        break;

      case 'DateTime':
      case 'Date':
      case 'Time':
      case 'Duration':
        optionWidgets.add(
          CheckboxListTile(
            title: const Text('Read Only'),
            value: _isReadOnly,
            onChanged: (value) {
              setState(() {
                _isReadOnly = value ?? false;
              });
            },
          ),
        );
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: optionWidgets,
    );
  }

  Widget _buildFieldList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: formFields.length,
      itemBuilder: (context, index) {
        final field = formFields[index];
        return ResponsiveRow(columns: [
          ResponsiveColumn(ResponsiveConstants().cardBreakpoints, child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(field.label),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Type: ${field.type}'),
                ...field.options.entries.map((e) =>
                  Text('${e.key}: ${e.value}')
                ).toList(),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  formFields.removeAt(index);
                });
              },
            ),
          ),
        ))
        ]);
      },
    );
  }

  void _addNewField(String fieldName, String fieldType) {
    final options = getDefaultOptions()[fieldType]?.map((key, value) => MapEntry(key, value)) ?? {};
    
    // Update options based on user input
    options['required'] = _isRequired;

    switch (fieldType) {
      case 'Char':
      case 'Text':
        options['max_length'] = int.tryParse(controller.maxLengthController.text) ?? options['max_length'];
        options['min_length'] = int.tryParse(controller.minLengthController.text) ?? options['min_length'];
        break;
      case 'Decimal':
        options['max_digits'] = int.tryParse(controller.maxDigitsController.text) ?? options['max_digits'];
        options['decimal_places'] = int.tryParse(controller.decimalPlacesController.text) ?? options['decimal_places'];
        break;
      case 'DateTime':
      case 'Date':
      case 'Time':
      case 'Duration':
        options['read_only'] = _isReadOnly;
        break;
    }

    setState(() {
      formFields.add(
        DynamicFormField(
          id: 'field_${formFields.length}',
          label: fieldName,
          type: fieldType,
          options: options,
        ),
      );
    });
  }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     final jsonData = {};
  //     for (var field in formFields) {
  //       jsonData.addAll(field.toJson());
  //     }
  //     print('JSON Data: $jsonData');
  //   }
  // }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> jsonData = {
        'app_label': controller.appLabel.text,
        'model_name': controller.modelName.text,
        'fields': {}
      };

      for (var field in formFields) {
        jsonData['fields'].addAll(field.toJson());
      }

      print('Final JSON Data: $jsonData');
      // Send to server here
      controller.createDynamicData(jsonData);
    }
  }

  // Update _showAddFieldDialog to include the new options
  void _showAddFieldDialog() {
    // Reset controllers
controller.maxLengthController.clear();
    controller.minLengthController.clear();
    controller.maxDigitsController.clear();
    controller.decimalPlacesController.clear();
    // _isRequired = false;
    // _isReadOnly = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text('Add New Field'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: controller.fieldNameController,
                      decoration: const InputDecoration(
                        labelText: 'Field Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedFieldType,
                      decoration: const InputDecoration(
                        labelText: 'Field Type',
                        border: OutlineInputBorder(),
                      ),
                      items: getDefaultOptions().keys.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setStateDialog(() {
                          _selectedFieldType = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildFieldOptions(),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("gfsghfg ::: ${jsonEncode(formFields)}");
                    if (controller.fieldNameController.text.isNotEmpty) {
                      _addNewField(
                        controller.fieldNameController.text,
                        _selectedFieldType,
                      );
                      controller.dialogDisposeController();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add Field'),
                ),
              ],
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12, right: 12, bottom: 12),
                      child: MaterialButton(
                        minWidth: 85,
                        height: 35,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).colorScheme.primary,
                        highlightColor: Theme.of(context).colorScheme.primary,
                        onPressed: _showAddFieldDialog,
                        child: Text(
                          "Add Fields",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // if (formFields.isNotEmpty)
              if (formFields.isNotEmpty) ...[
                _buildFieldList(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print("Json Data ::: $jsonEncode(formFields)");

                  },
                  // onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
