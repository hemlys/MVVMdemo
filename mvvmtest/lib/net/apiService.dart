import 'dio_util.dart';

class LoginModel {
  //提供api请求方法，并把接口返回信息当作返回值
  dynamic login(Map map) async {
    return await post(
        "http://106.38.32.194:86/OrderTrackerService.asmx/Login", map);
  }

  dynamic version() async {
    return await get("https://yt-rabbit.com/mission/getapiv2");
  }
}
