import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_system/screen/sign_up/provider/signprovider.dart';
import 'package:login_system/utils/sharpre.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Signprovider? providertrue;
  Signprovider? providerfalse;
  bool? _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<Signprovider>(context, listen: true);
    providerfalse = Provider.of<Signprovider>(context, listen: false);

    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 23.5,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/image/bg.png",
                      fit: BoxFit.fill,
                    ),
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
                        Text(
                          "Create",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            color: Color(0xff4b74a6),
                          ),
                        ),
                        Text(
                          "account",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xff4b74a6),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: providertrue!.txtemail,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.email,
                                color: Theme.of(context).primaryColorDark,),
                              label: Text("E-mail"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            obscureText: !_passwordVisible!,
                            controller: providertrue!.txtpassword,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              label: Text("Password"),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              providertrue!.note1,
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: InkWell(
                            onTap: () {
                              if (providerfalse!.txtpassword.text != "" ||
                                  providerfalse!.txtemail.text != "") {
                                providertrue!.note1 = "";
                                createshe(providerfalse!.txtemail.text,
                                    providerfalse!.txtpassword.text);
                                Navigator.pushReplacementNamed(context, 'in');
                              } else {
                                providertrue!.note1 = "Invalid information";
                              }
                            },
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
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 670,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, 'in');
                                },
                                child: Text(
                                  " Sign in",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        )
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
