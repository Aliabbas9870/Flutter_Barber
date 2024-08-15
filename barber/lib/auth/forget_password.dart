import 'package:barber/widgets/constant.dart';
import 'package:barber/widgets/uiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({super.key});

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  final Constant constant = Constant();
  TextEditingController emailController = TextEditingController();
  String? email;

  foregetpass(String email) async {
    // try {
    //   await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
    //   QuickAlert.show(
    //     context: context,
    //     autoCloseDuration: Duration(seconds: 1),
    //     type: QuickAlertType.success,
    //     text: 'Password sent successfully!',
    //   );
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == "User not found") {
    //     QuickAlert.show(
    //       context: context,
    //       autoCloseDuration: Duration(seconds: 1),
    //       type: QuickAlertType.success,
    //       text: 'Not User Found!',
    //     );
    //   }
    // }

    if (email == "") {
      return UiHelper.CustomAlertBox(
          context, "Please Enter Email to Reset password");
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recover Password",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(
              emailController, "Enter Email", Icons.email, false),
          SizedBox(
            height: 15,
          ),
          UiHelper.CustomButton(() {
            foregetpass(emailController.text.toString());
          }, "Reset password")
        ],
      ),
    );
  }
}
