import 'package:barbarapp/auth/login_auth.dart';
import 'package:barbarapp/views/onbording_view.dart';
import 'package:barbarapp/widgets/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barbar App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: constant.primaryColor),
        useMaterial3: true,
      ),
      home: LoginAuth(),
    );
  }
}
