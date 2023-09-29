import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TicketManager {
  List tickets = [];

  String? uid = FirebaseAuth.instance.currentUser?.uid.toString();
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('user');

  Future getTickets() async {
   await _collectionReference
        .doc(uid)
        .collection('ticket')
        .get()
    .then((quearySnapshot){
      for(var result in quearySnapshot.docs){
        tickets.add(result.data());
      }
    });
    return tickets;
  }

}
