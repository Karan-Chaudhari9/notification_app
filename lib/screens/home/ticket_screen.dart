import 'package:flutter/material.dart';
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
                List eventInfo = TicketManager().getTickets();
                return ListTile(
                  title: Text(data[index]['eventId']),
                  subtitle: Text(""),
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
