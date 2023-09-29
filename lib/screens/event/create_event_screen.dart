import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/create_event_manager.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

final TextEditingController bannerUrlController = TextEditingController();
final TextEditingController eventDescriptionController =
    TextEditingController();
final TextEditingController eventDetailsController = TextEditingController();
final TextEditingController eventEndTimeController = TextEditingController();
final TextEditingController eventStartTimeController = TextEditingController();
final TextEditingController eventTitleController = TextEditingController();
final TextEditingController eventVenueController = TextEditingController();

class _CreateEventState extends State<CreateEvent> {
  DateTime selectedStartDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  DateTime selectedEndDate = DateTime.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();
  String selectedValue = "FOET";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
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
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            const Text(
              'Create Event',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Event Title',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "e.g. Tech Event", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Add Photos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Banner',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 170,
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Event Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Event Description",
              ),
              maxLength: 300,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Select Department',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 2,
                    color: Colors.lightBlueAccent,
                  )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: BorderSide(
                        width: 2,
                      ))),
              hint: Text("Select Department"),
              borderRadius: BorderRadius.circular(15),
              items: <String>[
                'FOS',
                'FOBC',
                'FOET',
                'FOHS',
                'FOHSS',
                'FOTE',
                'OTHER'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {},
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Start Date & Time',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedStartDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null &&
                          pickedDate != selectedStartDate) {
                        setState(() {
                          selectedStartDate = pickedDate;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${selectedStartDate.toLocal()}".split(' ')[0],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedStartTime,
                      );
                      if (pickedTime != null &&
                          pickedTime != selectedStartTime) {
                        setState(() {
                          selectedStartTime = pickedTime;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${selectedStartTime.format(context)}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            const Text(
              'End Date and Time',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedEndDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null && pickedDate != selectedEndDate) {
                        setState(() {
                          selectedEndDate = pickedDate;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${selectedEndDate.toLocal()}".split(' ')[0],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedEndTime,
                      );
                      if (pickedTime != null && pickedTime != selectedEndTime) {
                        setState(() {
                          selectedEndTime = pickedTime;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${selectedEndTime.format(context)}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Venue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10.0),
            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.add_location),
                hintText: "Central Hall",
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Create a Map with the event data
                  final eventData = {
                    "Department": selectedValue,
                    "bannerUrl": bannerUrlController.text,
                    "eventDescription": eventDescriptionController.text,
                    "eventDetails": eventDetailsController.text,
                    "eventEndTime": int.parse(eventEndTimeController.text),
                    "eventStartTime": int.parse(eventStartTimeController.text),
                    "eventTitle": eventTitleController.text,
                    "eventVenue": eventVenueController.text,
                    "popular": true,
                  };
                  final eventBloc = BlocProvider.of<EventBloc>(context);
                  eventBloc.addEvent(eventData);
                },
                child: const Text('CREATE'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "FOS", child: Text("FOS ")),
      const DropdownMenuItem(value: "FOBC", child: Text("FOBC")),
      const DropdownMenuItem(value: "FOET", child: Text("FOET")),
      const DropdownMenuItem(value: "FOHS", child: Text("FOHS")),
      const DropdownMenuItem(value: "FOHSS", child: Text("FOHSS")),
      const DropdownMenuItem(value: "FOTE", child: Text("FOTE")),
      const DropdownMenuItem(
          value: "All Department", child: Text("All Department")),
    ];
    return menuItems;
  }
}
