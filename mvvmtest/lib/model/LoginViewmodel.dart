// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import '../page/login.dart';
// import '../net/apiService.dart';
// import '../main.dart';
// import '../bean/versionBean.dart';

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bean/versionBean.dart';
import '../main.dart';
import '../net/apiService.dart';
import '../page/login.dart';

class loginViewmodel extends ChangeNotifier {
  //model对象，用于调用api请求方法
  late versionBean mversionBean;
  LoginModel _model = LoginModel();

  //账号输入框controller
  TextEditingController _user = TextEditingController();

  //密码输入框controller
  TextEditingController _pass = TextEditingController();
  dynamic _result = ""; //登陆返回的错误信息，如果正确登陆，则为空
  //
  // 下边get set方法不做介绍

  TextEditingController get user {
    return _user;
  }

  TextEditingController get pass {
    return _pass;
  }

  void setResult(dynamic data) {
    _result = data;
    notifyListeners(); //如果有错误信息，则刷新所有观察者
    //比如一个text用了这个值，则视为观察者
    //必须正确使用provider状态管理，才可以监听到值，下一步骤会告诉大家怎么配置provider
  }

  dynamic get result {
    return _result;
  }

  Future login() async {
    //给view层提供登陆方法
    // dynamic result = await _model.login({//调用model层的api请求方法，并把参数当作map传给model，提供给dio请求
    //   "userName": _user.text,
    //   "passWord": _pass.text,
    // });
    var result = await _model.version();
    print(result.toString()); //返回值
    setResult(result.toString());

    versionBean resultse = versionBean.fromJson(json.decode(result.toString()));
    // print(resultse.eNC);
    // print(resultse.eNV);
    // print(resultse.key);
    // print(resultse.message);

    // if (result.toString().substring(0, 5) == "false") {
    //   //如果登陆失败，则在界面提示错误信息
    //   //我的如果登陆失败返回格式为 **false错误信息**
    //   //所以我的错误信息要从第六位截取
    //   setResult(result.toString().substring(5));
    // } else {
    //   setResult(""); //登陆成功，清空错误提示信息
    //   //下边代码可以获取到我们刚才设置的全局navigatorKey的context，来实现界面跳转
    //   // Navigator.of(navigatorKey.currentContext).push(
    //   //   CupertinoPageRoute(
    //   //     builder: (context) {
    //   //       // return Menu();
    //   //     },
    //   //   ),
    //   // ); //跳转界面
    // }

    // !強制執行
    Navigator.of(navigatorKey.currentContext!).push(
      CupertinoPageRoute(
        builder: (context) {
          return Login();
        },
      ),
    );
  }
}
