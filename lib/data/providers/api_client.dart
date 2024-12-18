import 'dart:convert';
import 'package:get/get.dart';
import '../../core/utils/helpers.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import '../../core/utils/exceptions.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bumpyj/core/utils/progress_utils.dart';

class ApiClient extends GetConnect {
  var url = "http://localhost:3077";
  final userdata = GetStorage();
  Map<String, String> headers = {"Content-Type": "application/json"};

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 30);
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

  //api methods
  Future createLogin(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      Map? requestData}) async {
    try {
      ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();

      var response = await http.post(
        Uri.parse('$url/DataTransfer/Login'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: json.encode(requestData),
      );
      ProgressDialogUtils.hideProgressDialog();
      debugPrint(response.body);
      if (response.statusCode == 200) {
        onSuccess!(jsonDecode(response.body));
      } else {
        onError!(
          //response.hasError ? response.statusText :
          "Something went wrong!",
        );
      }
    } catch (error) {
      ProgressDialogUtils.hideProgressDialog();
      onError!(error);
      rethrow;
    }
  }

  Future Register(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      Map? requestData}) async {
    try {
      ProgressDialogUtils.showProgressDialog();
      await isNetworkConnected();

      final response = await http.post(Uri.parse("$url/Datatransfer/Register"),
          headers: {"Content-Type": "application/json; charset=utf-8"},
          body: json.encode(requestData));
      debugPrint(response.body);
      ProgressDialogUtils.hideProgressDialog();
      if (response.statusCode == 200) {
        onSuccess!(jsonDecode(response.body));
      } else {
        onError!(
          "Something went wrong!",
        );
      }
    } catch (error) {
      ProgressDialogUtils.hideProgressDialog();
      onError!(error);
    }
  }
}
