import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/BreakPoints/breakpoints.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class FieldManagementComponent extends StatelessWidget {
  final String fieldNameText;
  final String fieldNameLabeText;
  final TextEditingController fieldNameController;

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

  final String minLengthText;
  final String minLengthLabeText;
  final TextEditingController minLengthController;

  final String rangeFilterCheckBoxName;
  final bool rangeFilterValue;
  final Function(bool?) rangeFilterOnChanged;

  final String readOnlyCheckBoxName;
  final bool readOnlyValue;
  final Function(bool?) readOnlyOnChanged;

  final String maxDigitsText;
  final String maxDigitsLabeText;
  final TextEditingController maxDigitsController;

  final String decimalText;
  final String decimalLabeText;
  final TextEditingController decimalController;

  final String clearButtonText;
  final VoidCallback clearButtonOnTap;
  final String submitButtonText;
  final VoidCallback submitButtonOnTap;
  
  // final Widget dialogBoxCustomWidget;

   FieldManagementComponent({
    super.key,
    required this.fieldNameText,
    required this.fieldNameController,
    required this.fieldNameLabeText,

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
    
    required this.minLengthText,
    required this.minLengthLabeText,
    required this.minLengthController,
    
    required this.rangeFilterCheckBoxName,
    required this.rangeFilterValue,
    required this.rangeFilterOnChanged,
    
    required this.readOnlyCheckBoxName,
    required this.readOnlyValue,
    required this.readOnlyOnChanged,
    
    required this.maxDigitsText,
    required this.maxDigitsLabeText,
    required this.maxDigitsController,
    
    required this.decimalText,
    required this.decimalLabeText,
    required this.decimalController,
    
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
                if (controller.selectedFieldType == 'Choice')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonComponents.defaultTextFormField(
                            context,
                            controller: choiceController,
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
                if (controller.selectedFieldType != 'Children')
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultCheckBoxListTile(
                              context,
                              value: requiredValue,
                              title: requiredCheckBoxName, onChanged: requiredOnChanged)),
                if (controller.selectedFieldType != 'Children')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showViewCheckBoxName,
                          value: showViewValue,
                          onChanged: showViewOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType != 'Children')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showReportCheckBoxName,
                          value: showReportValue,
                          onChanged: showReportOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType != 'Children')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showEditCheckBoxName,
                          value: showEditValue,
                          onChanged: showEditOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType != 'Children')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child:  CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showFilterCheckBoxName,
                          value: showFilterValue,
                          onChanged: showFilterOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType != 'Children')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child:  CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showListCheckBoxName,
                          value: showListValue,
                          onChanged: showListOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType != 'Children')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showAddCheckBoxName,
                          value: showAddValue,
                          onChanged: showAddOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType == 'ManyToMany')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child: CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: showMultipleFilterCheckBoxName,
                          value: showMultipleFilterValue,
                          onChanged: showMultipleFilterOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType == ' ')
                  ResponsiveColumn(
                    ResponsiveConstants().buttonBreakpoints,
                    child:  CommonComponents.defaultCheckBoxListTile(
                          context,
                          title: defaultCheckBoxName,
                          value: defaultValue,
                          onChanged: defaultOnChanged,
                        ),
                  ),
                if (controller.selectedFieldType == 'Char' ||
                    controller.selectedFieldType == 'Text')
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultTextFormField(
                        context,
                        controller: maxLengthController,
                        hintText: maxLengthText,
                        decoration:  InputDecoration(
                          labelText: maxLengthLabeText,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      )),
                if (controller.selectedFieldType == 'Char' ||
                    controller.selectedFieldType == 'Text')
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultTextFormField(
                        context,
                        controller: minLengthController,
                        hintText: minLengthText,
                        decoration: InputDecoration(
                          labelText: minLengthLabeText,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      )),
                if (controller.selectedFieldType == 'DateTime' ||
                    controller.selectedFieldType == 'Date')
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultCheckBoxListTile(context,
                          value: rangeFilterValue,
                          title: rangeFilterCheckBoxName, onChanged: rangeFilterOnChanged)),
                if (controller.selectedFieldType == 'DateTime' ||
                    controller.selectedFieldType == 'Date' ||
                    controller.selectedFieldType == 'Time' ||
                    controller.selectedFieldType == 'Duration')
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultCheckBoxListTile(context,
                          value: readOnlyValue,
                          title: readOnlyCheckBoxName, onChanged: readOnlyOnChanged)),
                if (controller.selectedFieldType == 'Decimal')
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultTextFormField(
                        context,
                        controller: maxDigitsController,
                        hintText: maxDigitsText,
                        decoration: InputDecoration(
                          labelText: maxDigitsLabeText,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      )),
                if (controller.selectedFieldType == 'Decimal')
                  ResponsiveColumn(ResponsiveConstants().buttonBreakpoints,
                      child: CommonComponents.defaultTextFormField(
                        context,
                        controller: decimalController,
                        hintText: decimalText,
                        decoration: InputDecoration(
                          labelText: decimalLabeText,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      )),

                
              ],
            ),
          ),

          


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
}


class CommonFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool? isRequired;
  final bool? isReadOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;

  const CommonFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.isRequired = false,
    this.isReadOnly = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.suffix,
    this.prefix,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffix,
          prefixIcon: prefix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
          labelStyle: TextStyle(
            color: Colors.grey.shade700,
          ),
        ),
        keyboardType: keyboardType,
        readOnly: isReadOnly!,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        validator: (value) {
          if (isRequired! && (value == null || value.isEmpty)) {
            return '$labelText is required';
          }
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        onChanged: onChanged,
      ),
    );
  }
}

// Optional: Checkbox component that matches the style
class CommonCheckbox extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?) onChanged;

  const CommonCheckbox({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Theme.of(context).primaryColor,
    );
  }
}
