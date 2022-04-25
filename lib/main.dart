import 'package:dashboard_site/views/home/home_page.dart';
import 'package:dashboard_site/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';
import 'routes/routes_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard_site',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/auth',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

class AuthVerify extends StatelessWidget {
  const AuthVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return GetBuilder(
      init: Controller.to,
      builder: (_) => FutureBuilder(
        future: Controller.to.authRepository.isLogado(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
            Controller.to.authRepository.isUserAuthenticated
                ? const MyHomePage()
                : const LoginPage(),
      ),
    );
  }
}
