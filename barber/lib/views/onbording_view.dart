import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:barbarapp/views/home_view.dart';
import 'package:barbarapp/widgets/constant.dart';
import 'package:flutter/material.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({super.key});

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  final Constant constant = Constant();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NavigateHome();
  }

  NavigateHome() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.lightBgColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          color: constant.lightBgColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Image.asset(
                "assets/images/onBord.png",
                width: 300,
              ),
              SizedBox(
                height: 120,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: constant.secondaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 35.0,
                        color: constant.primaryColor,
                        fontWeight: FontWeight.bold),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TyperAnimatedText('Welcome'),
                        TyperAnimatedText('Barber App'),
                      ],
                      onTap: () {
                        // print("Tap Event");
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
