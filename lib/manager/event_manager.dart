import 'package:cloud_firestore/cloud_firestore.dart';

class EventManager {
  DateTime currentTime = DateTime.now();
  List eventList = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("events");

  Future getData() async {
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          print(result.data());
          eventList.add(result.data());
        }
      });
      print(object)
      return eventList;
    } catch (e) {
      print("$e===================");
      return e;
    }
  }
}
