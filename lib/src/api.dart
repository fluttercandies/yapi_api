import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yapi_api/src/model/yapi_interface.dart';
import 'package:yapi_api/src/model/yapi_login.dart';
import 'package:yapi_api/src/model/yapi_logout.dart';
import 'package:yapi_api/src/model/yapi_project.dart';

/// API helper class for interacting with YApi server
/// Provides methods to fetch interface and project data from YApi
/// Uses singleton pattern to maintain configuration across the app
/// API helper class for interacting with YApi server
/// Provides methods to fetch interface and project data from YApi
/// Uses singleton pattern to maintain configuration across the app
class YapiApiHelper {
  /// Factory constructor that returns the singleton instance
  factory YapiApiHelper() => _yapiApiHelper;

  /// Private constructor for singleton pattern
  YapiApiHelper._();

  /// Static instance of the singleton
  static final YapiApiHelper _yapiApiHelper = YapiApiHelper._();

  /// Base URL of the YApi server (e.g., 'https://yapi.example.com')
  String baseUrl = '';

  /// Authentication cookie for YApi server access
  String cookie = '';

  /// Logs in to the YApi server using provided email and password
  Future<YapiLoginResponse?> login({
    required String email,
    required String password,
  }) async {
    try {
      // Validate that required configuration is set
      assert(baseUrl.isNotEmpty, 'Base URL must be set');

      // Make HTTP POST request to YApi login endpoint
      final response = await http.post(
        Uri.parse('$baseUrl/api/user/login'),
        body: <String, dynamic>{
          'email': email,
          'password': password,
        },
      );

      // Check if request was successful
      if (response.statusCode == 200) {
        // Parse JSON response and return login data
        YapiLoginResponse yapiLoginResponse = YapiLoginResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);

        // Save cookie from response headers if needed
        if (yapiLoginResponse.errcode == 0) {
          final setCookie = response.headers['set-cookie'];
          if (setCookie != null) {
            setCookie.split(';').forEach(
              (element) {
                if (element.contains('yapi_token')) {
                  cookie =
                      '${element.trim()}; _yapi_uid=${yapiLoginResponse.data?.uid}';
                }
              },
            );
          }
        }

        return yapiLoginResponse;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      // Log error and return null on failure
      log('Error fetching login: $e');
      return null;
    }
  }

  /// Logs out from the YApi server
  Future<YapiLogoutResponse?> logout() async {
    try {
      // Validate that required configuration is set
      assert(baseUrl.isNotEmpty, 'Base URL must be set');
      assert(cookie.isNotEmpty, 'Cookie must be set');

      // Make HTTP GET request to YApi interface endpoint
      final response = await http.get(
        Uri.parse('$baseUrl/api/user/logout'),
        headers: <String, String>{
          'Cookie': cookie,
        },
      );

      // Check if request was successful
      if (response.statusCode == 200) {
        // Parse JSON response and return interface data
        return YapiLogoutResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load interface');
      }
    } catch (e) {
      // Log error and return null on failure
      log('Error fetching interface: $e');
      return null;
    }
  }

  /// Fetches interface details from YApi server by interface ID
  ///
  /// [id] The unique identifier of the interface to fetch
  /// Returns [YapiInterfaceResponse] containing interface data or null if failed
  /// Throws assertions if baseUrl or cookie are not set
  /// Fetches interface details from YApi server by interface ID
  ///
  /// [id] The unique identifier of the interface to fetch
  /// Returns [YapiInterfaceResponse] containing interface data or null if failed
  /// Throws assertions if baseUrl or cookie are not set
  Future<YapiInterfaceResponse?> getInterface(int id) async {
    try {
      // Validate that required configuration is set
      assert(baseUrl.isNotEmpty, 'Base URL must be set');
      assert(cookie.isNotEmpty, 'Cookie must be set');

      // Make HTTP GET request to YApi interface endpoint
      final response = await http.get(
        Uri.parse('$baseUrl/api/interface/get?id=$id'),
        headers: <String, String>{
          'Cookie': cookie,
        },
      );

      // Check if request was successful
      if (response.statusCode == 200) {
        // Parse JSON response and return interface data
        return YapiInterfaceResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load interface');
      }
    } catch (e) {
      // Log error and return null on failure
      log('Error fetching interface: $e');
      return null;
    }
  }

  /// Fetches project details from YApi server by project ID
  ///
  /// [id] The unique identifier of the project to fetch
  /// Returns [YapiProjectResponse] containing project data or null if failed
  /// Throws assertions if baseUrl or cookie are not set
  /// Fetches project details from YApi server by project ID
  ///
  /// [id] The unique identifier of the project to fetch
  /// Returns [YapiProjectResponse] containing project data or null if failed
  /// Throws assertions if baseUrl or cookie are not set
  Future<YapiProjectResponse?> getProject(int id) async {
    try {
      // Validate that required configuration is set
      assert(baseUrl.isNotEmpty, 'Base URL must be set');
      assert(cookie.isNotEmpty, 'Cookie must be set');

      // Make HTTP GET request to YApi project endpoint
      final response = await http.get(
        Uri.parse('$baseUrl/api/project/get?id=$id'),
        headers: <String, String>{
          'Cookie': cookie,
        },
      );

      // Check if request was successful
      if (response.statusCode == 200) {
        // Parse JSON response and return project data
        return YapiProjectResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load project');
      }
    } catch (e) {
      // Log error and return null on failure
      log('Error fetching project: $e');
      return null;
    }
  }
}
