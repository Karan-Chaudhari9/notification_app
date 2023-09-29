import 'package:flutter/material.dart';
import 'package:notification_app/manager/event_manager.dart';
import 'package:notification_app/manager/ticket_manager.dart';
import 'package:shimmer/shimmer.dart';

class NotifactionLayout extends StatefulWidget {
  const NotifactionLayout({super.key});

  @override
  State<NotifactionLayout> createState() => _NotifactionLayoutState();
}

class _NotifactionLayoutState extends State<NotifactionLayout> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TicketManager().getTickets(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error occurs");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List data = snapshot.data as List;
          return Scaffold(
            body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                    future:
                        EventManager().getEventDetails(data[index]['eventId']),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26)),
                          child: ListTile(
                            leading: Icon(Icons.notifications),
                            title: Text(snapshot.data['eventTitle']),
                            subtitle: Text("12/12/2023 10:00 AM"),
                          ),
                        );
                      }
                      return Center(
                        child: SizedBox(
                          width: 200.0,
                          height :70.0,
                          child: Shimmer.fromColors(
                            baseColor: Colors.white10,
                            highlightColor: Colors.white54,
                            child: Container(color: Colors.black),
                          ),
                        ),
                      );
                    });
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
