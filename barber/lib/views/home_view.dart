import 'package:barber/views/booking_view.dart';
import 'package:barber/widgets/constant.dart';
import 'package:barber/widgets/service_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Constant constant = Constant();
  FirebaseAuth user = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constant.lightBgColor,
      body: Container(
        padding: EdgeInsets.only(top: 38, left: 15, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: constant.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Ali",
                      style: TextStyle(
                          fontSize: 28.0,
                          color: constant.primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/grl.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 3,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Services",
              style: TextStyle(
                  fontSize: 25.0,
                  color: constant.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              // onTap: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (c) => BookingView(
              //                 service: "Classic shave",
              //               )));
              // },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ServiceItem(
                      img: 'assets/images/shave.png',
                      text: 'classic shave',
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => BookingView(
                                      service: "Classic shave",
                                    )));
                      },
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    ServiceItem(
                      img: 'assets/images/facial.png',
                      text: 'Facial',
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => BookingView(
                                      service: "Facial",
                                    )));
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ServiceItem(
                    img: 'assets/images/hair-cut.png',
                    text: 'hair cutting',
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => BookingView(
                                    service: "hair cutting",
                                  )));
                    },
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ServiceItem(
                    img: 'assets/images/hair-comb.png',
                    text: 'hair comb',
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => BookingView(
                                    service: "hair comb",
                                  )));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ServiceItem(
                    img: 'assets/images/hair-washing.png',
                    text: 'hair washing',
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => BookingView(
                                    service: "hair washing",
                                  )));
                    },
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ServiceItem(
                    img: 'assets/images/makeup.png',
                    text: 'Mackup',
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => BookingView(
                                    service: "Mackup",
                                  )));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
