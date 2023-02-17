import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_system/utils/sharpre.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
          () async {
        bool? a = await readlogin();
        if (a != true) {
          Navigator.pushReplacementNamed(context, 'up');
        } else {
          Navigator.pushReplacementNamed(context, 'welcome');
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FlutterLogo(size: 80),
        ),
      ),
    );
  }
}
