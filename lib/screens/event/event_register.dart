import 'package:flutter/material.dart';
import 'package:notification_app/config/validators.dart';
import 'package:notification_app/manager/event_manager.dart';
import 'package:notification_app/screens/event/ticket_screen.dart';

class EventRegisterScreen extends StatefulWidget {
  final String docId;
  const EventRegisterScreen({Key? key,required this.docId}) : super(key: key);

  @override
  State<EventRegisterScreen> createState() => _EventRegisterScreenState();
}

class _EventRegisterScreenState extends State<EventRegisterScreen> {
  final TextEditingController fullnameTextController = TextEditingController();
  final TextEditingController enrollmentTextController = TextEditingController();
  late String departmentTextController;
  final TextEditingController phonenumberTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Register to your event',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: fullnameTextController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Full name',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: enrollmentTextController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Enrollment No',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.ad_units_sharp),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
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
                onChanged: (String? value) {
                  departmentTextController = value.toString();
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: phonenumberTextController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.dialer_sip),
                    labelText: 'Phone No',
                    border: OutlineInputBorder()),
                autocorrect: false,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: _onFormSubmitted,
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onFormSubmitted() {
    try {
      if (fullnameTextController.text.isEmpty) {
        showSeekError("Enter your name");
      } else if (enrollmentTextController.text.isEmpty) {
        showSeekError("Enter enrollment no");
      } else if (departmentTextController == null ||
          departmentTextController.isEmpty) {
        showSeekError("Please select department");
      } else if (phonenumberTextController.text.isEmpty) {
        showSeekError("Enter phone no");
      } else{
        try {
          EventManager().registerEvent(
              fullnameTextController.text, enrollmentTextController.text,
              departmentTextController, widget.docId,
              phonenumberTextController.text);
          TicketScreen(docid: widget.docId, uid: DateTime.now().millisecond.toString());
        } catch(e){
        }
        }
    } catch (e) {
      showSeekError(e.toString());
    }
  }

  void showSeekError(String error) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(error),
            ],
          ),
        ),
      );
  }

  @override
  void dispose() {
    fullnameTextController.dispose();
    phonenumberTextController.dispose();
    enrollmentTextController.dispose();
    super.dispose();
  }
}
