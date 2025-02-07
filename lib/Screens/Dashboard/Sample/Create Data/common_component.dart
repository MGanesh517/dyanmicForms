import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/BreakPoints/breakpoints.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/ModelName_validator_list_model.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class FieldManagementComponent extends StatelessWidget {
  final bool isInDialog;

  final String fieldNameText;
  final String fieldNameLabeText;
  final TextEditingController fieldNameController;
  final String? Function(String?)? fieldNameValidation;

  final String typeHintText;
  final String? typeValue;
  final List<DropdownMenuItem<String>> typeItems;
  final Function(String?) typeOnChanged;
  final String? Function(String?)? typeValidator;
  final VoidCallback choiceOnTap;

  final String addedChoiceHintText;
  final String? addedChoiceValue;
  final List<DropdownMenuItem<String>> addedChoiceItems;
  final Function(String?) addedChoiceOnChanged;
  final String? Function(String?)? addedChoiceValidator;
  final VoidCallback? addedChoiceOnTap;

  final String modelNameMastersText;
  final String? modelNameMastersValue;
  final Future<List<DynamicModelsNameData>> Function(String, LoadProps?)? modelNameMastersItems;
  final Function(String?) modelNameMastersOnChanged;
  final String? Function(String?)? modelNameMastersValidator;
  final VoidCallback? modelNameMastersOnTap;
  final dynamic modelNameMastersItemBuilder;
  final dynamic modelNameMastersCompareFN;
  final dynamic modelNameMastersItemAsString;


  final String choiceText;
  final String choiceLabeText;
  final TextEditingController choiceController;

  final String requiredCheckBoxName;
  final bool requiredValue;
  final Function(bool?) requiredOnChanged;

  final String showViewCheckBoxName;
  final bool showViewValue;
  final Function(bool?) showViewOnChanged;

  final String showReportCheckBoxName;
  final bool showReportValue;
  final Function(bool?) showReportOnChanged;

  final String showEditCheckBoxName;
  final bool showEditValue;
  final Function(bool?) showEditOnChanged;

  final String showListCheckBoxName;
  final bool showListValue;
  final Function(bool?) showListOnChanged;

  final String showFilterCheckBoxName;
  final bool showFilterValue;
  final Function(bool?) showFilterOnChanged;

  final String showAddCheckBoxName;
  final bool showAddValue;
  final Function(bool?) showAddOnChanged;

  final String showMultipleFilterCheckBoxName;
  final bool showMultipleFilterValue;
  final Function(bool?) showMultipleFilterOnChanged;

  final String defaultCheckBoxName;
  final bool defaultValue;
  final Function(bool?) defaultOnChanged;

  final String maxLengthText;
  final String maxLengthLabeText;
  final TextEditingController maxLengthController;
  final String? Function(String?)? maxLengthValidation;

  final String minLengthText;
  final String minLengthLabeText;
  final TextEditingController minLengthController;
  final String? Function(String?)? minLengthValidation;

  final String rangeFilterCheckBoxName;
  final bool rangeFilterValue;
  final Function(bool?) rangeFilterOnChanged;

  final String readOnlyCheckBoxName;
  final bool readOnlyValue;
  final Function(bool?) readOnlyOnChanged;

  final String maxDigitsText;
  final String maxDigitsLabeText;
  final TextEditingController maxDigitsController;
  final String? Function(String?)? maxDigitsValidation;

  final String decimalText;
  final String decimalLabeText;
  final TextEditingController decimalController;
  final String? Function(String?)? decimalValidation;

  final String clearButtonText;
  final VoidCallback clearButtonOnTap;
  final String submitButtonText;
  final VoidCallback submitButtonOnTap;
  
  // final Widget dialogBoxCustomWidget;

   FieldManagementComponent({
    super.key,
    this.isInDialog = false,

    required this.fieldNameText,
    required this.fieldNameController,
    required this.fieldNameLabeText,
    required this.fieldNameValidation,

    required this.typeHintText,
    this.typeValue,
    required this.typeItems,
    required this.typeOnChanged,
    this.typeValidator,
    required this.choiceOnTap,

    required this.addedChoiceHintText,
    this.addedChoiceValue,
    required this.addedChoiceItems,
    required this.addedChoiceOnChanged,
    this.addedChoiceValidator,
    this.addedChoiceOnTap,

    required this.modelNameMastersText,
    this.modelNameMastersValue,
    required this.modelNameMastersItems,
    required this.modelNameMastersOnChanged,
    this.modelNameMastersValidator,
    this.modelNameMastersOnTap,
    this.modelNameMastersItemBuilder,
    this.modelNameMastersCompareFN,
    this.modelNameMastersItemAsString,

    required this.choiceText,
    required this.choiceLabeText,
    required this.choiceController,

    required this.requiredCheckBoxName,
    required this.requiredValue,
    required this.requiredOnChanged,

    required this.showViewCheckBoxName,
    required this.showViewValue,
    required this.showViewOnChanged,
    
    required this.showReportCheckBoxName,
    required this.showReportValue,
    required this.showReportOnChanged,
    
    required this.showEditCheckBoxName,
    required this.showEditValue,
    required this.showEditOnChanged,
    
    required this.showListCheckBoxName,
    required this.showListValue,
    required this.showListOnChanged,
    
    required this.showFilterCheckBoxName,
    required this.showFilterValue,
    required this.showFilterOnChanged,
    
    required this.showAddCheckBoxName,
    required this.showAddValue,
    required this.showAddOnChanged,
    
    required this.showMultipleFilterCheckBoxName,
    required this.showMultipleFilterValue,
    required this.showMultipleFilterOnChanged,
    
    required this.defaultCheckBoxName,
    required this.defaultValue,
    required this.defaultOnChanged,
    
    required this.maxLengthText,
    required this.maxLengthLabeText,
    required this.maxLengthController,
    this.maxLengthValidation,
    
    required this.minLengthText,
    required this.minLengthLabeText,
    required this.minLengthController,
    this.minLengthValidation,
    
    required this.rangeFilterCheckBoxName,
    required this.rangeFilterValue,
    required this.rangeFilterOnChanged,
    
    required this.readOnlyCheckBoxName,
    required this.readOnlyValue,
    required this.readOnlyOnChanged,
    
    required this.maxDigitsText,
    required this.maxDigitsLabeText,
    required this.maxDigitsController,
    this.maxDigitsValidation,
    
    required this.decimalText,
    required this.decimalLabeText,
    required this.decimalController,
    this.decimalValidation,
    
    required this.clearButtonText,
    required this.clearButtonOnTap,
    required this.submitButtonText,
    required this.submitButtonOnTap,
    
    // required this.dialogBoxCustomWidget,
    

  });

  final controller = Get.put(DynamicController());


  @override
  Widget build(BuildContext context) {
    // return 
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 0.5, color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            // visible: controller.dynamicDetails.id == null,
            child: ResponsiveRow(
              runSpacing: 10,
              spacing: 20,
              columns: [
                ResponsiveColumn(
                  ResponsiveConstants().buttonBreakpoints,
                  child: CommonComponents.defaultTextFormField(
                    context,
                    controller: fieldNameController,
                    hintText: fieldNameText,
                    validator: fieldNameValidation,
                    decoration: InputDecoration(
                      labelText: fieldNameLabeText,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ResponsiveColumn(
                  ResponsiveConstants().buttonBreakpoints,
                  child:  DropdownButtonFormField<String>(
                      dropdownColor: Theme.of(context).colorScheme.secondary,
                      menuMaxHeight: 250,
                      focusColor: Theme.of(context).colorScheme.primary,
                      value: typeValue,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1.5),
                        ),
                        hintText: typeHintText,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1.5),
                        ),
                      ),
                      items: typeItems,
                      onChanged: typeOnChanged,
                    ),
                ),
      if (shouldShowAdditionalFields()) ...[
                if (controller.selectedFieldType == 'Choice' || controller.selectedChildrenFieldType == 'Choice')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonComponents.defaultTextFormField(
                            context,
                            controller: choiceController,
                            validator: addedChoiceValidator,
                            hintText: choiceText,
                            decoration: InputDecoration(
                              labelText: choiceLabeText,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: choiceOnTap,
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
                      menuMaxHeight: 250,
                      hint: Text(addedChoiceHintText),
                      dropdownColor: Theme.of(context).colorScheme.secondary,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 1.5),
                        ),
                      ),
                      items: addedChoiceItems,
                      onChanged: addedChoiceOnChanged,
                    ),
                  ),

                  if (controller.selectedFieldType == 'ForeignKey' || controller.selectedFieldType == 'ManyToMany')
                    ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultDropdownSearch<DynamicModelsNameData>(
  context,
  hintText: modelNameMastersText ?? 'Select a Model',
  showBottomSheet: false,
  items: (filter, infiniteScrollProps) async {
    if (modelNameMastersItems == null) {
      debugPrint("modelNameMastersItems is null");
      return [];
    }
    return await modelNameMastersItems!(filter, infiniteScrollProps);
  },
  itemBuilder: modelNameMastersItemBuilder,
  compareFn: modelNameMastersCompareFN,
  itemAsString: modelNameMastersCompareFN,
  onChanged: modelNameMastersOnChanged,
),
                  ),
     
  
                if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType != 'Children')
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultCheckBoxListTile(
                              context,
                              value: requiredValue,
                              title: requiredCheckBoxName, onChanged: requiredOnChanged)),
                if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType != 'Children')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showViewCheckBoxName,
                          value: showViewValue,
                          onChanged: showViewOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType != 'Children')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showReportCheckBoxName,
                          value: showReportValue,
                          onChanged: showReportOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType != 'Children' )
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showEditCheckBoxName,
                          value: showEditValue,
                          onChanged: showEditOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType != 'Children')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child:  CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showFilterCheckBoxName,
                          value: showFilterValue,
                          onChanged: showFilterOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType != 'Children'  || controller.selectedChildrenFieldType != 'Children')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child:  CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showListCheckBoxName,
                          value: showListValue,
                          onChanged: showListOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType != 'Children' || controller.selectedChildrenFieldType != 'Children' )
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showAddCheckBoxName,
                          value: showAddValue,
                          onChanged: showAddOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType == 'ManyToMany' || controller.selectedChildrenFieldType == 'ManyToMany' )
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showMultipleFilterCheckBoxName,
                          value: showMultipleFilterValue,
                          onChanged: showMultipleFilterOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType == 'Boolean' || controller.selectedChildrenFieldType == 'Boolean')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child:  CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: defaultCheckBoxName,
                          value: defaultValue,
                          onChanged: defaultOnChanged,
                        ),
                  ),
               if (controller.selectedFieldType == 'Char' || controller.selectedFieldType == 'Text' || controller.selectedChildrenFieldType == 'Char' || controller.selectedChildrenFieldType == 'Text' )
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultTextFormField(
                        context,
                        controller: maxLengthController,
                        hintText: maxLengthText,
                        validator: maxLengthValidation,
                        decoration:  InputDecoration(
                          labelText: maxLengthLabeText,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                      )),
                      
                if (controller.selectedFieldType == 'Char' || controller.selectedFieldType == 'Text' || controller.selectedChildrenFieldType == 'Char' || controller.selectedChildrenFieldType == 'Text' )
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultTextFormField(
                        context,
                        controller: minLengthController,
                        hintText: minLengthText,
                        validator: minLengthValidation,
                        decoration: InputDecoration(
                          labelText: minLengthLabeText,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                      )),
                if (controller.selectedFieldType == 'DateTime' || controller.selectedFieldType == 'Date' || controller.selectedChildrenFieldType == 'DateTime' || controller.selectedChildrenFieldType == 'Date' )
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultCheckBoxListTile(context,
                          value: rangeFilterValue,
                          title: rangeFilterCheckBoxName, onChanged: rangeFilterOnChanged)),
                if (controller.selectedFieldType == 'DateTime' || controller.selectedFieldType == 'Date' || controller.selectedFieldType == 'Time' || controller.selectedFieldType == 'Duration' || 
                    controller.selectedChildrenFieldType == 'DateTime' || controller.selectedChildrenFieldType == 'Date' || controller.selectedChildrenFieldType == 'Time' || controller.selectedChildrenFieldType == 'Duration'  )
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultCheckBoxListTile(context,
                          value: readOnlyValue,
                          title: readOnlyCheckBoxName, onChanged: readOnlyOnChanged)),
                if (controller.selectedFieldType == 'Decimal' || controller.selectedChildrenFieldType == 'Decimal' )
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultTextFormField(
                        context,
                        controller: maxDigitsController,
                        hintText: maxDigitsText,
                        validator: maxDigitsValidation,
                        decoration: InputDecoration(
                          labelText: maxDigitsLabeText,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                      )),
                if (controller.selectedFieldType == 'Decimal'  || controller.selectedChildrenFieldType == 'Decimal')
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultTextFormField(
                        context,
                        controller: decimalController,
                        hintText: decimalText,
                        validator: decimalValidation,
                        decoration: InputDecoration(
                          labelText: decimalLabeText,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                      )),

                
              ]]
            ),
          ),
SizedBox(height: 12),
          Visibility(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Theme.of(context).colorScheme.secondary,
                  child: MaterialButton(
                    elevation: 2,
                    onPressed: clearButtonOnTap,
                    height: 50,
                    minWidth: 100,
                    color: Theme.of(context).colorScheme.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: Text(
                        clearButtonText,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  // ),
                ),
                const SizedBox(width: 8),
                Container(
                  color: Theme.of(context).colorScheme.secondary,
                  child: MaterialButton(
                    elevation: 2,
                    onPressed: submitButtonOnTap,
                    height: 50,
                    minWidth: 100,
                    color: Theme.of(context).colorScheme.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                              controller.editingIndex >= 0
                                  ? Icons.update
                                  : Icons.add_circle_outline_outlined,
                              color: Theme.of(context).colorScheme.secondary),
                          SizedBox(width: 12),
                          Text(
                            // controller.editingIndex >= 0
                            //     ? "Update Field"
                            //     : "Add Field",
                            submitButtonText,
                            // Icon(Icons.add_circle_outline_outlined, color: Theme.of(context).colorScheme.secondary),
                            // SizedBox(width: 12),
                            // Text(
                            //   "Add Field",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
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
          ),
          
        ],
      ),
    );
  }

  bool shouldShowAdditionalFields() {
    if (isInDialog) {
      // In dialog, show all fields regardless of type
      return true;
    } else {
      // In main form, hide fields if type is Children
      return controller.selectedFieldType != 'Children';
    }
  }
}



class DynamicFieldDataTable extends StatelessWidget {
  final List<Map<String, dynamic>> formFields;
  final void Function(int index, Map<String, dynamic> field) onEdit;
  final void Function(String fieldName) onDelete;

  const DynamicFieldDataTable({
    super.key,
    required this.formFields,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                dataTextStyle: const TextStyle(fontWeight: FontWeight.w400),
                headingRowColor: const WidgetStatePropertyAll(Color(0xfff7fafc)),
                dataRowColor: const WidgetStatePropertyAll(Color(0xffffffff)),
                columns: _buildColumns(),
                rows: _buildRows(context),
              ),
            ),
          ),
        ),
      );
    });
  }

  /// Creates column headers dynamically
  List<DataColumn> _buildColumns() {
    final columnTitles = [
      'S.No', 'Field Name', 'Type', 'Required', 'Show in View', 'Show in Report',
      'Show in Edit', 'Show in Filter', 'Show in List', 'Show in Add', 'Choices',
      'To', 'Min Length', 'Max Length', 'Read Only', 'Max Digits', 'Decimal Places',
      'Range Filter', 'Default', 'Multiple Filter', 'Actions'
    ];

    return columnTitles
        .map((title) => DataColumn(
              label: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ))
        .toList();
  }

  /// Creates rows dynamically based on formFields
  List<DataRow> _buildRows(BuildContext context) {
    if (formFields.isEmpty) return [];

    return formFields.asMap().entries.map((entry) {
      final index = entry.key + 1;
      final fieldData = entry.value;
      final fieldName = fieldData.keys.first;
      final attributes = fieldData[fieldName] as Map<String, dynamic>;

      return DataRow(cells: [
        DataCell(Text(index.toString())),
        DataCell(Text(fieldName)),
        DataCell(Text(attributes['type'].toString())),
        DataCell(Text(attributes['required']?.toString() ?? "-")),
        DataCell(Text(attributes['show_in_view']?.toString() ?? "-")),
        DataCell(Text(attributes['show_in_report']?.toString() ?? "-")),
        DataCell(Text(attributes['show_in_edit']?.toString() ?? "-")),
        DataCell(Text(attributes['show_in_filter']?.toString() ?? "-")),
        DataCell(Text(attributes['show_in_list']?.toString() ?? "-")),
        DataCell(Text(attributes['show_in_add']?.toString() ?? "-")),
        DataCell(_buildChoiceDropdown(attributes, context)),
        DataCell(Text(attributes['to']?.toString() ?? "-")),
        DataCell(Text(attributes['min_length']?.toString() ?? "-")),
        DataCell(Text(attributes['max_length']?.toString() ?? "-")),
        DataCell(Text(attributes['read_only']?.toString() ?? "-")),
        DataCell(Text(attributes['max_digits']?.toString() ?? "-")),
        DataCell(Text(attributes['decimal_places']?.toString() ?? "-")),
        DataCell(Text(attributes['range_filter']?.toString() ?? "-")),
        DataCell(Text(attributes['default']?.toString() ?? "-")),
        DataCell(Text(attributes['multiple_filter']?.toString() ?? "-")),
        DataCell(_buildActionButtons(fieldName, index)),
      ]);
    }).toList();
  }

  /// Builds dropdown for 'Choice' type fields
  Widget _buildChoiceDropdown(Map<String, dynamic> attributes, BuildContext context) {
    if (attributes['type'] == 'Choice' && attributes['choices'] != null) {
      return Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300),
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
      );
    }
    return const Text("-");
  }

  /// Builds action buttons (Edit/Delete)
  Widget _buildActionButtons(String fieldName, int index) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => onEdit(index, formFields[index]),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => onDelete(fieldName),
        ),
      ],
    );
  }
}
