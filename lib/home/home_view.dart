import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:push_notification/app_text.dart';
import 'package:push_notification/home/home_controller.dart';
import 'package:push_notification/main.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() => MediaQuery.of(context).size.width > 1200
            ? Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Server Key*', style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                          const SizedBox(height: 10),
                          TextField(
                            maxLines: 2,
                            controller: controller.serverKeyController.value,
                            // controller: controller.serverKeyController.value,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Server Key',
                            ),
                          ),
                          const SizedBox(height: heightSize),
                          Text('FCM Registration Token (Device Token)*', style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                          const SizedBox(height: 10),
                          TextField(
                            controller: controller.fcmController.value,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'FCM Registration Token (Device Token)',
                            ),
                          ),
                          const SizedBox(height: heightSize),
                          Text('Title*', style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                          const SizedBox(height: 10),
                          TextField(
                            controller: controller.titleController.value,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Title',
                            ),
                          ),
                          const SizedBox(height: heightSize),
                          Text('Body*', style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                          const SizedBox(height: 10),
                          TextField(
                            controller: controller.bodyController.value,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Body',
                            ),
                          ),
                          const SizedBox(height: heightSize),
                          Text('Data - (optional)', style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                          const SizedBox(height: 10),
                          TextField(
                            controller: controller.dataController.value,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Must be JSON Object like {"key":"value"}',
                            ),
                          ),
                          const SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () {
                              if (controller.serverKeyController.value.text.isEmpty) {
                                showSnackBar(Get.context!, 'Please enter server key');
                              } else if (controller.fcmController.value.text.isEmpty) {
                                showSnackBar(Get.context!, 'Please enter FCM Registration Token');
                              } else if (controller.titleController.value.text.isEmpty) {
                                showSnackBar(Get.context!, 'Please enter title');
                              } else if (controller.bodyController.value.text.isEmpty) {
                                showSnackBar(Get.context!, 'Please enter body');
                              } else {
                                controller.callNotificationApi();
                              }
                            },
                            style: ElevatedButton.styleFrom(minimumSize: Size(5500, 50)),
                            child: const Text('Push Notification'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/notification_banner.jpg',
                          height: 500,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('Test Your Firebase Push Notifications with Ease!', style: AppText.textRegular.copyWith(fontSize: 30)),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Server Key*', style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                    const SizedBox(height: 10),
                    TextField(
                      maxLines: 2,
                      controller: controller.serverKeyController.value,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Server Key',
                      ),
                    ),
                    const SizedBox(height: heightSize),
                    Text('FCM Registration Token (Device Token)*', style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller.fcmController.value,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'FCM Registration Token (Device Token)',
                      ),
                    ),
                    const SizedBox(height: heightSize),
                    Text('Title*', style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller.titleController.value,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Title',
                      ),
                    ),
                    const SizedBox(height: heightSize),
                    Text('Body*', style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller.bodyController.value,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Body',
                      ),
                    ),
                    const SizedBox(height: heightSize),
                    Text('Data - (optional)', style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller.dataController.value,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Must be JSON Object like {"key":"value"}',
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.serverKeyController.value.text.isEmpty) {
                          showSnackBar(Get.context!, 'Please enter server key');
                        } else if (controller.fcmController.value.text.isEmpty) {
                          showSnackBar(Get.context!, 'Please enter FCM Registration Token');
                        } else if (controller.titleController.value.text.isEmpty) {
                          showSnackBar(Get.context!, 'Please enter title');
                        } else if (controller.bodyController.value.text.isEmpty) {
                          showSnackBar(Get.context!, 'Please enter body');
                        } else {
                          controller.callNotificationApi();
                        }
                      },
                      style: ElevatedButton.styleFrom(minimumSize: Size(5500, 50)),
                      child: const Text('Push Notification'),
                    )
                  ],
                ),
              )));
  }
}
