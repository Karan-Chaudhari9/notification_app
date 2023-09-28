import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(CreateEvent());
}

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
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
            SizedBox(height: 5),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "e.g. Tech Event", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            const Text(
              'Add Photos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 12.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Banner'),
                      const SizedBox(height: 2),
                      Container(
                        height: 170,
                        width: 250,
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
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Past Event'),
                      Container(
                        height: 170,
                        width: 250,
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
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Event Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Event Description",
              ),
              maxLength: 300,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Select Department',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButton(
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: dropdownItems),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Starts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_month_outlined),
                        hintText: "DD/MM/YYYY"),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.access_time_filled),
                      hintText: "10:10",
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Ends',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_month_outlined),
                        hintText: "DD/MM/YYYY"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.access_time_filled),
                        hintText: "10:10",
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('CREATE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "FOS", child: Text("FOS ")),
    const DropdownMenuItem(value: "FOBC", child: Text("FOBC")),
    const DropdownMenuItem(value: "FOET", child: Text("FOET")),
    const DropdownMenuItem(value: "FOHS", child: Text("FOHS")),
    const DropdownMenuItem(value: "FOHSS", child: Text("FOHSS")),
    const DropdownMenuItem(value: "FOTE", child: Text("FOTE")),
  ];
  return menuItems;
}
