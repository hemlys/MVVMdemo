import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LoginViewmodel.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登陆"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: Provider.of<LoginViewmodel>(context).user,//获取viewmodel管理的controller状态
              decoration: InputDecoration(
                labelText: "账号",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: Provider.of<LoginViewmodel>(context).pass,//获取viewmodel管理的controller状态
              decoration: InputDecoration(
                labelText: "密码",
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: context.read<LoginViewmodel>().login,//调用viewmodel层的登陆方法
                color: Colors.blue,
                child: Text(
                  "登陆",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child:
              Text(Provider.of<LoginViewmodel>(context).result.toString()),////获取viewmodel管理的result错误信息
            ),
          ],
        ),
      ),
    );
  }
}