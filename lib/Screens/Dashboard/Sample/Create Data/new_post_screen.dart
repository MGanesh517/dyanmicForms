
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/BreakPoints/breakpoints.dart';
import 'package:implementation_panel/Common/Common%20Components/common_components.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Controller/dynamic_controller.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Create%20Data/build_field_widget.dart';
import 'package:implementation_panel/Screens/Dashboard/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:toastification/toastification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(DynamicController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("printng the id builder ::::: ${controller.dynamicDetails.id}");
    // return LayoutBuilder(builder: (context, constraints) {
    return CommonScaffoldWithAppBar(
      body: GetBuilder<DynamicController>(
        initState: (_) => DynamicController.to.initEditState(),
        builder: (value) => SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                              controller.disposeController();
                            },
                            icon: Icon(Icons.arrow_back,
                                color: Theme.of(context).colorScheme.primary)),
                        Text(
                          controller.dynamicDetails.id != null
                              ? "Edit Data"
                              : "Create Data",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: ResponsiveRow(
                        runSpacing: 10,
                        spacing: 20,
                        columns: [
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.defaultTextFormField(
                              context,
                              title: 'App Label',
                              hintText: 'Enter App Label',
                              readOnly: controller.dynamicDetails.id != null
                                  ? true
                                  : false,
                              controller: controller.appLabel,
                              validator: (String? val) {
                                if (val?.isEmpty ?? true) {
                                  return 'Please enter a valid App Label';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          ResponsiveColumn(ResponsiveConstants().textFormField,
                              child: Obx(() =>
                                  CommonComponents.defaultTextFormField(
                                    context,
                                    title: 'Model Name',
                                    hintText: 'Enter Model Name',
                                    controller: controller.modelName,
                                    onChange: controller.onTextChanged,
                                    decoration: InputDecoration(
                                      hintText: "Enter Model Name",
                                      errorText: controller
                                              .modelNameError.value.isNotEmpty
                                          ? controller.modelNameError.value
                                          : controller.modelValidation.message,
                                    ),
                                    validator: (String? val) {
                                      if (val?.isEmpty ?? true) {
                                        return controller
                                            .modelValidation.status;
                                        // return 'Please enter a valid Model Name';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    suffixIcon: Obx(() =>
                                        controller.isModelNameValid.value
                                            ? const Icon(Icons.check_circle,
                                                color: Colors.green)
                                            : controller.modelNameError.value
                                                    .isNotEmpty
                                                ? const Icon(Icons.error,
                                                    color: Colors.red)
                                                : const SizedBox.shrink()),
                                  ))),

                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child: CommonComponents.defaultTextFormField(
                              context,
                              title: 'Verbose Name',
                              hintText: 'Enter Verbose Name',
                              controller: controller.verboseName,
                              validator: (String? val) {
                                if (val?.isEmpty ?? true) {
                                  return 'Please enter a valid Verbose Name';
                                }
                                return null;
                              },
                              onChange: (val) =>
                                  controller.updateVerboseNamePlural(),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          ResponsiveColumn(
                            ResponsiveConstants().textFormField,
                            child:
                                Obx(() => CommonComponents.defaultTextFormField(
                                      context,
                                      title: 'Verbose Name Plural',
                                      hintText: 'Enter Verbose Name Plural',
                                      controller: TextEditingController(
                                          text: controller
                                              .verboseNamePlural.value),
                                      // readOnly: true,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                    )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text("Add Fields",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.primary)),
                    const SizedBox(height: 16),

// Then modify your Stepper widget

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      padding: EdgeInsets.all(14.0),
                      child: Obx(() => Stepper(

                        onStepTapped: (value) => controller.currentStep.value = value,
                            connectorColor: WidgetStatePropertyAll(Colors.orange.shade300),
                            connectorThickness: 2.5,
                            type: StepperType.vertical,
                            currentStep: controller.currentStep.value,
                            onStepCancel: () {
                              if (controller.currentStep.value > 0) {
                                controller.currentStep.value--;
                              }
                            },
                            onStepContinue: () {
                              if (controller.currentStep.value < 1) {
                                controller.currentStep.value++;
                              }
                            },
                            steps: [
                              Step(
                                state: StepState.indexed,
                                isActive: controller.currentStep.value >= 0,
                                label: Text("Add Fields"),
                                title: Text("Fields"),
                                content: Column(
                                  children: [
                                    BuildFieldWidget()
                                  ],
                                ),
                              ),
                              Step(
                                state: StepState.indexed,
                                isActive: controller.currentStep.value >= 1,
                                title: Text("Rules"),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // buildFieldList(),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),

                    Column(
                      children: [

//////////////////////////////////////////     Submit Button     ///////////////////////////////////////////
                        Column(
                          children: [
                            SizedBox(height: 10.0),
                            // buildFieldList(),
                            // DynamicFieldDataTable(
                            //   formFields: controller.formFields,
                            //   onEdit: (index, field) {
                            //     controller.editField(index, field);
                            //   },
                            //   onDelete: (fieldName) {
                            //     controller.deleteField(fieldName);
                            //   },
                            // ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 150,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    child: MaterialButton(
                                      elevation: 2,
                                      onPressed: () {
                                        if (formKey.currentState?.validate() ??
                                            false) {
                                          if (controller.dynamicDetails.id !=
                                              null) {
                                            controller.updateModelName({
                                              // "app_label": controller.appLabel.text,
                                              // "model_name": controller.modelName.text,
                                              // "fields": jsonEncode(controller.formFields.fold<Map<String, dynamic>>(
                                              //   {},
                                              //   (map, element) => {...map, ...element},
                                              // ))
                                            });
                                          } else {
                                            controller.createDynamicData();
                                            toastification.show(
                                              context: context,
                                              title: Text('Data Submitted Successfully.',
                                                  style: TextStyle(fontWeight: FontWeight.w500)),
                                              type: ToastificationType.success,
                                              // icon: Icon(Icons.close_rounded),
                                              closeButtonShowType: CloseButtonShowType.always,
                                              showIcon: true,
                                              style: ToastificationStyle.minimal,
                                              progressBarTheme: ProgressIndicatorThemeData(linearMinHeight: 1),
                                              autoCloseDuration: const Duration(seconds: 5),
                                            );
                                            //                             showSnackBar(
                                            //   title: 'Success',
                                            //   message: 'Data Submitted Successfully.',
                                            //   icon: Icon(Icons.check, color: Colors.green),
                                            // );
                                          }
                                        }
                                      },
                                      height: 50,
                                      minWidth: 100,
                                      color: Theme.of(context).colorScheme.primary,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(6)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.secondary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
