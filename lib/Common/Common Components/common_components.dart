import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';




// Optional: Dropdown component that matches the style
class CommonDropdown<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final Function(T?) onChanged;
  final String? Function(T?)? validator;

  const CommonDropdown({
    Key? key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<T>(
        value: value,
        items: items,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
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
        ),
      ),
    );
  }
}



class CommonComponents {
  static Column defaultTextField(context,
      {TextEditingController? controller,
      String? title = '',
      String? hintText,
      String? errorText,
      String? initialValue,
      bool? readOnly = false,
      bool? enable = true,
      bool? filled = false,
      Widget? prefixIcon,
      Widget? suffixIcon,
      int? maxLength,
      // int? maxLines,
      // int? minLines,
      bool? obscureText = false,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      TextInputType? keyboardType,
      FocusNode? focusNode,
      TextCapitalization? textCapitalization,
      TextAlign? textAlign = TextAlign.left,
      InputDecoration? decoration,
      validator,
      void Function(String?)? onSaved,
      void Function()? onTap,
      void Function()? onEditingComplete,
      void Function(String)? onChange,
      void Function(String)? onFieldSubmitted}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != ''
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  Container(
                    height: 8,
                  ),
                ],
              )
            : Container(),
        TextFormField(
          autofocus: false,
          maxLength: maxLength,
          readOnly: readOnly!,
          enabled: enable,
          initialValue: initialValue,
          controller: controller,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          focusNode: focusNode,
          textInputAction: textInputAction,
          // maxLines: maxLines,
          // minLines: minLines,
          textAlign: textAlign!,
          obscureText: obscureText!,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatters,
          cursorColor: Theme.of(context).colorScheme.primary,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              // contentPadding: EdgeInsets.symmetric(horizontal: 0),
              // label: Text(
              //   title!,
              //   style: TextStyle(color: Theme.of(context).colorScheme.surface, fontWeight: FontWeight.w500, fontSize: 12),
              // ),
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              // floatingLabelAlignment: FloatingLabelAlignment.start,
              counterText: '',
              hintText: hintText,
              errorStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.red),
              hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondaryContainer,
              suffixIconConstraints: BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 60),
              prefixIconConstraints: BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 100),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide.none),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide.none)),
          onChanged: onChange,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          onTap: onTap,
          validator: validator,
          onEditingComplete: onEditingComplete,
        ),
        errorText != null
            ? Column(
                children: [
                  Container(
                    height: 2,
                  ),
                  Text(
                    errorText,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: Colors.red),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }

  static Column defaultTextFormField(
  BuildContext context, {
  TextEditingController? controller,
  String? title = '',
  String? hintText,
  String? errorText,
  String? initialValue,
  bool readOnly = false,
  bool enable = true,
  Widget? prefixIcon,
  Widget? suffixIcon,
  int? maxLength,
  bool obscureText = false,
  List<TextInputFormatter>? inputFormatters,
  TextInputAction? textInputAction,
  TextInputType? keyboardType,
  FocusNode? focusNode,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextAlign textAlign = TextAlign.left,
  InputDecoration? decoration,
  String? Function(String?)? validator,
  void Function(String?)? onSaved,
  void Function()? onTap,
  void Function()? onEditingComplete,
  void Function(String)? onChange,
  void Function(String)? onFieldSubmitted,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != '')
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      TextFormField(
        controller: controller,
        maxLength: maxLength,
        readOnly: readOnly,
        enabled: enable,
        initialValue: initialValue,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        focusNode: focusNode,
        textInputAction: textInputAction,
        textAlign: textAlign,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
        ),
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey[500],
          ),
          counterText: '',
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red, width: 1.5),
          ),
        ),
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTap: onTap,
        validator: validator,
        onEditingComplete: onEditingComplete,
      ),
      if (errorText != null)
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            errorText,
            style: TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
        ),
    ],
  );
}


  static CheckboxListTile defaultCheckBoxListTile(
    BuildContext context, {
    required bool value,
    String? title,
    required ValueChanged<bool?> onChanged,
    Color? activeColor,
    Color? checkColor,
    Color? titleColor,
    TextStyle? titleStyle,
    EdgeInsets? padding,
    ListTileControlAffinity controlAffinity = ListTileControlAffinity.leading,
  }) {
    return CheckboxListTile(
      value: value,
      title: Text(
        title!,
        style: titleStyle ??
            TextStyle(
              // color: titleColor ?? Theme.of(context).colorScheme.primary,
              color: titleColor ?? Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
      ),
      activeColor: activeColor ?? Theme.of(context).colorScheme.primary,
      checkColor: checkColor ?? Colors.white,
      onChanged: onChanged,
      controlAffinity: controlAffinity,
      contentPadding: padding ?? EdgeInsets.zero, // Optional padding
    );
  }


  static AlertDialog showAlertDialog(
      BuildContext context, {
    required String title,
    required String message,
    required Widget icon,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(height: 20),
            Text(message),
          ],
        ),
        actions: [
          if (onCancel != null)
            TextButton(
              onPressed: () {
                Get.back();
                onCancel();
              },
              child: Text('Cancel'),
            ),
          if (onConfirm != null)
            TextButton(
              onPressed: () {
                Get.back();
                onConfirm();
              },
              child: Text('Confirm'),
            ),
        ],
      ),
    );
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(height: 20),
          Text(message),
        ],
      ),
      actions: [
        if (onCancel != null)
          TextButton(
            onPressed: () {
              Get.back();
              onCancel();
            },
            child: Text('Cancel'),
          ),
        if (onConfirm != null)
          TextButton(
            onPressed: () {
              Get.back();
              onConfirm();
            },
            child: Text('Confirm'),
          ),
      ],
    );
  }
      // Dialog(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15),
      //   ),
      //   child: Container(
      //     width: Get.width * 0.8, // 80% of screen width
      //     padding: const EdgeInsets.all(20),
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         // Icon
      //         Container(
      //           height: 60,
      //           width: 60,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             boxShadow: [
      //               BoxShadow(
      //                 color: const Color.fromRGBO(89, 89, 89, 1.0).withOpacity(0.4),
      //                 spreadRadius: 2,
      //                 blurRadius: 8,
      //                 offset: const Offset(0, 2),
      //               ),
      //             ],
      //             color: Colors.white,
      //           ),
      //           child: icon,
      //         ),
      //         const SizedBox(height: 20),

      //         // Title
      //         Text(
      //           title,
      //           style: const TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 18,
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //         const SizedBox(height: 10),

      //         // Message
      //         Text(
      //           message,
      //           style: const TextStyle(
      //             fontSize: 14,
      //             color: Colors.grey,
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //         const SizedBox(height: 20),

      //         // Buttons
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             // Cancel Button
      //             if (onCancel != null)
      //               ElevatedButton(
      //                 onPressed: () {
      //                   Get.back(); // Close dialog
      //                   onCancel();
      //                 },
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor: Colors.grey.shade300,
      //                 ),
      //                 child: const Text(
      //                   'Cancel',
      //                   style: TextStyle(color: Colors.black),
      //                 ),
      //               ),

      //             // Confirm Button
      //             if (onConfirm != null)
      //               ElevatedButton(
      //                 onPressed: () {
      //                   Get.back(); // Close dialog
      //                   onConfirm();
      //                 },
      //                 child: const Text('Confirm'),
      //               ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // )

  static Column defaultDropdownSearch<T>(context,
      {Key? key,
      //   TextEditingController? controller,
      String? title,
      String? hintText,
      bool? enabled,
      // List<T>? items,
      validator,
     Future<List<T>> Function(String, LoadProps?)? items,
      compareFn,
      itemAsString,
      selectedItem,
      onChanged,
      itemBuilder,
      bool? showTitle = true,
      bool? showBottomSheet = true,
      }) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Visibility(
        visible: showTitle == true ? true : false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500, fontSize: 10)),
            Container(height: 8),
          ],
        ),
      ),
      DropdownSearch<T>(
         autoValidateMode: AutovalidateMode.onUserInteraction,
          items: items,
          key: ValueKey(title),
          suffixProps: DropdownSuffixProps(
            dropdownButtonProps: DropdownButtonProps(
                iconOpened: Icon(Icons.keyboard_arrow_down),
                iconClosed:Icon(Icons.keyboard_arrow_down)),
          ),
          validator: validator,
          compareFn: compareFn,
          enabled: enabled ?? true,
          decoratorProps: DropDownDecoratorProps(
            baseStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          
             decoration: InputDecoration(
              // constraints: BoxConstraints(maxHeight: Get.height * 40 / 896, minHeight: Get.height * 40 / 896),
              floatingLabelAlignment: FloatingLabelAlignment.start, floatingLabelBehavior: FloatingLabelBehavior.always, labelText: title,
        
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryFixed), borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(153, 153, 169, 1)), borderRadius: BorderRadius.circular(8)),
              hintText: "$title",
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primaryFixed),
              contentPadding: const EdgeInsets.fromLTRB(15, 13, 15, 12),
              // suffixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 60),
              // prefixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 40),
            ),
          ),
          
    popupProps: showBottomSheet==false?PopupProps.menu(
    fit: FlexFit.loose, constraints: BoxConstraints())
          :PopupPropsMultiSelection.modalBottomSheet(
        showSelectedItems: true,
        showSearchBox: true,
        itemBuilder: itemBuilder,
        fit: FlexFit.tight,
        searchFieldProps: const TextFieldProps(
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Color(0xffFAFAFF),
              // border: OutlineInputBorder(
              //     borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
              suffixIcon: Icon(Icons.search),
              // labelText: 'Search Here',
              // labelStyle:  TextStyle(fontSize: 16),
              // floatingLabelAlignment: FloatingLabelAlignment.start,
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: 'Search Here',
            )),
        modalBottomSheetProps: ModalBottomSheetProps(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            )),
        title: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            // boxShadow:  [BoxShadow(color: Theme.of(context).colorScheme.secondary, blurRadius: 10.0)],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        )
    ),
        //   popupProps: PopupPropsMultiSelection.modalBottomSheet(
        //       showSelectedItems: true,
        //       showSearchBox: true,
        //       itemBuilder: itemBuilder,
        //       fit: FlexFit.tight,
        //       searchFieldProps: const TextFieldProps(
        //           decoration: InputDecoration(
        //         border: InputBorder.none,
        //         filled: true,
        //         fillColor: Color(0xffFAFAFF),
        //         // border: OutlineInputBorder(
        //         //     borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
        //         suffixIcon: Icon(Icons.search),
        //         // labelText: 'Search Here',
        //         // labelStyle:  TextStyle(fontSize: 16),
        //         // floatingLabelAlignment: FloatingLabelAlignment.start,
        //         // floatingLabelBehavior: FloatingLabelBehavior.always,
        //         hintText: 'Search Here',
        //       )),
        //       modalBottomSheetProps: ModalBottomSheetProps(
        //           backgroundColor: Theme.of(context).colorScheme.secondary,
        //           shape: const RoundedRectangleBorder(
        //             borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(25),
        //               topRight: Radius.circular(25),
        //             ),
        //           )),
        //       title: Container(
        //         height: 50,
        //         decoration: BoxDecoration(
        //           color: Theme.of(context).colorScheme.primary,
        //           borderRadius: const BorderRadius.only(
        //             topLeft: Radius.circular(25),
        //             topRight: Radius.circular(25),
        //           ),
        //           // boxShadow:  [BoxShadow(color: Theme.of(context).colorScheme.secondary, blurRadius: 10.0)],
        //         ),
        //         child: Center(
        //           child: Text(
        //             title,
        //             style: TextStyle(
        //               fontSize: 24,
        //               fontWeight: FontWeight.bold,
        //               color: Theme.of(context).colorScheme.secondary,
        //             ),
        //           ),
        //         ),
        //       )
        // ),
          itemAsString: itemAsString,
          selectedItem: selectedItem,
          onChanged: onChanged),
      // const SizedBox(height: 24)
    ]);
  }


  // static Column defaultMultiSelectionDropdownSearch<T>(context,
  //     {Key? key,
  //       //   TextEditingController? controller,
  //       String? title,
  //       String? hintText,
  //       bool? enabled,
  //       List<T>? items,
  //       validator,
  //       Future<List<T>> Function(String)? asyncItems,
  //       compareFn,
  //       itemAsString,
  //       selectedItem,
  //       onChanged,
  //       itemBuilder,
  //       bool? showTitle = true,
  //       bool? underLineBorder = false}) {
  //   return Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Visibility(
  //           visible: showTitle == true ? true : false,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(title!, style: Theme.of(context).textTheme.labelMedium),
  //               Container(height: 8),
  //             ],
  //           ),
  //         ),
  //         DropdownSearch<T>.multiSelection(
  //             autoValidateMode: AutovalidateMode.onUserInteraction,
  //             asyncItems: asyncItems ?? asyncItems,
  //             items: items ?? [],
  //             key: ValueKey(title),
  //             dropdownButtonProps: const DropdownButtonProps(
  //                 icon: Icon(Icons.keyboard_arrow_down)),
  //             // clearButtonProps: const ClearButtonProps(isVisible: true),
  //             validator: validator,
  //             compareFn: compareFn,
  //             enabled: enabled ?? true,
  //             dropdownDecoratorProps: DropDownDecoratorProps(
  //               dropdownSearchDecoration: InputDecoration(
  //                 border: OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color: Theme.of(context).colorScheme.primary),
  //                     borderRadius: BorderRadius.circular(25)),
  //                 enabledBorder: underLineBorder == true
  //                     ? UnderlineInputBorder(
  //                   borderSide: BorderSide(
  //                       color: Theme.of(context).colorScheme.primary),
  //                 )
  //                     : OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color: Theme.of(context).colorScheme.primary),
  //                     borderRadius: BorderRadius.circular(25)),
  //                 focusedBorder: underLineBorder == true
  //                     ? UnderlineInputBorder(
  //                   borderSide: BorderSide(
  //                       color: Theme.of(context).colorScheme.primary),
  //                 )
  //                     : OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color: Theme.of(context).colorScheme.primary),
  //                     borderRadius: BorderRadius.circular(25)),
  //                 disabledBorder: underLineBorder == true
  //                     ? UnderlineInputBorder(
  //                   borderSide: BorderSide(
  //                       color: Theme.of(context).colorScheme.primary),
  //                 )
  //                     : OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color: Theme.of(context).colorScheme.primary),
  //                     borderRadius: BorderRadius.circular(25)),
  //                 errorBorder: underLineBorder == true
  //                     ? UnderlineInputBorder(
  //                   borderSide: BorderSide(
  //                       color: Theme.of(context).colorScheme.primary),
  //                 )
  //                     : OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color: Theme.of(context).colorScheme.primary),
  //                     borderRadius: BorderRadius.circular(25)),
  //                 focusedErrorBorder: underLineBorder == true
  //                     ? UnderlineInputBorder(
  //                   borderSide: BorderSide(
  //                       color: Theme.of(context).colorScheme.primary),
  //                 )
  //                     : OutlineInputBorder(
  //                     borderSide: BorderSide(
  //                         color: Theme.of(context).colorScheme.primary),
  //                     borderRadius: BorderRadius.circular(25)),
  //                 // border: OutlineInputBorder(
  //                 //     borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
  //                 // labelText: title,
  //                 filled: true,
  //                 fillColor: enabled == true
  //                     ? Colors.white.withOpacity(0.2)
  //                     : Theme.of(context)
  //                     .colorScheme
  //                     .secondaryContainer
  //                     .withOpacity(0.2),
  //                 labelStyle:  TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
  //                 floatingLabelAlignment: FloatingLabelAlignment.start,
  //                 floatingLabelBehavior: FloatingLabelBehavior.always,
  //                 hintText: "Select $title",
  //                 hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
  //                 counterStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
  //                 // filled: true,
  //                 // fillColor: Colors.grey[100],
  //               ),
  //             ),
  //             popupProps: PopupPropsMultiSelection.modalBottomSheet(
  //                 showSelectedItems: true,
  //                 showSearchBox: true,
  //                 itemBuilder: itemBuilder,
  //                 fit: FlexFit.tight,
  //                 searchFieldProps: TextFieldProps(
  //                     decoration: InputDecoration(
  //                       enabled: true,
  //                       border: OutlineInputBorder(
  //                           borderSide: BorderSide(
  //                               color:
  //                               Theme.of(context).colorScheme.primaryContainer),
  //                           borderRadius: BorderRadius.circular(15)),
  //                       suffixIcon: const Icon(Icons.search),
  //                       // labelText: 'Search Here',
  //                       // labelStyle: const TextStyle(fontSize: 16),
  //                       // floatingLabelAlignment: FloatingLabelAlignment.start,
  //                       // floatingLabelBehavior: FloatingLabelBehavior.always,
  //                       hintText: 'Search Here',
  //                     )),
  //                 modalBottomSheetProps: ModalBottomSheetProps(
  //                     backgroundColor:
  //                     Theme.of(context).colorScheme.secondaryContainer,
  //                     shape: const RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.only(
  //                         topLeft: Radius.circular(25),
  //                         topRight: Radius.circular(25),
  //                       ),
  //                     )),
  //                 title: Container(
  //                   height: 50,
  //                   decoration: BoxDecoration(
  //                     color: Theme.of(context).colorScheme.primary,
  //                     borderRadius: const BorderRadius.only(
  //                       topLeft: Radius.circular(25),
  //                       topRight: Radius.circular(25),
  //                     ),
  //                     // boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 10.0)],
  //                   ),
  //                   child: Center(
  //                     child: Text(
  //                       title,
  //                       style: const TextStyle(
  //                         fontSize: 24,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ),
  //                 )),
  //             itemAsString: itemAsString,
  //             selectedItems: selectedItem,
  //             // selectedItem: selectedItem,
  //             onChanged: onChanged)
  //       ]);
  // }




  
}



// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class CommonComponents {
//   static Row defaultSwitch(
//     BuildContext context, {
//      bool value = false,
//     required String title,
//     ValueChanged<bool>? onChanged,
//     String? subtitle,
//     bool enabled = true,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                   color: Theme.of(context).colorScheme.surface,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 14),
//             ),
//             if (subtitle != null)
//               Text(
//                 subtitle,
//                 style: TextStyle(
//                   color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
//                   fontSize: 12,
//                 ),
//               ),
//           ],
//         ),
//         Switch(
//           value: value,
//           onChanged: enabled ? onChanged : null,
//           activeColor: Theme.of(context).colorScheme.primary,
//           inactiveThumbColor:
//               enabled ? Theme.of(context).colorScheme.onSurface : Colors.grey,
//         ),
//       ],
//     );
//   }

//   static Column defaultTextField(context,
//       {TextEditingController? controller,
//       String? title = '',
//       String? hintText,
//       String? errorText,
//       String? initialValue,
//       bool? readOnly = false,
//       bool? enable = true,
//       bool? filled = false,
//       Widget? prefixIcon,
//       Widget? suffixIcon,
//       int? maxLength,
//       // int? maxLines,
//       // int? minLines,
//       bool? obscureText = false,
//       List<TextInputFormatter>? inputFormatters,
//       TextInputAction? textInputAction,
//       TextInputType? keyboardType,
//       FocusNode? focusNode,
//       TextCapitalization? textCapitalization,
//       TextAlign? textAlign = TextAlign.left,
//       InputDecoration? decoration,
//       validator,
//       void Function(String?)? onSaved,
//       void Function()? onTap,
//       void Function()? onEditingComplete,
//       void Function(String)? onChange,
//       void Function(String)? onFieldSubmitted}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         title != ''
//             ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title!,
//                     style: TextStyle(
//                         color: Theme.of(context).colorScheme.surface,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 13),
//                   ),
//                   Container(
//                     height: 8,
//                   ),
//                 ],
//               )
//             : Container(),
//         TextFormField(
//           autofocus: false,
//           maxLength: maxLength,
//           readOnly: readOnly!,
//           enabled: enable,
//           initialValue: initialValue,
//           controller: controller,
//           textCapitalization: textCapitalization ?? TextCapitalization.none,
//           focusNode: focusNode,
//           textInputAction: textInputAction,
//           // maxLines: maxLines,
//           // minLines: minLines,
//           textAlign: textAlign!,
//           obscureText: obscureText!,
//           keyboardType: keyboardType,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           inputFormatters: inputFormatters,
//           cursorColor: Theme.of(context).colorScheme.primary,
//           style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(horizontal: 5),
//               // label: Text(
//               //   title!,
//               //   style: TextStyle(color: Theme.of(context).colorScheme.surface, fontWeight: FontWeight.w500, fontSize: 12),
//               // ),
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               floatingLabelAlignment: FloatingLabelAlignment.start,
//               counterText: '',
//               hintText: hintText,
//               errorStyle: TextStyle(
//                   fontSize: 10,
//                   fontWeight: FontWeight.normal,
//                   color: Colors.red),
//               hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//               prefixIcon: prefixIcon,
//               suffixIcon: suffixIcon,
//               filled: true,
//               fillColor: Theme.of(context).colorScheme.secondaryContainer,
//               suffixIconConstraints: BoxConstraints(
//                   minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 60),
//               prefixIconConstraints: BoxConstraints(
//                   minHeight: 10, minWidth: 50, maxHeight: 20, maxWidth: 100),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide:
//                       BorderSide(strokeAlign: BorderSide.strokeAlignOutside)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide(
//                       strokeAlign: BorderSide.strokeAlignOutside,
//                       color: Theme.of(context).colorScheme.primary,
//                       width: 2)),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                   borderSide: BorderSide.none)),
//           onChanged: onChange,
//           onFieldSubmitted: onFieldSubmitted,
//           onSaved: onSaved,
//           onTap: onTap,
//           validator: validator,
//           onEditingComplete: onEditingComplete,
//         ),
//         errorText != null
//             ? Column(
//                 children: [
//                   Container(
//                     height: 2,
//                   ),
//                   Text(
//                     errorText,
//                     style: TextStyle(
//                         fontSize: 10,
//                         fontWeight: FontWeight.normal,
//                         color: Colors.red),
//                   ),
//                 ],
//               )
//             : Container(),
//       ],
//     );
//   }

//   static Column defaultDropdownSearch<T>(context,
//       {Key? key,
//       //   TextEditingController? controller,
//       String? title,
//       String? hintText,
//       bool? enabled,
//       List<T>? items,
//       validator,
//       Future<List<T>> Function(String)? asyncItems,
//       compareFn,
//       itemAsString,
//       selectedItem,
//       onChanged,
//       itemBuilder,
//       bool? showTitle = true,
//       bool? showBottomSheet = true,
//       }) {
//     return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Visibility(
//         visible: showTitle == true ? true : false,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title!, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500, fontSize: 10)),
//             Container(height: 8),
//           ],
//         ),
//       ),
//       DropdownSearch<T>(
//           autoValidateMode: AutovalidateMode.onUserInteraction,
//           asyncItems: asyncItems ?? asyncItems,
//           items: items ?? [],
//           key: ValueKey(title),
//           dropdownButtonProps: const DropdownButtonProps(icon: Icon(Icons.keyboard_arrow_down)),
//           // clearButtonProps:  ClearButtonProps(isVisible: true),
//           validator: validator,
//           compareFn: compareFn,
//           enabled: enabled ?? true,
//           dropdownDecoratorProps: DropDownDecoratorProps(
//             dropdownSearchDecoration: InputDecoration(
//               border: InputBorder.none,

//               // border: OutlineInputBorder(
//               //     borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
//               // labelText: title,
//               filled: true,
//               fillColor: Theme.of(context).colorScheme.secondaryContainer,
//               labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//               hintStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
//               floatingLabelAlignment: FloatingLabelAlignment.start,
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               hintText: "Select $title",
//               // filled: true,
//               // fillColor: Colors.grey[100],
//             ),
//           ),
//     popupProps: showBottomSheet==false?PopupProps.menu(
//     fit: FlexFit.loose, constraints: BoxConstraints())
//           :PopupPropsMultiSelection.modalBottomSheet(
//         showSelectedItems: true,
//         showSearchBox: true,
//         itemBuilder: itemBuilder,
//         fit: FlexFit.tight,
//         searchFieldProps: const TextFieldProps(
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               filled: true,
//               fillColor: Color(0xffFAFAFF),
//               // border: OutlineInputBorder(
//               //     borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
//               suffixIcon: Icon(Icons.search),
//               // labelText: 'Search Here',
//               // labelStyle:  TextStyle(fontSize: 16),
//               // floatingLabelAlignment: FloatingLabelAlignment.start,
//               // floatingLabelBehavior: FloatingLabelBehavior.always,
//               hintText: 'Search Here',
//             )),
//         modalBottomSheetProps: ModalBottomSheetProps(
//             backgroundColor: Theme.of(context).colorScheme.secondary,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(25),
//                 topRight: Radius.circular(25),
//               ),
//             )),
//         title: Container(
//           height: 50,
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.primary,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(25),
//               topRight: Radius.circular(25),
//             ),
//             // boxShadow:  [BoxShadow(color: Theme.of(context).colorScheme.secondary, blurRadius: 10.0)],
//           ),
//           child: Center(
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Theme.of(context).colorScheme.secondary,
//               ),
//             ),
//           ),
//         )
//     ),
//         //   popupProps: PopupPropsMultiSelection.modalBottomSheet(
//         //       showSelectedItems: true,
//         //       showSearchBox: true,
//         //       itemBuilder: itemBuilder,
//         //       fit: FlexFit.tight,
//         //       searchFieldProps: const TextFieldProps(
//         //           decoration: InputDecoration(
//         //         border: InputBorder.none,
//         //         filled: true,
//         //         fillColor: Color(0xffFAFAFF),
//         //         // border: OutlineInputBorder(
//         //         //     borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
//         //         suffixIcon: Icon(Icons.search),
//         //         // labelText: 'Search Here',
//         //         // labelStyle:  TextStyle(fontSize: 16),
//         //         // floatingLabelAlignment: FloatingLabelAlignment.start,
//         //         // floatingLabelBehavior: FloatingLabelBehavior.always,
//         //         hintText: 'Search Here',
//         //       )),
//         //       modalBottomSheetProps: ModalBottomSheetProps(
//         //           backgroundColor: Theme.of(context).colorScheme.secondary,
//         //           shape: const RoundedRectangleBorder(
//         //             borderRadius: BorderRadius.only(
//         //               topLeft: Radius.circular(25),
//         //               topRight: Radius.circular(25),
//         //             ),
//         //           )),
//         //       title: Container(
//         //         height: 50,
//         //         decoration: BoxDecoration(
//         //           color: Theme.of(context).colorScheme.primary,
//         //           borderRadius: const BorderRadius.only(
//         //             topLeft: Radius.circular(25),
//         //             topRight: Radius.circular(25),
//         //           ),
//         //           // boxShadow:  [BoxShadow(color: Theme.of(context).colorScheme.secondary, blurRadius: 10.0)],
//         //         ),
//         //         child: Center(
//         //           child: Text(
//         //             title,
//         //             style: TextStyle(
//         //               fontSize: 24,
//         //               fontWeight: FontWeight.bold,
//         //               color: Theme.of(context).colorScheme.secondary,
//         //             ),
//         //           ),
//         //         ),
//         //       )
//         // ),
//           itemAsString: itemAsString,
//           selectedItem: selectedItem,
//           onChanged: onChanged),
//       // const SizedBox(height: 24)
//     ]);
//   }

//   static Column defaultMultiSelectionDropdownSearch<T>(context,
//       {Key? key,
//         //   TextEditingController? controller,
//         String? title,
//         String? hintText,
//         bool? enabled,
//         List<T>? items,
//         validator,
//         Future<List<T>> Function(String)? asyncItems,
//         compareFn,
//         itemAsString,
//         selectedItem,
//         onChanged,
//         itemBuilder,
//         bool? showTitle = true,
//         bool? underLineBorder = false}) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Visibility(
//             visible: showTitle == true ? true : false,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title!, style: Theme.of(context).textTheme.labelMedium),
//                 Container(height: 8),
//               ],
//             ),
//           ),
//           DropdownSearch<T>.multiSelection(
//               autoValidateMode: AutovalidateMode.onUserInteraction,
//               asyncItems: asyncItems ?? asyncItems,
//               items: items ?? [],
//               key: ValueKey(title),
//               dropdownButtonProps: const DropdownButtonProps(
//                   icon: Icon(Icons.keyboard_arrow_down)),
//               // clearButtonProps: const ClearButtonProps(isVisible: true),
//               validator: validator,
//               compareFn: compareFn,
//               enabled: enabled ?? true,
//               dropdownDecoratorProps: DropDownDecoratorProps(
//                 dropdownSearchDecoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   enabledBorder: underLineBorder == true
//                       ? UnderlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context).colorScheme.primary),
//                   )
//                       : OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   focusedBorder: underLineBorder == true
//                       ? UnderlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context).colorScheme.primary),
//                   )
//                       : OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   disabledBorder: underLineBorder == true
//                       ? UnderlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context).colorScheme.primary),
//                   )
//                       : OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   errorBorder: underLineBorder == true
//                       ? UnderlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context).colorScheme.primary),
//                   )
//                       : OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   focusedErrorBorder: underLineBorder == true
//                       ? UnderlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context).colorScheme.primary),
//                   )
//                       : OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Theme.of(context).colorScheme.primary),
//                       borderRadius: BorderRadius.circular(25)),
//                   // border: OutlineInputBorder(
//                   //     borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
//                   // labelText: title,
//                   filled: true,
//                   fillColor: enabled == true
//                       ? Colors.white.withOpacity(0.2)
//                       : Theme.of(context)
//                       .colorScheme
//                       .secondary
//                       .withOpacity(0.2),
//                   labelStyle:  TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
//                   floatingLabelAlignment: FloatingLabelAlignment.start,
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   hintText: "Select $title",
//                   hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
//                   counterStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
//                   // filled: true,
//                   // fillColor: Colors.grey[100],
//                 ),
//               ),
//               popupProps: PopupPropsMultiSelection.modalBottomSheet(
//                   showSelectedItems: true,
//                   showSearchBox: true,
//                   itemBuilder: itemBuilder,
//                   fit: FlexFit.tight,
//                   searchFieldProps: TextFieldProps(
//                       decoration: InputDecoration(
//                         enabled: true,
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color:
//                                 Theme.of(context).colorScheme.primaryContainer),
//                             borderRadius: BorderRadius.circular(15)),
//                         suffixIcon: const Icon(Icons.search),
//                         // labelText: 'Search Here',
//                         // labelStyle: const TextStyle(fontSize: 16),
//                         // floatingLabelAlignment: FloatingLabelAlignment.start,
//                         // floatingLabelBehavior: FloatingLabelBehavior.always,
//                         hintText: 'Search Here',
//                       )),
//                   modalBottomSheetProps: ModalBottomSheetProps(
//                       backgroundColor:
//                       Theme.of(context).colorScheme.secondaryContainer,
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(25),
//                           topRight: Radius.circular(25),
//                         ),
//                       )),
//                   title: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).colorScheme.primary,
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(25),
//                         topRight: Radius.circular(25),
//                       ),
//                       // boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 10.0)],
//                     ),
//                     child: Center(
//                       child: Text(
//                         title,
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   )),
//               itemAsString: itemAsString,
//               selectedItems: selectedItem,
//               // selectedItem: selectedItem,
//               onChanged: onChanged)
//         ]);
//   }
// }
