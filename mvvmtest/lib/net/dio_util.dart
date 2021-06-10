import 'package:dio/dio.dart';

//代码很简单，需要传一个接口地址，以及参数
dynamic post(String url, Map map) async {
  Response response = await Dio().post(url, data: map);
  return response.data;
}

dynamic get(String url) async {
  Response response = await Dio().get(url);
  return response;
}
