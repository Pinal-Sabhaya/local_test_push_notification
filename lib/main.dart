import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification/app_text.dart';
import 'package:push_notification/home/home_binding.dart';
import 'package:push_notification/routes/app_pages.dart';

const titleFontSize = 18.0;
const heightSize = 20.0;

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    GetMaterialApp(
      title: 'Test Push Notification',
      initialRoute: AppPages.INITIAL,
      initialBinding: HomeBindings(),
      getPages: AppPages.routes,
      enableLog: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepOrange, fontFamily: "OpenSans"),
    ),
  );
}


Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    showSnackBar(Get.context!, 'check internet connection');
    return false;
  } else {
    return true;
  }
}


void showSnackBar(BuildContext context, String message) {
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    ),
    titleText: Container(),
    borderRadius: 4,
    backgroundColor: Colors.black,
    colorText: Theme.of(context).colorScheme.surface,
    isDismissible: false,
    animationDuration: const Duration(milliseconds: 500),
    duration: const Duration(seconds: 2),
  );
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      initialBinding: HomeBindings(),
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'samsung_one',
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}*/


/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
TextEditingController bodyController = TextEditingController();


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text('Server Key*',style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Server Key',
                  ),
                ),
                const SizedBox(height: heightSize),
                 Text('FCM Registration Token (Device Token)*',style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'FCM Registration Token (Device Token)',
                  ),
                ),
                const SizedBox(height: heightSize),
                 Text('Title*',style: AppText.textBold.copyWith(fontSize: titleFontSize)),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                  ),
                ),
                 SizedBox(height: heightSize),
                 Text('Body*',style:AppText.textBold.copyWith(fontSize: titleFontSize)),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Body',
                  ),
                ),
            *//*    TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: bodyController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    prefixIconConstraints:
                    BoxConstraints(minWidth: 40, maxHeight: 80),
                    hintText: 'Body',
                  ),
                  onChanged: (value) {
                    bodyController.text = value;
                  },
                ),*//*
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Center(child: Text('press')),backgroundColor: Colors.red, ));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(5500, 50) // put the width and height you want
                  ),
                 *//* style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(color: Colors.white)),*//*
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
                child:  Text('Test Your Firebase Push Notifications with Ease!',style: AppText.textRegular.copyWith(fontSize: 30)),
              )
            ],
          ),
        ),
      ],
    ));
  }
}*/
