import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String documentId;
  final String eventName;
  final String eventTitle;
  final String eventStartTitle;
  final String eventEndTime;
  final String eventVanue;
  final String eventDetails;
  final String eventDescription;
  final String bannerUrl;

  EventModel({
    required this.documentId,
    required this.eventName,
    required this.eventTitle,
    required this.eventStartTitle,
    required this.eventEndTime,
    required this.eventVanue,
    required this.eventDetails,
    required this.eventDescription,
    required this.bannerUrl,
  });

  static EventModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snap) {
    final data = snap.data() as Map<String, dynamic>;
    return EventModel(
      documentId: snap.id,
      eventName: data['eventName'],
      eventTitle: data['eventTitle'],
      eventStartTitle: data['eventStartTime'],
      eventEndTime: data['eventEndTime'],
      eventVanue: data['eventVanue'],
      eventDetails: data['eventDetails'],
      eventDescription: data['eventDescription'],
      bannerUrl: data['bannerUrl'],
    );
  }
}
