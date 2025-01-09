import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/Common/common_service.dart';
import 'package:implementation_panel/Common/snackbar_widget.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/get_dynamic_data_model.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/post_dynamic_data_model.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Repo/dynamic_repo.dart';
import 'package:implementation_panel/utils/loader_util.dart';

class DynamicController extends GetxController{
  static DynamicController get to => Get.find();
  var commonService = CommonService.instance;

  initPostDynamicData() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      postDynamicData = '';
      submit = false;
    });
  }

  RxBool required = false.obs;
  RxBool readonly = false.obs;


  TextEditingController appLabel = TextEditingController();
  TextEditingController modelName = TextEditingController();
  TextEditingController fields = TextEditingController();

  final TextEditingController fieldNameController = TextEditingController();
  final TextEditingController maxLengthController = TextEditingController();
  final TextEditingController minLengthController = TextEditingController();
  final TextEditingController maxDigitsController = TextEditingController();
  final TextEditingController decimalPlacesController = TextEditingController();

  final _getDynamicData = GetDynamicData().obs;
  GetDynamicData get getDynamicData => _getDynamicData.value;
  set getDynamicData(value) => _getDynamicData.value = value;


  final _postDynamicData = PostDynamicData().obs;
  PostDynamicData get postDynamicData => _postDynamicData.value;
  set postDynamicData(value) => _postDynamicData.value = value;

  final RxBool _isRefresh = false.obs;
  get isRefresh => _isRefresh.value;
  set isRefresh(value) => _isRefresh.value = value;

  final RxBool _submit = false.obs;
  get submit => _submit.value;
  set submit(value) => _submit.value = value;

  createDynamicData(Map<String, dynamic> jsonData) async {
    submit = true;
    var postData = {
        "app_label": appLabel.text,
        "model_name": modelName.text,
        "fields": fields.text,
    };

    print('Data ::::::::::::: $postData');
      debugPrint('Sending JSON data:::::: ${json.encode(postData)}');

    try {
      submit = true;
      var data = await DynamicRepo().createDynamicData(postData);
      closeLoadingDialog();
      if (data != null) {
        Get.back();
        submit = false;
        _postDynamicData.value = data;

        showSnackBar(title: 'Success....!', message: 'Data Submitted Successfully.', icon: Icon(Icons.check, color: Colors.green));
        
        disposeController();
        isRefresh = true;
        // await getPaymentRequestList();
        // await getpostDynamicData(postDynamicData.id, navigation: false);
      }
    } catch (e) {
      submit = false;

      debugPrint(
        "Api Error Response: $e",
      );

      closeLoadingDialog();
    }
  }


  disposeController() {
    submit = false;
    appLabel.clear();
    modelName.clear();
  }

  dialogDisposeController() {
    fieldNameController.clear();
    maxLengthController.clear();
    minLengthController.clear();
    maxDigitsController.clear();
    decimalPlacesController.clear();
  }
}
