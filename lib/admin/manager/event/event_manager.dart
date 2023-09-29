import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/admin/manager/event/event_attendece.dart';
import 'package:notification_app/manager/event_manager.dart';

void main() => AdminEvenManage();

class AdminEvenManage extends StatefulWidget {
  const AdminEvenManage({super.key});

  @override
  State<AdminEvenManage> createState() => _AdminEvenManageState();
}

class _AdminEvenManageState extends State<AdminEvenManage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Manage events"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            context.push('/adminCreateEvent');
          },
          child: Icon(Icons.add),
        ),
        body: FutureBuilder(
            future: EventManager().getLatestData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong...");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                List events = snapshot.data as List;
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.vertical,
                  itemCount: events.length,
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                      borderOnForeground: true,
                      child: ListTile(
                        title: Text(events[index]['eventTitle']),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(events[index]['eventTitle']),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                            },
                                            child: Text("Edit"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => EventAttedance(docid: events[index]['docId']),));
                                            },
                                            child: const Text("Attendance"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              try {
                                                deleteData(
                                                    events[index]['docId']);
                                                context.pop();
                                              }catch(e){
                                                FlutterErrorDetails(exception: e);
                                              }
                                            },
                                            child: Text("Delete event"),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              }
              return const Padding(
                padding: EdgeInsets.all(18.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }),
      ),
    );
  }

  Future<void> deleteData(String eventId) async {
    await FirebaseFirestore.instance.collection('events').doc(eventId).delete();
  }
}
