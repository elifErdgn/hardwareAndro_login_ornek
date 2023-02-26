import 'package:flutter/material.dart';
import 'package:hardwareandro_login/core/auth_manager.dart';
import 'package:hardwareandro_login/splash/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<AuthenticationManager>(
        create: (context) => AuthenticationManager(context: context),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashView(), 
    );
  }
}
