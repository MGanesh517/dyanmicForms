import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:implementation_panel/Screens/Dashboard/Dropdown/model_details_Drodown_keys.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/ModelName_validator_list_model.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/get_dynamic_data_list_model.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/model_name_validation.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/view_by_id_model.dart';
import 'package:implementation_panel/utils/http_utils.dart';
import 'package:toastification/toastification.dart';

class DynamicRepo {
    Future<GetDynamicList?> getDynamicList(filterParams) async {
    try {
      var response = await HttpUtils.getInstance().get("/dynamicdjango/dynamic_model/", queryParameters: filterParams);

      if (response.statusCode == 200) {
        return GetDynamicList.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return null;
  }

  createDynamicData(data) async {
    print("printing json Data response ::::: ${jsonEncode(data)}");

    try {
      print("printing json Data  ::::: ${jsonEncode(data)}");
      var response = await HttpUtils.getInstance().post("/dynamicdjango/dynamic_model/", data: jsonEncode(data));
      print("printing json Data response ::::: ${jsonEncode(data)}");
      print("printing response data ::::: $response");
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.toString());
        return response.data;
      }
      return null;
    } on DioException catch (e) {
      if (e.response!.statusCode == 500 || e.response!.statusCode == 404) {
        throw Exception(e.message);
      } else {
        throw Exception(e.response);
      }
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return null;
  }

  getDynamicDetails(id) async {
    try {
      var response = await HttpUtils.getInstance().get("/dynamicdjango/dynamic_model/${id}/");

      if (response.statusCode == 200) {
        return GetDynamicViewById.fromJson(response.data as Map<String, dynamic>);
      } else {
        return null;
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
  }

  updateModelName(data, id) async {
    try {
      var response = await HttpUtils.getInstance().put(
        "/dynamicdjango/dynamicmodel/${id}/",
        data: data,
      );
      if (response.statusCode == 200) {
        // return GetMrnReturnData.fromJson(response.data as Map<String, dynamic>);
        return response.data;
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw (e.response!.data);
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return null;
  }

  Future<DynamicModelsNameList?> getModelNameList() async {
    try {
      var response = await HttpUtils.getInstance().get("/dynamicdjango/models/list/");

      if (response.statusCode == 200) {
        return DynamicModelsNameList.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    } on SocketException catch (_) {
      debugPrint('not connected');
    }
    return null;
  }

 
 
 
  // Future<ModelNameValidation?> getModelNameValidation(modelName) async {
  //   try {
  //     var response = await HttpUtils.getInstance().get("/dynamicdjango/validation/modelname/$modelName/");
  //     if (response.statusCode == 200) {
  //       return ModelNameValidation.fromJson(response.data as Map<String, dynamic>);
  //     }
  //   } on DioException catch (e) {
  //     debugPrint(e.message);
  //     throw Exception(e.message);
  //   } on SocketException catch (_) {
  //     debugPrint('not connected');
  //   }
  //   return null;
  // }

  Future<ModelNameValidation?> getModelNameValidation(modelName ) async {
    try {
      debugPrint("🔍 Sending API request with parameters: $modelName");
      var response = await HttpUtils.getInstance().get("/dynamicdjango/validation/modelname/$modelName/");
      if (response.statusCode == 200) {
        debugPrint("✅ API Response: ${response.data}");
        return ModelNameValidation.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioException catch (e) {
      debugPrint("❌ DioException: ${e.message}");
      return ModelNameValidation(status: "error", message: e.message);
    } on SocketException catch (_) {
      debugPrint("❌ No Internet Connection");
      return ModelNameValidation(status: "error", message: "No internet connection.");
    }
    return null;
  }

// Future<ModelNameValidation?> getModelNameValidation(
//       BuildContext context, String modelName) async {
//     try {
//       debugPrint("🔍 Sending API request with parameters: $modelName");
//       var response = await HttpUtils.getInstance()
//           .get("/dynamicdjango/validation/modelname/$modelName/");
//       if (response.statusCode == 200) {
//         debugPrint("✅ API Response: ${response.data}");
//         return ModelNameValidation.fromJson(response.data);
//       }
//     } on DioException catch (e) {
//       debugPrint("❌ DioException: ${e.message}");
//       showErrorToast(context, e.message ?? "An error occurred");
//       return ModelNameValidation(status: "error", message: e.message);
//     } on SocketException {
//       debugPrint("❌ No Internet Connection");
//       showErrorToast(context, "No internet connection.");
//       return ModelNameValidation(status: "error", message: "No internet connection.");
//     }
//     return null;
//   }


  Future<ModelsDetailsKeys?> fetchModelDetails(String appName, String modelName) async {
    try {
      var response = await HttpUtils.getInstance().get("/dynamicdjango/models/detail/$appName/$modelName/");
      if (response.statusCode == 200) {
        return ModelsDetailsKeys.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioException catch (e) {
      debugPrint("Dio Exception: ${e.message}");
    } on SocketException {
      debugPrint('No internet connection');
    }
    return null;
  }
}


void showErrorToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    title: Text(message, style: TextStyle(fontWeight: FontWeight.w500)),
    type: ToastificationType.warning,
    closeButtonShowType: CloseButtonShowType.always,
    showIcon: true,
    style: ToastificationStyle.minimal,
    progressBarTheme: ProgressIndicatorThemeData(linearMinHeight: 1),
    autoCloseDuration: const Duration(seconds: 5),
  );
}