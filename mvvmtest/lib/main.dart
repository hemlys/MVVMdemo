import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/loginViewmodel.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => loginViewmodel()),
      //多个界面请在下方添加多个viewmodel
    ],
    child: MyApp(),
  ));
}
// final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
 GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<loginViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("登陆"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: viewmodel.user,//获取viewmodel管理的controller状态
              decoration: InputDecoration(
                labelText: "账号",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: viewmodel.pass,//获取viewmodel管理的controller状态
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
                // onPressed: context.read<loginViewmodel>().login,//调用viewmodel层的登陆方法
                onPressed:(){
                  print("點到我了");
                  viewmodel.login();
                },
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
              Text(viewmodel.result.toString()),////获取viewmodel管理的result错误信息
            ),
          ],
        ),
      ),
    );
  }
}
