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
    this.type,
    this.study,
    this.uid,
    this.addTime,
    this.upTime,
    this.role,
    this.username,
    this.email,
  });

  /// Creates a YapiLogin from JSON data
  factory YapiLogin.fromJson(Map<String, dynamic> json) => YapiLogin(
        type: asT<String>(json['type']),
        study: asT<bool>(json['study']),
        uid: asT<int>(json['uid']),
        addTime: asT<int>(json['add_time']),
        upTime: asT<int>(json['up_time']),
        role: asT<String>(json['role']),
        username: asT<String>(json['username']),
        email: asT<String>(json['email']),
      );

  /// Login type (e.g., 'user', 'admin')
  final String? type;

  /// Indicates if the user is a student
  final bool? study;

  /// User ID
  final int? uid;

  /// Timestamp when login was created
  final int? addTime;

  /// Timestamp when login was last updated
  final int? upTime;

  /// Role of the user (e.g., 'owner', 'guest')
  final String? role;

  /// Username of the user
  final String? username;

  /// Email of the user
  final String? email;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the login data to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'study': study,
        'uid': uid,
        'add_time': addTime,
        'up_time': upTime,
        'role': role,
        'username': username,
        'email': email,
      };
}
