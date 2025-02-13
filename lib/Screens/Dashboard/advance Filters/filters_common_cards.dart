import 'package:flutter/material.dart';

class FilterCommonDropdown extends StatelessWidget {
  final String? typeHintText;
  final String? typeValue;
  final List<DropdownMenuItem<String>> typeItems;
  final Function(String?) typeOnChanged;
  final String? Function(String?)? typeValidator;

  const FilterCommonDropdown(
      {super.key,
      this.typeHintText,
      this.typeValue,
      required this.typeItems,
      required this.typeOnChanged,
      this.typeValidator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton<String>(
        hint: Text(typeHintText!),
        focusColor: Theme.of(context).colorScheme.secondary,
        underline: Container(color: Theme.of(context).colorScheme.secondary),
        isExpanded: true,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        menuMaxHeight: 350,
        borderRadius: BorderRadius.circular(10.0),
        dropdownColor: Theme.of(context).colorScheme.secondary,
        value: typeValue,
        items: typeItems,
        onChanged: typeOnChanged,
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  const CommonButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        color: Theme.of(context).colorScheme.secondary,
        child: MaterialButton(
          elevation: 2,
          onPressed: onPressed,
          height: 50,
          minWidth: 100,
          color: Theme.of(context).colorScheme.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon!, color: Theme.of(context).colorScheme.secondary),
                Text(
                  text,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
