import 'package:flutter/material.dart';
import 'package:notification_app/manager/event_manager.dart';

class EventAttedance extends StatefulWidget {
  final String docid;

  const EventAttedance({super.key, required this.docid});

  @override
  State<EventAttedance> createState() => _EventAttedanceState();
}

class _EventAttedanceState extends State<EventAttedance> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EventManager().getEventDetails(widget.docid),
      builder: (context, snapshot) {
        Map<String,dynamic> data = snapshot.data['eventParticipent'] as Map<String,dynamic>;
        print(data);
        return FutureBuilder(
          future: EventManager().getUserData("docid"),
          builder: (context, snapshot) {
            Map<String,dynamic> data = snapshot.data['eventParticipent'] as Map<String,dynamic>;
            print(data);
            return Placeholder();
          },
        );
      },
    );
  }
}
