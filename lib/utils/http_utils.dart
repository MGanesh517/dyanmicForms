// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implementation_panel/Common/common_service.dart';
import 'package:implementation_panel/Common/session_manager.dart';
import 'package:implementation_panel/Common/snackbar_widget.dart';

import '../routes/app_pages.dart';

class HttpUtils {
  //  global dio object
  static Dio dio = Dio();

  static Dio dio2 = Dio();

  // DEV server
  static const String API_PREFIX = 'http://dynamicdjango.dev.absol.in/';

  //Testing server
  // static const String API_PREFIX = 'http://api.quantum.testing.cluster.absol.in/';
  
  //Staging server
  // static const String API_PREFIX = 'http://api.quantum.staging.cluster.absol.in/';


  // static const String API_PREFIX = 'http://192.168.1.116:8002/';


  static const Duration connectTimeOut = Duration(milliseconds: 100000);
  static const Duration receiveTimeOut = Duration(milliseconds: 50000);

  // static setToken() {
  //   dio = Dio();
  //   getInstance(token);
  // }

  static Dio getInstance() {
    print(
        "Access Token I Get Instance::::${CommonService.instance.accessToken}");
    dio = Dio();
    dio.options.headers["Authorization"] =
        "Bearer ${CommonService.instance.accessToken}";
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.baseUrl = API_PREFIX;
    dio.options.connectTimeout = connectTimeOut;
    dio.options.receiveTimeout = receiveTimeOut;
    // dio.options.followRedirects = false;
    // dio.options.validateStatus =  (status) => true;
    dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
      print("request: ${request.path}");
      if (CommonService.instance.accessToken != '') {
        request.headers['Authorization'] =
            'Bearer ${CommonService.instance.accessToken}';
      }
      return handler.next(request); //continue
    }, onResponse: (response, handler) {
      print("onResponse statusCode  $response");
      // Do something with response data
      return handler.next(response); // continue
    }, onError: (DioException error, handler) async {
      print("error statusCode  $error");
      if (error.response != null && error.response?.statusCode == 401) {
        print("Printing In 401:::::::::: ${error.response?.statusCode}");
        try {
          if (CommonService.instance.refreshToken != '') {
            print(
                "Printing In Refresh :::::::::: ${CommonService.instance.refreshToken}");
            final refreshToken = CommonService.instance.refreshToken;
            print(
                "refreshToken::::::::::::00000:::::::::::::::::::::::: + $refreshToken");
            dio2 = Dio();
            dio2.options.headers['content-Type'] = 'application/json';
            dio2.options.headers["Authorization"] =
                "Bearer ${CommonService.instance.accessToken}";
            dio2.options.connectTimeout = connectTimeOut;
            dio2.options.receiveTimeout = receiveTimeOut;
            // dio.options.followRedirects = false;
            // dio.options.validateStatus =  (status) => true;
            print(
                "Printing Base Url For Refresh Token:$API_PREFIX users/login/refresh_token/");
            final refreshResponse =
                await dio2.post("${API_PREFIX}users/token/refresh/", data: {
              "refresh": refreshToken,
              "device_uuid": CommonService.instance.deviceId,
              "device_type":
                  CommonService.instance.deviceType == 'android' ? 1 : 2
            }).then((value) async {
              print("refreshToken::::::::::::::::::::::::::::::::::::" +
                  value.data['jwt_token']);
              if (value.statusCode == 200) {
                print(
                    "printing status code in refresh token: ${value.statusCode}");
                print(
                    "Printing Refreshed Access Token: ${value.data['jwt_token']} ");
                // successfully got the new access token
                error.requestOptions.headers["Authorization"] =
                    "Bearer " + value.data['jwt_token'];
                CommonService.instance.accessToken = value.data['jwt_token'];
                final opts = Options(
                    method: error.requestOptions.method,
                    headers: error.requestOptions.headers);
                final cloneReq = await dio.request(
                  error.requestOptions.path,
                  options: opts,
                  data: error.requestOptions.data,
                  queryParameters: error.requestOptions.queryParameters,
                );
                return handler.resolve(cloneReq);
              } else {
                CommonService.instance.accessToken = '';
                CommonService.instance.refreshToken = '';
                SessionManager.setAccessToken('');
                SessionManager.setRefreshToken('');
                Get.toNamed(Routes.loginPage);

                return handler.reject(error);
              }
            }).catchError((error) {
              CommonService.instance.accessToken = '';
              CommonService.instance.refreshToken = '';
              SessionManager.setAccessToken('');
              SessionManager.setRefreshToken('');

              Get.toNamed(Routes.loginPage);
            });
            return refreshResponse;
          }
        } catch (e) {
          print("Catch Erro NNDJNJDNJDNJDNJGNJDG $e");
          return handler.reject(error);
        }
        print(
            "Printing In Refresh:::::::::: ${CommonService.instance.refreshToken}");
      } else {
        if (Get.isDialogOpen!) {
          Get.back();
        }
        if (error.response != null && error.response!.statusCode == 403) {
          showSnackBar(
            title: "Forbidden ${error.response!.statusCode}",
            message: error.response!.data.toString(),
            icon: Icon(Icons.close, color: Get.theme.colorScheme.error),
          );
          print("Error MSG ::::${error.response!.data.toString()}");
          handler.reject(error);
        } else if (error.response != null &&
            error.response!.statusCode == 500) {
          showSnackBar(
            title: "Something went wrong. ${error.response!.statusCode}",
            message: "Getting Server Error", //We are trying to fix the problem.
            icon: Icon(Icons.close, color: Get.theme.colorScheme.error),
          );
          return handler.reject(error);
        } else if (error.response != null &&
            error.response!.statusCode == 502) {
          showSnackBar(
            title: "Bad Gateway ${error.response!.statusCode}",
            message:
                "We are trying to fix the problem.", //We are trying to fix the problem.
            icon: Icon(Icons.close, color: Get.theme.colorScheme.error),
          );
          return handler.reject(error);
        } else if (error.response != null &&
            error.response!.statusCode == 502) {
          showSnackBar(
            title: "Something went wrong. ${error.response!.statusCode}",
            message:
                "We are trying to fix the problem.", //We are trying to fix the problem.
            icon: Icon(Icons.close, color: Get.theme.colorScheme.error),
          );
          return handler.reject(error);
        } else {
          showSnackBar(
            title: "Server..! error",
            message:
                "Getting Server Error \n${error.response == null ? "" : error.response!.data}",
            icon: Icon(Icons.close, color: Get.theme.colorScheme.error),
          );
          print("Server..dvdvddvdvddfdfd! ${error.response!.data}");
          return handler.next(error);
        }
        print("print Error Message$error");
        return handler.next(error);
      }
      //else if (error.response?.statusCode == 404 || error.response?.statusCode == 500) {}
    }));

    return dio;
  }

  static Dio postInstance() {
    dio = Dio();
    dio.options.baseUrl = API_PREFIX;
    dio.options.connectTimeout = connectTimeOut;
    dio.options.receiveTimeout = receiveTimeOut;
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) => true;

    dio.interceptors.add(LogInterceptor(responseBody: false));
    return dio;
  }
}
