import 'dart:convert';

import 'package:yapi_api/src/utils.dart';

/// Response wrapper for YApi interface data
/// Contains error code, error message, and the actual interface data
class YapiInterfaceResponse {
  const YapiInterfaceResponse({this.errcode, this.errmsg, this.data});

  /// Creates a YapiInterfaceResponse from JSON data
  factory YapiInterfaceResponse.fromJson(Map<String, dynamic> json) =>
      YapiInterfaceResponse(
        errcode: asT<int>(json['errcode']),
        errmsg: asT<String>(json['errmsg']),
        data: json['data'] == null
            ? null
            : YapiInterface.fromJson(asT<Map<String, dynamic>>(json['data'])!),
      );

  /// Error code from the API response
  final int? errcode;

  /// Error message from the API response
  final String? errmsg;

  /// The actual interface data
  final YapiInterface? data;

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

/// Represents a YApi interface/API endpoint with all its configuration and metadata
/// Contains request/response specifications, authentication, and documentation
class YapiInterface {
  /// Creates a YapiInterface instance with all optional parameters
  const YapiInterface({
    this.queryPath,
    this.editUid,
    this.status,
    this.type,
    this.resBodyIsJsonSchema,
    this.reqBodyIsJsonSchema,
    this.apiOpened,
    this.index,
    this.tag,
    this.id,
    this.resBodyType,
    this.title,
    this.path,
    this.catid,
    this.markdown,
    this.reqHeaders,
    this.reqQuery,
    this.resBody,
    this.resBodyOther,
    this.method,
    this.reqParams,
    this.desc,
    this.projectId,
    this.uid,
    this.addTime,
    this.upTime,
    this.reqBodyType,
    this.reqBodyForm,
    this.v,
    this.username,
  });

  /// Creates a YapiInterface from JSON data with proper type casting and null safety
  /// Creates a YapiInterface from JSON data with proper type casting and null safety
  factory YapiInterface.fromJson(Map<String, dynamic> json) {
    // Parse tags array safely
    final List<Object>? tag = json['tag'] is List ? <Object>[] : null;
    if (tag != null) {
      for (final dynamic item in json['tag']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            tag.add(asT<Object>(item)!);
          });
        }
      }
    }

    // Parse request headers array safely
    // Parse request headers array safely
    final List<ReqHeaders>? reqHeaders =
        json['req_headers'] is List ? <ReqHeaders>[] : null;
    if (reqHeaders != null) {
      for (final dynamic item in json['req_headers']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            reqHeaders.add(
              ReqHeaders.fromJson(asT<Map<String, dynamic>>(item)!),
            );
          });
        }
      }
    }

    // Parse request query parameters array safely
    // Parse request query parameters array safely
    final List<ReqQuery>? reqQuery =
        json['req_query'] is List ? <ReqQuery>[] : null;
    if (reqQuery != null) {
      for (final dynamic item in json['req_query']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            reqQuery.add(ReqQuery.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    // Parse request path parameters array safely
    // Parse request path parameters array safely
    final List<ReqParams>? reqParams =
        json['req_params'] is List ? <ReqParams>[] : null;
    if (reqParams != null) {
      for (final dynamic item in json['req_params']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            reqParams.add(ReqParams.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    // Parse request body form parameters array safely
    // Parse request body form parameters array safely
    final List<ReqBodyForm>? reqBodyForm =
        json['req_body_form'] is List ? <ReqBodyForm>[] : null;
    if (reqBodyForm != null) {
      for (final dynamic item in json['req_body_form']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            reqBodyForm.add(
              ReqBodyForm.fromJson(asT<Map<String, dynamic>>(item)!),
            );
          });
        }
      }
    }
    // Create YapiInterface instance with parsed data
    return YapiInterface(
      queryPath: json['query_path'] == null
          ? null
          : QueryPath.fromJson(
              asT<Map<String, dynamic>>(json['query_path'])!,
            ),
      editUid: asT<int>(json['edit_uid']),
      status: asT<String>(json['status']),
      type: asT<String>(json['type']),
      resBodyIsJsonSchema: asT<bool>(json['res_body_is_json_schema']),
      reqBodyIsJsonSchema: asT<bool>(json['req_body_is_json_schema']),
      apiOpened: asT<bool>(json['api_opened']),
      index: asT<int>(json['index']),
      tag: tag,
      id: asT<int>(json['_id']),
      resBodyType: asT<String>(json['res_body_type']),
      title: asT<String>(json['title']),
      path: asT<String>(json['path']),
      catid: asT<int>(json['catid']),
      markdown: asT<String>(json['markdown']),
      reqHeaders: reqHeaders,
      reqQuery: reqQuery,
      resBody: asT<String>(json['res_body']),
      resBodyOther: asT<String>(json['res_body_other']),
      method: asT<String>(json['method']),
      reqParams: reqParams,
      desc: asT<String>(json['desc']),
      projectId: asT<int>(json['project_id']),
      uid: asT<int>(json['uid']),
      addTime: asT<int>(json['add_time']),
      upTime: asT<int>(json['up_time']),
      reqBodyType: asT<String>(json['req_body_type']),
      reqBodyForm: reqBodyForm,
      v: asT<int>(json['__v']),
      username: asT<String>(json['username']),
    );
  }

  /// Query path configuration for dynamic routes
  final QueryPath? queryPath;

  /// User ID who last edited this interface
  final int? editUid;

  /// Current status of the interface (e.g., 'done', 'undone')
  final String? status;

  /// Type of the interface
  final String? type;

  /// Whether response body follows JSON Schema format
  final bool? resBodyIsJsonSchema;

  /// Whether request body follows JSON Schema format
  final bool? reqBodyIsJsonSchema;

  /// Whether the API is publicly accessible
  final bool? apiOpened;

  /// Display order index
  final int? index;

  /// Tags associated with this interface
  final List<Object>? tag;

  /// Unique identifier for the interface
  final int? id;

  /// Response body content type (e.g., 'json', 'raw')
  final String? resBodyType;

  /// Interface title/name
  final String? title;

  /// API endpoint path
  final String? path;

  /// Category ID this interface belongs to
  final int? catid;

  /// Markdown documentation for the interface
  final String? markdown;

  /// HTTP headers required for requests
  final List<ReqHeaders>? reqHeaders;

  /// Query parameters for the request
  final List<ReqQuery>? reqQuery;

  /// Response body content/schema
  final String? resBody;

  /// Alternative response body formats
  final String? resBodyOther;

  /// HTTP method (GET, POST, PUT, DELETE, etc.)
  final String? method;

  /// Path parameters for the request
  /// xxx/{id}
  ///
  /// id
  final List<ReqParams>? reqParams;

  /// Interface description
  final String? desc;

  /// Project ID this interface belongs to
  final int? projectId;

  /// User ID who created this interface
  final int? uid;

  /// Timestamp when interface was created
  final int? addTime;

  /// Timestamp when interface was last updated
  final int? upTime;

  /// Request body content type (e.g., 'json', 'form', 'raw')
  final String? reqBodyType;

  /// Form parameters for request body
  final List<ReqBodyForm>? reqBodyForm;

  /// Version number for the interface
  final int? v;

  /// Username of the interface creator
  final String? username;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the interface to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'query_path': queryPath,
        'edit_uid': editUid,
        'status': status,
        'type': type,
        'res_body_is_json_schema': resBodyIsJsonSchema,
        'req_body_is_json_schema': reqBodyIsJsonSchema,
        'api_opened': apiOpened,
        'index': index,
        'tag': tag,
        '_id': id,
        'res_body_type': resBodyType,
        'title': title,
        'path': path,
        'catid': catid,
        'markdown': markdown,
        'req_headers': reqHeaders,
        'req_query': reqQuery,
        'res_body': resBody,
        'res_body_other': resBodyOther,
        'method': method,
        'req_params': reqParams,
        'desc': desc,
        'project_id': projectId,
        'uid': uid,
        'add_time': addTime,
        'up_time': upTime,
        'req_body_type': reqBodyType,
        'req_body_form': reqBodyForm,
        '__v': v,
        'username': username,
      };
}

/// Represents a query path configuration with dynamic parameters
class QueryPath {
  const QueryPath({this.path, this.params});

  /// Creates a QueryPath from JSON data
  factory QueryPath.fromJson(Map<String, dynamic> json) {
    // Parse parameters array safely
    final List<Object>? params = json['params'] is List ? <Object>[] : null;
    if (params != null) {
      for (final dynamic item in json['params']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            params.add(asT<Object>(item)!);
          });
        }
      }
    }
    return QueryPath(path: asT<String>(json['path']), params: params);
  }

  /// The path template with parameter placeholders
  final String? path;

  /// List of parameter objects for the path
  final List<Object>? params;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the query path to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'path': path,
        'params': params,
      };
}

/// Represents an HTTP request header with validation rules
/// Represents an HTTP request header with validation rules
class ReqHeaders {
  const ReqHeaders({
    this.name,
    this.type,
    this.example,
    this.desc,
    this.required,
    this.id,
    this.value,
  });

  /// Creates a ReqHeaders from JSON data
  factory ReqHeaders.fromJson(Map<String, dynamic> json) => ReqHeaders(
        name: asT<String>(json['name']),
        type: asT<String>(json['type']),
        example: asT<String>(json['example']),
        desc: asT<String>(json['desc']),
        required: asT<String>(json['required']),
        id: asT<String>(json['_id']),
        value: asT<String>(json['value']),
      );

  /// Header name (e.g., 'Content-Type', 'Authorization')
  final String? name;

  /// Header value type (e.g., 'string', 'number')
  final String? type;

  /// Example value for the header
  final String? example;

  /// Description of the header's purpose
  final String? desc;

  /// Whether this header is required (stored as string for compatibility)
  final String? required;

  /// Unique identifier for this header
  final String? id;

  /// Default or expected value for the header
  final String? value;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the request header to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'type': type,
        'example': example,
        'desc': desc,
        'required': required,
        '_id': id,
        'value': value,
      };
}

/// Represents a URL query parameter with validation rules
/// Represents a URL query parameter with validation rules
class ReqQuery {
  const ReqQuery({
    this.name,
    this.type,
    this.example,
    this.desc,
    this.required,
    this.id,
    this.value,
  });

  /// Creates a ReqQuery from JSON data
  factory ReqQuery.fromJson(Map<String, dynamic> json) => ReqQuery(
        name: asT<String>(json['name']),
        type: asT<String>(json['type']),
        example: asT<String>(json['example']),
        desc: asT<String>(json['desc']),
        required: asT<String>(json['required']),
        id: asT<String>(json['_id']),
        value: asT<String>(json['value']),
      );

  /// Query parameter name
  final String? name;

  /// Parameter value type (e.g., 'string', 'number', 'boolean')
  final String? type;

  /// Example value for the parameter
  final String? example;

  /// Description of the parameter's purpose
  final String? desc;

  /// Whether this parameter is required (stored as string for compatibility)
  final String? required;

  /// Unique identifier for this parameter
  final String? id;

  /// Default or expected value for the parameter
  final String? value;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the query parameter to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'type': type,
        'example': example,
        'desc': desc,
        'required': required,
        '_id': id,
        'value': value,
      };
}

/// Represents a URL path parameter (e.g., /users/{id})
/// Represents a URL path parameter (e.g., /users/{id})
class ReqParams {
  const ReqParams({this.name, this.example, this.desc, this.id});

  /// Creates a ReqParams from JSON data
  factory ReqParams.fromJson(Map<String, dynamic> json) => ReqParams(
        name: asT<String>(json['name']),
        example: asT<String>(json['example']),
        desc: asT<String>(json['desc']),
        id: asT<String>(json['_id']),
      );

  /// Path parameter name (matches placeholder in URL path)
  final String? name;

  /// Example value for the parameter
  final String? example;

  /// Description of the parameter's purpose
  final String? desc;

  /// Unique identifier for this parameter
  final String? id;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the path parameter to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'example': example,
        'desc': desc,
        '_id': id,
      };
}

/// Represents a form field in request body for form-data submissions

class ReqBodyForm {
  const ReqBodyForm({
    this.name,
    this.type,
    this.example,
    this.desc,
    this.required,
  });

  /// Creates a ReqBodyForm from JSON data
  factory ReqBodyForm.fromJson(Map<String, dynamic> json) => ReqBodyForm(
        name: asT<String>(json['name']),
        type: asT<String>(json['type']),
        example: asT<String>(json['example']),
        desc: asT<String>(json['desc']),
        required: asT<String>(json['required']),
      );

  /// Form field name
  final String? name;

  /// Field value type (e.g., 'text', 'file', 'number')
  final String? type;

  /// Example value for the field
  final String? example;

  /// Description of the field's purpose
  final String? desc;

  /// Whether this field is required (stored as string for compatibility)
  final String? required;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the form field to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'type': type,
        'example': example,
        'desc': desc,
        'required': required,
      };
}
