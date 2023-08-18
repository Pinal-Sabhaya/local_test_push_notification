import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:push_notification/main.dart';

abstract class ApiService {
  static const BASE_URL = "https://fcm.googleapis.com/fcm";

  static const sendNotification = "/send";


  static Future<dynamic> callPostApi(
      String endPoint,
      Map<String, dynamic> params,
      Function? onError,String header) async {
    print("ApiService Post Api: ${BASE_URL + endPoint}");
    print("ApiService Api Params: ${jsonEncode(params)}");
     var commonHeader = {
      'Authorization': 'Bearer $header','Content-Type': 'application/json'
    };

    var response = await http.post(Uri.parse(BASE_URL + endPoint), headers: commonHeader, body: jsonEncode(params));

    print("ApiService Post Response Code : ${response.body.toString()}");
    print("ApiService Post Response : ${response.statusCode}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (onError != null) {
        onError();
      } else {
        showSnackBar(Get.context!, 'Something went wrong');
      }
      return null;
    }
  }
}
