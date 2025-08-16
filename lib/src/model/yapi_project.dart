import 'dart:convert';

import 'package:yapi_api/src/utils.dart';

/// Response wrapper for YApi project data
/// Contains error code, error message, and the actual project data
class YapiProjectResponse {
  const YapiProjectResponse({this.errcode, this.errmsg, this.data});

  /// Creates a YapiProjectResponse from JSON data
  factory YapiProjectResponse.fromJson(Map<String, dynamic> json) =>
      YapiProjectResponse(
        errcode: asT<int>(json['errcode']),
        errmsg: asT<String>(json['errmsg']),
        data: json['data'] == null
            ? null
            : YapiProject.fromJson(asT<Map<String, dynamic>>(json['data'])!),
      );

  /// Error code from the API response
  final int? errcode;

  /// Error message from the API response
  final String? errmsg;

  /// The actual project data
  final YapiProject? data;

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

/// Represents a YApi project with all its settings, members, and metadata
/// Contains project configuration, environments, categories, tags, and team members
class YapiProject {
  /// Creates a YapiProject instance with all optional parameters
  const YapiProject({
    this.switchNotice,
    this.isMockOpen,
    this.strice,
    this.isJson5,
    this.id,
    this.name,
    this.basepath,
    this.projectType,
    this.uid,
    this.groupId,
    this.icon,
    this.color,
    this.addTime,
    this.upTime,
    this.projectName,
    this.env,
    this.tag,
    this.cat,
    this.role,
    this.members,
  });

  /// Creates a YapiProject from JSON data with proper type casting and null safety
  factory YapiProject.fromJson(Map<String, dynamic> json) {
    // Parse environment configurations array safely
    final List<Env>? env = json['env'] is List ? <Env>[] : null;
    if (env != null) {
      for (final dynamic item in json['env']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            env.add(Env.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    // Parse project tags array safely
    final List<Tag>? tag = json['tag'] is List ? <Tag>[] : null;
    if (tag != null) {
      for (final dynamic item in json['tag']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            tag.add(Tag.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    // Parse interface categories array safely
    final List<Cat>? cat = json['cat'] is List ? <Cat>[] : null;
    if (cat != null) {
      for (final dynamic item in json['cat']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            cat.add(Cat.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    // Parse project members array safely
    final List<Members>? members = json['members'] is List ? <Members>[] : null;
    if (members != null) {
      for (final dynamic item in json['members']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            members.add(Members.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }
    // Create YapiProject instance with parsed data
    return YapiProject(
      switchNotice: asT<bool>(json['switch_notice']),
      isMockOpen: asT<bool>(json['is_mock_open']),
      strice: asT<bool>(json['strice']),
      isJson5: asT<bool>(json['is_json5']),
      id: asT<int>(json['_id']),
      name: asT<String>(json['name']),
      basepath: asT<String>(json['basepath']),
      projectType: asT<String>(json['project_type']),
      uid: asT<int>(json['uid']),
      groupId: asT<int>(json['group_id']),
      icon: asT<String>(json['icon']),
      color: asT<String>(json['color']),
      addTime: asT<int>(json['add_time']),
      upTime: asT<int>(json['up_time']),
      projectName: asT<String>(json['project_name']),
      env: env,
      tag: tag,
      cat: cat,
      role: asT<String>(json['role']),
      members: members,
    );
  }

  /// Whether to enable project change notifications
  final bool? switchNotice;

  /// Whether mock server functionality is enabled
  final bool? isMockOpen;

  /// Whether strict mode is enabled for the project
  final bool? strice;

  /// Whether JSON5 format support is enabled
  final bool? isJson5;

  /// Unique identifier for the project
  final int? id;

  /// Project name
  final String? name;

  /// Base path for all APIs in this project
  final String? basepath;

  /// Type of the project (e.g., 'private', 'public')
  final String? projectType;

  /// User ID of the project owner
  final int? uid;

  /// Group ID this project belongs to
  final int? groupId;

  /// Project icon identifier
  final String? icon;

  /// Project color theme
  final String? color;

  /// Timestamp when project was created
  final int? addTime;

  /// Timestamp when project was last updated
  final int? upTime;

  /// Display name of the project
  final String? projectName;

  /// List of environment configurations (dev, staging, prod, etc.)
  final List<Env>? env;

  /// List of tags associated with this project
  final List<Tag>? tag;

  /// List of interface categories within this project
  final List<Cat>? cat;

  /// Current user's role in this project
  final String? role;

  /// List of project members and their roles
  final List<Members>? members;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the project to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'switch_notice': switchNotice,
        'is_mock_open': isMockOpen,
        'strice': strice,
        'is_json5': isJson5,
        '_id': id,
        'name': name,
        'basepath': basepath,
        'project_type': projectType,
        'uid': uid,
        'group_id': groupId,
        'icon': icon,
        'color': color,
        'add_time': addTime,
        'up_time': upTime,
        'project_name': projectName,
        'env': env,
        'tag': tag,
        'cat': cat,
        'role': role,
        'members': members,
      };
}

/// Represents an environment configuration for API testing
/// Contains headers, global variables, and domain settings for different environments
class Env {
  const Env({this.header, this.global, this.id, this.name, this.domain});

  /// Creates an Env from JSON data
  factory Env.fromJson(Map<String, dynamic> json) {
    // Parse environment headers array safely
    final List<Object>? header = json['header'] is List ? <Object>[] : null;
    if (header != null) {
      for (final dynamic item in json['header']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            header.add(asT<Object>(item)!);
          });
        }
      }
    }

    // Parse global variables array safely
    final List<Object>? global = json['global'] is List ? <Object>[] : null;
    if (global != null) {
      for (final dynamic item in json['global']! as List<dynamic>) {
        if (item != null) {
          tryCatch(() {
            global.add(asT<Object>(item)!);
          });
        }
      }
    }
    return Env(
      header: header,
      global: global,
      id: asT<String>(json['_id']),
      name: asT<String>(json['name']),
      domain: asT<String>(json['domain']),
    );
  }

  /// List of default headers for this environment
  final List<Object>? header;

  /// List of global variables for this environment
  final List<Object>? global;

  /// Unique identifier for this environment
  final String? id;

  /// Environment name (e.g., 'development', 'staging', 'production')
  final String? name;

  /// Base domain URL for this environment
  final String? domain;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the environment to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'header': header,
        'global': global,
        '_id': id,
        'name': name,
        'domain': domain,
      };
}

/// Represents a tag for categorizing and organizing interfaces
class Tag {
  const Tag({this.id, this.name, this.desc});

  /// Creates a Tag from JSON data
  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: asT<String>(json['_id']),
        name: asT<String>(json['name']),
        desc: asT<String>(json['desc']),
      );

  /// Unique identifier for this tag
  final String? id;

  /// Tag name for display purposes
  final String? name;

  /// Description of what this tag represents
  final String? desc;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the tag to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'name': name,
        'desc': desc,
      };
}

/// Represents an interface category for organizing APIs within a project
class Cat {
  const Cat({
    this.index,
    this.id,
    this.name,
    this.projectId,
    this.desc,
    this.uid,
    this.addTime,
    this.upTime,
    this.v,
  });

  /// Creates a Cat from JSON data
  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        index: asT<int>(json['index']),
        id: asT<int>(json['_id']),
        name: asT<String>(json['name']),
        projectId: asT<int>(json['project_id']),
        desc: asT<String>(json['desc']),
        uid: asT<int>(json['uid']),
        addTime: asT<int>(json['add_time']),
        upTime: asT<int>(json['up_time']),
        v: asT<int>(json['__v']),
      );

  /// Display order index for this category
  final int? index;

  /// Unique identifier for this category
  final int? id;

  /// Category name for display purposes
  final String? name;

  /// Project ID this category belongs to
  final int? projectId;

  /// Description of this category
  final String? desc;

  /// User ID who created this category
  final int? uid;

  /// Timestamp when category was created
  final int? addTime;

  /// Timestamp when category was last updated
  final int? upTime;

  /// Version number for this category
  final int? v;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the category to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{
        'index': index,
        '_id': id,
        'name': name,
        'project_id': projectId,
        'desc': desc,
        'uid': uid,
        'add_time': addTime,
        'up_time': upTime,
        '__v': v,
      };
}

/// Represents a project member with their role and permissions
class Members {
  const Members({this.uid, this.role});

  /// Creates a Members from JSON data
  factory Members.fromJson(Map<String, dynamic> json) =>
      Members(uid: asT<int>(json['uid']), role: asT<String>(json['role']));

  /// User ID of the project member
  final int? uid;

  /// Role of the member in the project (e.g., 'owner', 'dev', 'guest')
  final String? role;

  @override
  String toString() {
    return jsonEncode(this);
  }

  /// Converts the member to JSON format
  Map<String, dynamic> toJson() => <String, dynamic>{'uid': uid, 'role': role};
}
