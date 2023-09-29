import 'package:cloud_firestore/cloud_firestore.dart';

class EventFirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addEvent(Map<String, dynamic> eventData) async {
    try {
      await _firestore.collection('events').add(eventData);
    } catch (e) {
      // Handle errors
      print('Error adding event: $e');
    }
  }
}
