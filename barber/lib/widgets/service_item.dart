import 'package:barbarapp/widgets/constant.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String img;
  final String text;
  final VoidCallback callback;
  final Constant constant = Constant();

  ServiceItem(
      {super.key,
      required this.img,
      required this.text,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: InkWell(
        onTap: callback,
        child: Container(
          height: 153,
          decoration: BoxDecoration(
              color: constant.secondaryColor,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img,
                width: 88,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 22.0,
                    color: constant.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
