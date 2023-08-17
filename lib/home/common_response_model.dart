import 'dart:convert';

CommonResponse commonResponseFromJson(String str) => CommonResponse.fromJson(json.decode(str));

String commonResponseToJson(CommonResponse data) => json.encode(data.toJson());

class CommonResponse {
  double? multicastId;
  int? success;
  int? failure;
  int? canonicalIds;
  List<Result>? results;

  CommonResponse({
    this.multicastId,
    this.success,
    this.failure,
    this.canonicalIds,
    this.results,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
    multicastId: json["multicast_id"]?.toDouble(),
    success: json["success"],
    failure: json["failure"],
    canonicalIds: json["canonical_ids"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "multicast_id": multicastId,
    "success": success,
    "failure": failure,
    "canonical_ids": canonicalIds,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  String? messageId;

  Result({
    this.messageId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    messageId: json["message_id"],
  );

  Map<String, dynamic> toJson() => {
    "message_id": messageId,
  };
}
