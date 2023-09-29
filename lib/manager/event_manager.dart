import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EventManager {
  DateTime currentTime = DateTime.now();
  List eventList = [];
  final CollectionReference eventReference =
      FirebaseFirestore.instance.collection("events");
  final CollectionReference userReference =
      FirebaseFirestore.instance.collection("users");

  Future getLatestData() async {
    List ids = [];
    try {
      await eventReference
          .orderBy('eventStartTime', descending: true)
          .limit(10)
          .get()
          .then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          Map<String, dynamic> eventData =
              result.data() as Map<String, dynamic>;
          eventData['docId'] = result.id; // Add the document ID to the data
          eventList.add(eventData);
        }
      });
      return eventList;
    } catch (e) {
      print("$e===================");
      return e;
    }
  }

  Future getPopulerData() async {
    try {
      await eventReference
          .where('populer', isEqualTo: true)
          .limit(10)
          .get()
          .then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          print(result.data());
          eventList.add(result.data());
        }
      });
      print(eventList);
      return eventList;
    } catch (e) {
      print("$e===================");
      return e;
    }
  }

  Future getEventDetails(String docid) async {
    List data = [];
    var event =
        await eventReference.doc(docid).get();
    print(event.data());
    return event.data();
  }

  Future registerEvent(
    String fullName,
    String enrollment,
    String department,
    String eventId,
    String phoneNo,
  ) async {
    String uid = FirebaseAuth.instance.currentUser?.uid.toString() ?? "";
    try {
      Map<String, dynamic> eventData = {
        'fullName': fullName,
        'enrollment': enrollment,
        'department': department,
        'eventId': eventId,
        'phoneNo': phoneNo,
        'attended':false
      };

      await FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .collection('ticket')
          .doc(eventId)
          .set(eventData);
      await eventReference.doc(eventId).set({
        "eventParticipent": {uid: false},
      }, SetOptions(merge: true));
    } catch (e) {}
  }
}
