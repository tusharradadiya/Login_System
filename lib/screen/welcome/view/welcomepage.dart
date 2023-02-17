import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_system/screen/sign_up/provider/signprovider.dart';
import 'package:provider/provider.dart';

import '../../../utils/sharpre.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {

    Provider.of<Signprovider>(context,listen: true).username();
    alreadylogin(true);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 23.5,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "assets/image/bg.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/image/arrow.png",
                          height: 120,
                          width: 120,
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            color: Color(0xff4b74a6),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Color(0xff4b74a6), Colors.blue]),
                            ),
                            child: Text(
                              "Login as ${Provider.of<Signprovider>(context,listen: true).email}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 650,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            clearpref();
                            Navigator.pushReplacementNamed(context, 'up');
                          },
                          child: Text(
                            "Delete account",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
