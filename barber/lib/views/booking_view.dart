import 'package:barber/services/database.dart';
import 'package:barber/services/sharePref.dart';
import 'package:barber/widgets/constant.dart';
import 'package:barber/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class BookingView extends StatefulWidget {
  String service;

  BookingView({super.key, required this.service});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final Constant constant = Constant();

  String? name, image, email;
  getDataFromShare() async {
    name = await sharePref().getUserName();
    image = await sharePref().getUserImage();
    name = await sharePref().getUserName();
    setState(() {});
  }

  getLoadData() async {
    await getDataFromShare();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getLoadData();
    super.initState();
  }

  DateTime slectDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pick = await showDatePicker(
        context: context,
        initialDate: slectDate,
        firstDate: slectDate,
        lastDate: DateTime(2026));
    if (pick != null && pick != slectDate) {
      setState(() {
        slectDate = pick;
      });
    }
  }

  TimeOfDay slectTime = TimeOfDay.now();
  Future<void> slectTim(BuildContext context) async {
    final TimeOfDay? pick =
        await showTimePicker(context: context, initialTime: slectTime);
    if (pick != null && pick != slectTime) {
      setState(() {
        slectTime = pick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constant.lightBgColor,
        body: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.only(top: 41, left: 7),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                    color: constant.primaryColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Let's the \njourny begin",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: constant.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Image.asset(
                        "assets/images/diss.png",
                        height: 188,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.service,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: constant.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 12),
                    height: 102,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: constant.secondaryColor),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Text(
                          "Set a date",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: constant.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: Icon(
                                Icons.calendar_month,
                                color: constant.primaryColor,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${slectDate.day}/${slectDate.month}/${slectDate.year}",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: constant.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 12),
                    height: 102,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: constant.secondaryColor),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Text(
                          "Set a Time",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: constant.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                slectTim(context);
                              },
                              child: Icon(
                                Icons.alarm,
                                color: constant.primaryColor,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${slectTime.format(context)}",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: constant.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                      onTap: () async {
                        // Show "Please wait" message
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.loading,
                          title: 'Please wait',
                          text: 'Saving your booking...',
                        );

                        Map<String, dynamic> userBookingMap = {
                          "Service": widget.service,
                          "Date":
                              "${slectDate.day}/${slectDate.month}/${slectDate.year}"
                                  .toString(),
                          "Time": slectTime.format(context).toString(),
                          "Name": name,
                          "Image": image,
                          "Email": email,
                        };

                        await DataBaseMethod()
                            .adduserBooking(userBookingMap)
                            .then((val) {
                          // Close the "Please wait" message
                          Navigator.pop(context);

                          // Show success message
                          QuickAlert.show(
                            context: context,
                            onConfirmBtnTap: () async {
                              await Future.delayed(Duration(seconds: 0));
                              Navigator.pop(context);
                            },
                            type: QuickAlertType.success,
                            text: 'Service has been booked successfully!',
                          );
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        // height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: constant.secondaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("BOOK NOW",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: constant.primaryColor)),
                            )),
                      ))
                ])));
  }
}
