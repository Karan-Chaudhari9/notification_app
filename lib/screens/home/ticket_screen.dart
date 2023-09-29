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
          List ticket = snapshot.data as List;
          return Scaffold(
            body: ListView.builder(
              itemCount: ticket.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                    future: EventManager().getEventDetails(ticket[index]['eventId']),
                    builder:(context,snapshot) {
                      if(snapshot.connectionState == ConnectionState.done){
                      return Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26)
                        ),
                        child: ListTile(
                          leading: Icon(Icons.event),
                          title: Text(snapshot.data['eventTitle']),
                          subtitle: Text("09/12/2023 10:00 AM to 12:00 AM"),
                          onTap: (){

                          },
                        ),
                      );}
                      return Center(child: CircularProgressIndicator());
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
