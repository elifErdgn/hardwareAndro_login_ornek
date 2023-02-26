import 'package:flutter/material.dart';
import 'package:hardwareandro_login/core/auth_manager.dart';
import 'package:hardwareandro_login/core/cache_manager.dart';
import 'package:hardwareandro_login/home/user_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with CacheManager {
  String token = '';
  late UserModel? usermodel;

  Future<void> getTokenCache() async {
    token = await getToken() ?? '';
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usermodel = context.read<AuthenticationManager>().model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            usermodel?.name ?? 'boş',
          ),
        ],
      ),
    );
  }
}
