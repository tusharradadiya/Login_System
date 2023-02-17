import 'package:flutter/material.dart';
import 'package:login_system/screen/sign_in/view/signinPage.dart';
import 'package:login_system/screen/sign_up/provider/signprovider.dart';
import 'package:login_system/screen/sign_up/view/signupPage.dart';
import 'package:login_system/screen/splash/splashcreen.dart';
import 'package:login_system/screen/welcome/view/welcomepage.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  runApp(

    ChangeNotifierProvider(create: (context) => Signprovider(),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          'up': (context) => SignupPage(),
          'in': (context) => SignInPage(),
          'welcome': (context) => WelcomePage(),
        },
      ),
    ),
  );
}
