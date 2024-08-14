import 'package:barbarapp/auth/register_auth.dart';
import 'package:barbarapp/widgets/constant.dart';
import 'package:flutter/material.dart';

class LoginAuth extends StatefulWidget {
  const LoginAuth({super.key});

  @override
  State<LoginAuth> createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  final Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50.0, left: 15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  constant.bgColor,
                  constant.lightBgColor,
                  constant.secondaryColor
                ])),
                child: Text(
                  "Hello\nsign in!",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: constant.primaryColor),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 15, left: 12, right: 12, bottom: 5),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                decoration: BoxDecoration(
                    color: constant.lightBgColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "GMail",
                      style:
                          TextStyle(fontSize: 18, color: constant.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter the email",
                          prefixIcon: Icon(Icons.email)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Password",
                      style:
                          TextStyle(fontSize: 18, color: constant.primaryColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter the password",
                          prefixIcon: Icon(Icons.lock)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forget Password?",
                          style: TextStyle(
                              fontSize: 16,
                              color: constant.primaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 44,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors: [
                            constant.bgColor,
                            constant.lightBgColor
                          ])),
                      child: Center(
                          child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: constant.primaryColor),
                      )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have a account?",
                          style: TextStyle(
                              fontSize: 16, color: constant.primaryColor),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => RegisterAuth()));
                          },
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 20,
                                color: constant.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
