import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/sharpre.dart';
import '../../sign_up/provider/signprovider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Signprovider? providertrue;
  Signprovider? providerfalse;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    alreadylogin(false);
    providertrue = Provider.of<Signprovider>(context, listen: true);
    providerfalse = Provider.of<Signprovider>(context, listen: false);
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
                        SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            controller: providertrue!.txtuseremail,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              label: Text("Username"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextField(
                            controller: providertrue!.txtuserpassword,

                            obscureText: !_passwordVisible!,
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
                              providertrue!.note2,
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
                            onTap: () async {
                              String? password = await readpasswordpref();
                              String? email = await reademailpref();

                              if (providertrue!.txtuseremail.text == email ||
                                  providertrue!.txtuserpassword.text ==
                                      password) {
                                providertrue!.note2 = "";
                                alreadylogin(true);
                                createusershe(providertrue!.txtuseremail.text,
                                    providertrue!.txtuserpassword.text);
                                Navigator.pushReplacementNamed(
                                    context, 'welcome');
                              } else {
                                providertrue!.note2 = "Wrong information";
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
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 650,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, 'up');
                                },
                                child: Text(
                                  " Sign up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
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
