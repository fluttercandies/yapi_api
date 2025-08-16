# YApi API

A Dart package for interacting with YApi server APIs. This package provides easy-to-use methods to fetch interface and project data from YApi with proper authentication and error handling.

YApi is a powerful API management platform that allows teams to design, document, and test APIs collaboratively. This package simplifies the integration with YApi servers in Dart and Flutter applications.

## Features

- 🚀 **Simple API Integration**: Easy-to-use singleton pattern for YApi server communication
- 🔐 **Authentication Support**: Cookie-based authentication for secure API access
- 📝 **Interface Management**: Fetch detailed interface/endpoint information including:
  - Request/response specifications
  - Headers, query parameters, and path parameters
  - Request body configurations (JSON, form-data)
  - Documentation and examples
- 🏗️ **Project Management**: Retrieve comprehensive project data including:
  - Project settings and configurations
  - Environment configurations (dev, staging, production)
  - Interface categories and tags
  - Team members and roles
- 🛡️ **Error Handling**: Robust error handling with proper logging
- 🎯 **Type Safety**: Fully typed models with null safety support
- ⚡ **Performance**: Efficient JSON parsing with safe type casting

## Getting started

### Prerequisites

- Dart SDK 3.6.2 or higher
- Access to a YApi server instance
- Valid authentication cookie for the YApi server

### Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  yapi_api: ^1.0.0
```

Then run:

```bash
dart pub get
```

## Usage

## Usage

### Basic Setup

First, configure the YApi API helper with your server details:

```dart
import 'package:yapi_api/yapi_api.dart';

void main() async {
  // Get the singleton instance
  final yapiApi = YapiApiHelper();
  
  // Configure your YApi server
  yapiApi.baseUrl = 'https://your-yapi-server.com';
  yapiApi.cookie = 'your-authentication-cookie';
}
```

### Fetching Interface Data

Retrieve detailed information about a specific API interface:

```dart
// Fetch interface by ID
final interfaceResponse = await yapiApi.getInterface(12345);

if (interfaceResponse != null && interfaceResponse.errcode == 0) {
  final interface = interfaceResponse.data!;
  
  print('Interface: ${interface.title}');
  print('Method: ${interface.method}');
  print('Path: ${interface.path}');
  print('Description: ${interface.desc}');
  
  // Access request headers
  if (interface.reqHeaders != null) {
    for (final header in interface.reqHeaders!) {
      print('Header: ${header.name} = ${header.value}');
    }
  }
  
  // Access query parameters
  if (interface.reqQuery != null) {
    for (final param in interface.reqQuery!) {
      print('Query: ${param.name} (${param.type})');
    }
  }
} else {
  print('Failed to fetch interface: ${interfaceResponse?.errmsg}');
}
```

### Fetching Project Data

Get comprehensive project information including environments and team members:

```dart
// Fetch project by ID
final projectResponse = await yapiApi.getProject(67890);

if (projectResponse != null && projectResponse.errcode == 0) {
  final project = projectResponse.data!;
  
  print('Project: ${project.name}');
  print('Base Path: ${project.basepath}');
  print('Type: ${project.projectType}');
  
  // Access environments
  if (project.env != null) {
    for (final env in project.env!) {
      print('Environment: ${env.name} - ${env.domain}');
    }
  }
  
  // Access categories
  if (project.cat != null) {
    for (final category in project.cat!) {
      print('Category: ${category.name} - ${category.desc}');
    }
  }
  
  // Access team members
  if (project.members != null) {
    for (final member in project.members!) {
      print('Member: ${member.uid} (${member.role})');
    }
  }
} else {
  print('Failed to fetch project: ${projectResponse?.errmsg}');
}
```

### Error Handling

The package includes built-in error handling:

```dart
try {
  final response = await yapiApi.getInterface(12345);
  
  if (response == null) {
    print('Network error or invalid response');
    return;
  }
  
  if (response.errcode != 0) {
    print('API Error: ${response.errmsg}');
    return;
  }
  
  // Success - use response.data
  final interface = response.data!;
  // ... process interface data
  
} catch (e) {
  print('Exception occurred: $e');
}
```

## API Reference

### YapiApiHelper

The main class for interacting with YApi servers.

#### Properties

- `baseUrl`: YApi server base URL (e.g., 'https://yapi.example.com')
- `cookie`: Authentication cookie string

#### Methods

- `getInterface(int id)`: Fetches interface data by ID
- `getProject(int id)`: Fetches project data by ID

### Response Models

- `YapiInterfaceResponse`: Contains interface data with error handling
- `YapiProjectResponse`: Contains project data with error handling
- `YapiInterface`: Detailed interface/endpoint information
- `YapiProject`: Comprehensive project configuration and metadata

## Additional information

## Additional information

### About YApi

YApi (Yet Another API) is an open-source API management platform that helps teams:
- Design and document APIs collaboratively
- Generate API documentation automatically
- Test APIs with built-in tools
- Manage different environments (development, staging, production)
- Control access with user roles and permissions

### Contributing

We welcome contributions! Please feel free to submit issues and pull requests.

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Issues and Support

- 🐛 **Bug Reports**: [GitHub Issues](https://github.com/fluttercandies/yapi_api/issues)
- 💡 **Feature Requests**: [GitHub Issues](https://github.com/fluttercandies/yapi_api/issues)
- 📖 **Documentation**: Check out the inline documentation in the source code
- 💬 **Questions**: Feel free to open a discussion in the repository

### Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed history of changes.

### License

This project is part of the [FlutterCandies](https://github.com/fluttercandies) organization.

### Related Packages

If you're working with APIs in Flutter, you might also be interested in:
- `http`: HTTP client for Dart (used internally by this package)
- `dio`: Powerful HTTP client with interceptors and global configuration
- `json_annotation`: Code generation for JSON serialization

---

Made with ❤️ by the FlutterCandies team
