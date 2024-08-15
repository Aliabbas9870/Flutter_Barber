import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBaseMethod {
  Future adduserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .set(userInfoMap);
  }

  Future adduserBooking(Map<String, dynamic> userBookingMap) async {
    return await FirebaseFirestore.instance
        .collection("Booking")
        .add(userBookingMap);
  }

  Future<Stream<QuerySnapshot>> getBooking() async {
    return await FirebaseFirestore.instance.collection("Booking").snapshots();
  }
Future deleteBooking(String id) async {
    return await FirebaseFirestore.instance
        .collection("Booking")
        .doc(id).delete();
  }

 
}
