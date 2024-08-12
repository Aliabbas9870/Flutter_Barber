import 'package:barber/auth/register_auth.dart';
import 'package:barber/views/home_view.dart';
import 'package:barber/widgets/ASM.dart';
import 'package:barber/widgets/constant.dart';
import 'package:barber/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LoginAuth extends StatefulWidget {
  const LoginAuth({super.key});

  @override
  State<LoginAuth> createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  final Constant constant = Constant();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final Asm ASM = Asm();

  validateSignInForm() {
    if (!emailController.text.contains("@")) {
      ASM.showSnackBarmsg("Email not valid", context);
    } else if (passwordController.text.trim().length < 5) {
      ASM.showSnackBarmsg("Password must be at least 5 or more", context);
    } else {
      signInUserNow();
    }
  }

  signInUserNow() async {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            LoadingDialog(textMessage: "Please wait....."));
    try {
      final User? firebaseuser = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim())
              .catchError((c) {
        Navigator.pop(context);
        ASM.showSnackBarmsg(c.toString(), context);
      }))
          .user;

      if (firebaseuser != null) {
        DatabaseReference ref = FirebaseDatabase.instance
            .ref()
            .child("users")
            .child(firebaseuser!.uid);
        await ref.once().then((dataSnapshot) {
          if (dataSnapshot.snapshot.value != null) {
            if ((dataSnapshot.snapshot.value as Map)["blockStatus"] == "no") {
              UserName = (dataSnapshot.snapshot.value as Map)["name"];
              UserPhone = (dataSnapshot.snapshot.value as Map)["phone"];
              //   UserEmail = (dataSnapshot.snapshot.value as Map)["email"];
              // UserPass = (dataSnapshot.snapshot.value as Map)["password"];
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => HomeView()));
              ASM.showSnackBarmsg("Signin successfully!", context);
              QuickAlert.show(
                context: context,
                autoCloseDuration: Duration(seconds: 1),
                type: QuickAlertType.success,
                text: 'signin Successfully!',
              );
            } else {
              Navigator.pop(context);
              FirebaseAuth.instance.signOut();
              ASM.showSnackBarmsg(
                  "You are Blocked please Contact  admin: aliabbascs59@gmail.com",
                  context);
            }
          } else {
            Navigator.pop(context);

            FirebaseAuth.instance.signOut();
            ASM.showSnackBarmsg("Your record not exit as  user", context);
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      FirebaseAuth.instance.signOut();
      Navigator.pop(context);
      ASM.showSnackBarmsg(e.toString(), context);
    }
  }

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
                      controller: emailController,
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
                      controller: passwordController,
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
                    InkWell(
                      onTap: () {
                        validateSignInForm();
                      },
                      child: Container(
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
