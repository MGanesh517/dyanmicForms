import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Model/get_dynamic_data_model.dart';
import 'package:implementation_panel/utils/http_utils.dart';

class DynamicRepo {
    Future<GetDynamicList?> getDynamicData(filterParams) async {
    try {
      var response = await HttpUtils.getInstance().get("/dynamicdjango/dynamicmodel/", queryParameters: filterParams);

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
    print("printing response ::::: ${jsonEncode(data)}");

    try {
      var response = await HttpUtils.getInstance().post("/dynamicdjango/dynamicmodel/", data: jsonEncode(data));
      print("printing response ::::: $response");
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
}
