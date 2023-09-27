import 'package:cloud_firestore/cloud_firestore.dart';

class Event{
  final String eventName;
  final int eventRSVPLimit;
  final String eventStatus;
  final String eventRSVPConfirmed;
  final String groupName;
  final String groupLocation;
  final String groupmeetupPageLink;
  final String eventDescription;

  Event({
    required this.eventName,
    required this.eventRSVPLimit,
    required this.eventStatus,
    required this.eventRSVPConfirmed,
    required this.groupName,
    required this.groupLocation,
    required this.groupmeetupPageLink,
    required this.eventDescription,
  });

  static Event fromSnpashot(DocumentSnapshot snap) {
    return Event(
      eventName: snap['name'],
      eventRSVPLimit: snap['rsvp_limit'],
      eventStatus: snap['status'],
      eventRSVPConfirmed: snap['yes_rsvp_count'],
      groupName: snap['group']['name'],
      groupLocation: snap['group']['localized_location'],
      groupmeetupPageLink: snap['link'],
      eventDescription: snap['description'],
    );
  }
}
