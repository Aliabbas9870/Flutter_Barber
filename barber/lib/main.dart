import 'package:barber/views/onbording_view.dart';
import 'package:barber/views/splash_view.dart';
import 'package:barber/widgets/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Constant constant = Constant();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber',
      theme: ThemeData(
      

        colorScheme: ColorScheme.fromSeed(seedColor: constant.primaryColor),
        useMaterial3: true,
      ),
      home: OnbordingView(),
    );
  }
}
