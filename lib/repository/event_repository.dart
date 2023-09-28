import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notification_app/model/event_details_model.dart';

import 'dart:developer' as developer;

import 'base_event_repository.dart';

class ProductRepository extends BaseProductRepository {

  ProductRepository({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Stream<List<Event>> getAllEvents() {
    developer.log('Getting products from firestore...', name: 'ProductState');
    return _firestore.collection('events').snapshots().map((snapshot) {
      developer.log('Got product: ${snapshot.toString()}', name: 'ProductState');
      return snapshot.docs.map((doc) => Event.fromSnpashot(doc)).toList();
    });
  }

}