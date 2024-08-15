import 'package:barber/services/database.dart';
import 'package:barber/views/home_view.dart';
import 'package:barber/widgets/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class BookingAdmin extends StatefulWidget {
  const BookingAdmin({super.key});

  @override
  State<BookingAdmin> createState() => _BookingAdminState();
}

class _BookingAdminState extends State<BookingAdmin> {
  final Constant constant = Constant();
  Stream? bookingStream;
  gettheLoad() async {
    bookingStream = await DataBaseMethod().getBooking();
    setState(() {});
  }

  @override
  void initState() {
    gettheLoad();
    // TODO: implement initState
    super.initState();
  }

  Widget allBooking() {
    return StreamBuilder(
        stream: bookingStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5.0,
                        // borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(colors: [
                                constant.bgColor,
                                constant.lightBgColor,
                                constant.secondaryColor
                              ])),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Services :" + ds["Service"],
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: constant.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Name : " + ds['Name'],
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: constant.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Date : " + ds["Date"],
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: constant.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Time : " + ds["Time"],
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: constant.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  await DataBaseMethod().deleteBooking(ds.id);
                                  QuickAlert.show(
                                    context: context,
                                    title: "Service",
                                    autoCloseDuration: Duration(seconds: 1),
                                    type: QuickAlertType.success,
                                    text: 'Deleted successfully!',
                                  );
                                },
                                child: Container(
                                  width: 80,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: constant.secondaryColor),
                                  child: Center(
                                    child: Text("Done",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: constant.primaryColor)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constant.lightBgColor,
        appBar: AppBar(
          backgroundColor: constant.lightBgColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (c) => HomeView()));
                  },
                  child: Icon(
                    Icons.home,
                    color: constant.primaryColor,
                  )),
              Center(
                child: Text(
                  "All Booking ",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: constant.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (c) => HomeView()));
                },
                child: Icon(
                  Icons.logout,
                  color: constant.primaryColor,
                  size: 25,
                ),
              )
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(child: allBooking()),
            ],
          ),
        ));
  }
}
