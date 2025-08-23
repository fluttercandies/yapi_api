import 'dart:convert';

import 'package:yapi_api/src/utils.dart';

/// Response wrapper for YApi logout API
/// Contains error code, error message, and logout result data
class YapiLogoutResponse {
  /// Constructor for YapiLogoutResponse
  const YapiLogoutResponse({this.errcode, this.errmsg, this.data});

  /// Creates a YapiLogoutResponse from JSON data
  factory YapiLogoutResponse.fromJson(Map<String, dynamic> json) =>
      YapiLogoutResponse(
        errcode: asT<int>(json['errcode']),
        errmsg: asT<String>(json['errmsg']),
        data: asT<String>(json['data']),
      );

  /// Error code from the logout API response
  final int? errcode;

  /// Error message from the logout API response
  final String? errmsg;

  /// Logout result data (may be a message or status)
  final String? data;

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
