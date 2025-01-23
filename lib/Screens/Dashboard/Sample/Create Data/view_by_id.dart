
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:implementation_panel/BreakPoints/breakpoints.dart';
// import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
// import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
// import 'package:implementation_panel/Screens/Dashboard/custom_appbar.dart';
// import 'package:responsive_toolkit/responsive_grid.dart';

// class DynamicViewById extends StatefulWidget {
//   const DynamicViewById({super.key});

//   @override
//   State<DynamicViewById> createState() => _DynamicViewByIdState();
// }

// class _DynamicViewByIdState extends State<DynamicViewById> {
//   final controller = Get.put(DynamicController());
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return CommonScaffoldWithAppBar(
//       body:  GetBuilder<DynamicController>(
//         initState: (_) => DynamicController.to.initEditState(),
//         builder: (value) =>   SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                         icon: const Icon(Icons.arrow_back),
//                         onPressed: () {
//                           Get.back();
//                         },
//                       ),
//                     Text(
//                       "View & Edit Screen",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   width: Get.width,
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10.0),
//                       border: Border.all(width: 0.5, color: Colors.grey)),
//                   child: ResponsiveRow(runSpacing: 10, spacing: 20, columns: [
//                     ResponsiveColumn(ResponsiveConstants().textFormField,
//                         child: CommonComponents.defaultTextFormField(
//                           context,
//                           title: 'App Label',
//                           hintText: 'Enter App Label',
//                           controller: controller.appLabel,
//                           readOnly: true,
//                           validator: (value) => value?.isEmpty ?? true
//                               ? 'App Label is required'
//                               : null,
//                           keyboardType: TextInputType.text,
//                           textInputAction: TextInputAction.next,
//                         )),
//                     ResponsiveColumn(ResponsiveConstants().textFormField,
//                         child: CommonComponents.defaultTextFormField(
//                           context,
//                           title: 'Model Name',
//                           hintText: 'Enter Model Name',
//                           controller: controller.modelName,
//                           maxLength: 50,
//                           validator: (value) => value?.isEmpty ?? true
//                               ? 'Model Name is required'
//                               : null,
//                           onChange: (val) {
//                             controller.modelName.text = val;
//                             controller.update();
//                           },
//                           keyboardType: TextInputType.text,
//                           textInputAction: TextInputAction.done,
//                         )),
//                   ]),
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: 150,
//                   child: MaterialButton(
//                     onPressed: _handleSubmit,
//                     // onPressed: () {
//                     //   if (formKey.currentState?.validate() ?? false) {
//                     //       final updateData = {
//                     //         "model_name": controller.modelName.text,
//                     //       };
//                     //       controller.updateModelName(updateData);
//                     //     }
//                     // },
//                     height: 50,
//                     color: Theme.of(context).colorScheme.primary,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(6)),
//                     ),
//                     child: Text(
//                       "Update",
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.secondary,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _handleSubmit() {
//     if (formKey.currentState?.validate() ?? false) {
//       final updateData = {
//         "model_name": controller.modelName.text,
//       };
//       controller.updateModelName(updateData);
//     }
//   }
// }
