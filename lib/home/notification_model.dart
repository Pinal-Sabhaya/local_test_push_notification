import 'dart:convert';

PushNotificationModel pushNotificationModelFromJson(String str) => PushNotificationModel.fromJson(json.decode(str));

String pushNotificationModelToJson(PushNotificationModel data) => json.encode(data.toJson());

class PushNotificationModel {
  String? to;
  Notification? notification;

  PushNotificationModel({
    this.to,
    this.notification,
  });

  factory PushNotificationModel.fromJson(Map<String, dynamic> json) => PushNotificationModel(
    to: json["to"],
    notification: json["notification"] == null ? null : Notification.fromJson(json["notification"]),
  );

  Map<String, dynamic> toJson() => {
    "to": to,
    "notification": notification?.toJson(),
  };
}

class Notification {
  String? body;
  String? title;

  Notification({
    this.body,
    this.title,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    body: json["body"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "body": body,
    "title": title,
  };
}
