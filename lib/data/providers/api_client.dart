import 'dart:convert';
import 'package:get/get.dart';
import '../../core/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import '../../core/utils/exceptions.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bumpyj/core/utils/progress_utils.dart';

class ApiClient extends GetConnect {
  var url = "";
  final userdata = GetStorage();
  Map<String, String> headers = {"Content-Type": "application/json"};

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = Duration(seconds: 30);
    httpClient.addRequestModifier<dynamic>((request) {
      Map<String, String> headers = {"Content-Type": "application/json"};
      //encoding:
      Encoding.getByName("utf-8");
      request.headers.addAll(headers);
      print(request);
      return request;
    });
  }

  Future<List<int>> readResponseBytes(Stream<List<int>> stream) async {
    final bytes = <int>[];
    await for (final chunk in stream) {
      bytes.addAll(chunk);
    }
    return bytes;
  }

  //network
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No internet found');
    }
  }

  bool _isSuccessCall(Response response) {
    return response.isOk;
  }

  //api methods
  Future createLogin(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      Map requestData = const {}}) async {
    try {
      ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();

      Response response = await httpClient.post(
        '$url/DataTransfer/Login',
        body: requestData,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        onSuccess!(response.body);
      } else {
        onError!(
          response.hasError ? response.statusText : "Something went wrong!",
        );
      }
    } catch (error) {
      ProgressDialogUtils.hideProgressDialog();
      onError!(error);
    }
  }

  Future Register(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      Map requestData = const {}}) async {
    try {
      ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();

      final Response response = await httpClient
          .post("$url/Datatransfer/Register", body: requestData);
      debugPrint(response.body);
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        onSuccess!(response.body);
      } else {
        onError!(
          response.hasError ? response.statusText : "Something went wrong!",
        );
      }
    } catch (error) {
      ProgressDialogUtils.hideProgressDialog();
      onError!(error);
    }
  }
}
