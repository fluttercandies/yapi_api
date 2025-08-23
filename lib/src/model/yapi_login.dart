import 'dart:convert';

import 'package:yapi_api/src/utils.dart';

/// Response wrapper for YApi login API
/// Contains error code, error message, and login data
class YapiLoginResponse {
  /// Constructor for YapiLoginResponse
  const YapiLoginResponse({this.errcode, this.errmsg, this.data});

  /// Creates a YapiLoginResponse from JSON data
  factory YapiLoginResponse.fromJson(Map<String, dynamic> json) =>
      YapiLoginResponse(
        errcode: asT<int>(json['errcode']),
        errmsg: asT<String>(json['errmsg']),
        data: json['data'] == null
            ? null
            : YapiLogin.fromJson(asT<Map<String, dynamic>>(json['data'])!),
      );

  /// Error code from the login API response
  final int? errcode;

  /// Error message from the login API response
  final String? errmsg;

  /// Login data returned from the API
  final YapiLogin? data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the response to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'errcode': errcode,
        'errmsg': errmsg,
        'data': data,
      };
}

/// Represents login data returned from YApi
class YapiLogin {
  /// Constructor for YapiLogin
  const YapiLogin({
    this.customFiled1,
    this.type,
    this.id,
    this.uid,
    this.group,
    this.addTime,
    this.upTime,
    this.role,
  });

  /// Creates a YapiLogin from JSON data
  factory YapiLogin.fromJson(Map<String, dynamic> json) => YapiLogin(
        customFiled1: json['custom_filed1'] == null
            ? null
            : CustomFiled1.fromJson(
                asT<Map<String, dynamic>>(json['custom_filed1'])!,
              ),
        type: asT<String>(json['type']),
        id: asT<int>(json['_id']),
        uid: asT<int>(json['uid']),
        group: asT<String>(json['group']),
        addTime: asT<int>(json['add_time']),
        upTime: asT<int>(json['up_time']),
        role: asT<String>(json['role']),
      );

  /// Custom field data (optional)
  final CustomFiled1? customFiled1;

  /// Login type (e.g., 'user', 'admin')
  final String? type;

  /// Unique identifier for the login
  final int? id;

  /// User ID
  final int? uid;

  /// Group name or ID
  final String? group;

  /// Timestamp when login was created
  final int? addTime;

  /// Timestamp when login was last updated
  final int? upTime;

  /// Role of the user (e.g., 'owner', 'guest')
  final String? role;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the login data to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'custom_filed1': customFiled1,
        'type': type,
        '_id': id,
        'uid': uid,
        'group': group,
        'add_time': addTime,
        'up_time': upTime,
        'role': role,
      };
}

/// Represents a custom field in login data
class CustomFiled1 {
  /// Constructor for CustomFiled1
  const CustomFiled1({this.enable});

  /// Creates a CustomFiled1 from JSON data
  factory CustomFiled1.fromJson(Map<String, dynamic> json) =>
      CustomFiled1(enable: asT<bool>(json['enable']));

  /// Whether the custom field is enabled
  final bool? enable;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the custom field to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{'enable': enable};
}
