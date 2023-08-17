import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification/apiservice/api_service.dart';
import 'package:push_notification/home/common_response_model.dart';
import 'package:push_notification/home/notification_model.dart';
import 'package:push_notification/main.dart';
import 'package:push_notification/routes/app_pages.dart';

class HomeController extends GetxController {
  final serverKeyController = TextEditingController().obs;
  final fcmController = TextEditingController().obs;
  final titleController = TextEditingController().obs;
  final bodyController = TextEditingController().obs;
  PushNotificationModel pushNotificationModel = PushNotificationModel();


  @override
  void onInit() {
    super.onInit();
    print("object===>${serverKeyController.value.text}");
    print("object fcmController===>${fcmController.value.text}");
  }


  callNotificationApi() {
    checkConnectivity().then((value) {
      if (value) {


        Map<String, dynamic> toJson() => {
          "body":bodyController.value.text,
          "title":titleController.value.text,
        };

        var params = <String, dynamic>{
          "to": fcmController.value.text,
          "notification": toJson()
        };

        print('param--> $params');


        ApiService.callPostApi(
            ApiService.sendNotification, params, null,serverKeyController.value.text)
            .then((response) {

          CommonResponse commonResponse = CommonResponse.fromJson(response!);
          print('response--> ${response}');

          if (commonResponse.success.toString() == '1') {
            showSnackBar(Get.context!, 'Notification sent successfully');
            refresh();
          } else if(commonResponse.success.toString() == '0') {
            showSnackBar(Get.context!, commonResponse.results![0].messageId.toString());
            refresh();
          }
        });
      }
    });
  }


  @override
  void refresh() {
    super.refresh();
  }
}
