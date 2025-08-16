import 'package:yapi_api/yapi_api.dart';

void main() {
  final YapiApiHelper apiHelper = YapiApiHelper();
  apiHelper.baseUrl = 'http://yapi.example.com';
  apiHelper.cookie = 'your_cookie_here';

  apiHelper.getInterface(1).then((YapiInterfaceResponse? response) {
    if (response != null) {
      print('interface: ${response.data?.title}');
    } else {
      print('get interface failed ');
    }
  });

  apiHelper.getProject(1).then((YapiProjectResponse? response) {
    if (response != null) {
      print('project : ${response.data?.name}');
    } else {
      print('get project failed ');
    }
  });
}
