import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/LoginViewmodel.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page"),
      ),
      body: Container(
        width: double.infinity,
        child: Text(Provider.of<LoginViewmodel>(context).result.toString()),
      ),
    );
  }
}
