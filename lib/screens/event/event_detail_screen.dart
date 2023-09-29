import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/manager/event_manager.dart';
import 'package:notification_app/screens/event/event_register.dart';

class EventDetailsScreen extends StatefulWidget {
  final String docId;

  const EventDetailsScreen({super.key, required this.docId});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: EventManager().getEventDetails(widget.docId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Error occured"));
          } else if (snapshot.connectionState == ConnectionState.done) {
            data = snapshot.data; // Replace with your millisecond value
            DateTime dateTime =
                DateTime.fromMillisecondsSinceEpoch(data['eventStartTime']);
            DateTime dateTimeb =
                DateTime.fromMillisecondsSinceEpoch(data['eventEndTime']);
            int year = dateTime.year;
            int month = dateTime.month;
            int day = dateTime.day;
            Map<String,dynamic> participent = {};
            participent = data['eventParticipent'];
            bool isRegistered = participent.containsKey(FirebaseAuth.instance.currentUser?.uid);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                title: const Text('Popular Events',
                    style: TextStyle(color: Colors.black)),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined,
                        color: Colors.black),
                  ),
                ],
                systemOverlayStyle: SystemUiOverlayStyle.dark,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(data['bannerUrl']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12, bottom: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['eventTitle'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data['eventDetails'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  SizedBox(width: 10),
                                  Text("$day/$month/$year"),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.access_time),
                                  SizedBox(width: 10),
                                  Text(
                                      "${dateTime.hour}:${dateTime.minute} - ${dateTimeb.hour}:${dateTimeb.minute}"),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10),
                                  Text("Venue : ${data['eventVenue']}"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          ExpansionTile(
                            title: Text("Event Details"),
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10, bottom: 15),
                                child: Text(
                                  data['eventDescription'],
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 40,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            if(isRegistered){
                              Fluttertoast.showToast(msg: "You already enrolled in this event");
                            }else{
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EventRegisterScreen(docId: widget.docId)),
                              );
                            }
                          },
                          child: const Text("Register"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        });
  }
}
