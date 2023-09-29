import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notification_app/manager/event_manager.dart';
import 'package:notification_app/manager/ticket_manager.dart';

class TicketLayout extends StatefulWidget {
  const TicketLayout({super.key});

  @override
  State<TicketLayout> createState() => _TicketLayoutState();
}

class _TicketLayoutState extends State<TicketLayout> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TicketManager().getTickets(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error occurs");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.data as List);
          List data = snapshot.data as List;
          return Scaffold(
            body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                    future: EventManager().getEventDetails(data[index]['eventId']),
                    builder:(context,snapshot) {
                      print(snapshot.data);
                      return Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26)
                        ),
                        child: ListTile(
                          leading: Icon(Icons.notifications),
                          title: Text(snapshot.data['eventTitle']),
                          subtitle: Text("12/12/2023 10:00 AM"),
                        ),
                      );
                    }
                );
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
