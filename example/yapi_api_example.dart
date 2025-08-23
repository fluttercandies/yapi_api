import 'package:yapi_api/yapi_api.dart';

void main() async {
  final YapiApiHelper apiHelper = YapiApiHelper();
  apiHelper.baseUrl = 'http://yapi.example.com';
  // or set cookie directly if you have already logged in
  // apiHelper.cookie = 'your_cookie_here';
  YapiLoginResponse? loginResponse =
      await apiHelper.login(email: '', password: '');
  if (loginResponse != null && loginResponse.errcode == 0) {
    print('login success');
  } else {
    print('login failed : ${loginResponse?.errmsg}');
    return;
  }

  YapiProjectResponse? projectResponse = await apiHelper.getProject(1);
  if (projectResponse != null) {
    print('project : ${projectResponse.data?.name}');
  } else {
    print('get project failed ');
  }
  YapiInterfaceResponse? interfaceResponse = await apiHelper.getInterface(1);
  if (interfaceResponse != null) {
    print('interface : ${interfaceResponse.data?.title}');
  } else {
    print('get interface failed ');
  }

  var logoutResponse = await apiHelper.logout();
  if (logoutResponse != null && logoutResponse.errcode == 0) {
    print('logout success');
  } else {
    print('logout failed : ${logoutResponse?.errmsg}');
  }
}
