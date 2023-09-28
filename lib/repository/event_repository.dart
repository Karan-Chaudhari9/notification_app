import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notification_app/model/event_details_model.dart';

import 'dart:developer' as developer;

import 'base_event_repository.dart';

class EventRepository extends BaseEventRepository {

  EventRepository({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Stream<List<Event>> getAllEvents() {
    developer.log('Getting Events from firestore...', name: 'EventState');
    return _firestore.collection('Events').snapshots().map((snapshot) {
      developer.log('Got Event: ${snapshot.toString()}', name: 'EventState');
      return snapshot.docs.map((doc) => Event.fromSnpashot(doc)).toList();
    });
  }

}