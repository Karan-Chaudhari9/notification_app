import 'package:flutter/material.dart';

void main() => runApp(EventRegistration());

class EventRegistration extends StatefulWidget {
  const EventRegistration();

  @override
  State<EventRegistration> createState() => _EventRegistration();
}

class _EventRegistration extends State<EventRegistration> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;
  String? firstName;
  String? lastName;
  String? enrollmentNo;
  String? emailAddress;
  String? mobileNo;
  String? departmentValue;

  @override
  void initState() {
    firstName = null;
    lastName = null;
    enrollmentNo = null;
    emailAddress = null;
    mobileNo = null;
    departmentValue = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Event Registration",
              style: TextStyle(fontSize: 24),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      "Registration Form",
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "First Name",
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
                            )),
                      ),
                      validator: validateFastName,
                      onSaved: (String? value) {
                        firstName = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Last Name",
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
                            )),
                      ),
                      validator: validateLastName,
                      onSaved: (String? value) {
                        lastName = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Enrollment No",
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
                            )),
                      ),
                      validator: validateEnrollmentNo,
                      onSaved: (String? value) {
                        enrollmentNo = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
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
                      validator: validateDepartmentDropdown,
                      onChanged: (String? newValue) {
                        departmentValue = newValue;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
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
                            )),
                      ),
                      validator: validateEmailAddress,
                      onSaved: (String? value) {
                        emailAddress = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Mobile No",
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
                            )),
                      ),
                      validator: validateMobileNo,
                      onSaved: (String? value) {
                        mobileNo = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: ElevatedButton(
                        onPressed: _validateInput,
                        child: const Padding(
                          padding:  EdgeInsets.only(top: 6, bottom: 6),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void _validateInput() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(firstName! +
          " " +
          lastName! +
          " " +
          enrollmentNo! +
          " " +
          departmentValue! +
          " " +
          emailAddress! +
          " " +
          mobileNo!);
    } else {
      setState(() {
        _autovalidate = AutovalidateMode.always;
      }
      );
    }
  }

  String? validateFastName(String? value) {
    if (value!.isEmpty || value == null) {
      return 'Fast Name cannot be empty';
    }
    if (value.length < 3) {
      return 'Fast Name must be more than 2 characters';
    } else {
      return null;
    }
  }

  String? validateLastName(String? value) {
    if (value!.isEmpty || value == null) {
      return 'Last Name cannot be empty';
    }
    if (value.length < 3) {
      return 'Last Name must be more than 2 characters';
    } else {
      return null;
    }
  }

  String? validateEnrollmentNo(String? value) {
    if (value!.isEmpty || value == null) {
      return 'Enrollment No cannot be empty';
    }
    if (value.length != 9) {
      return 'Enrollment No must be of 9 digit';
    } else {
      return null;
    }
  }

  String? validateDepartmentDropdown(String? value) {
    return value == null || value.isEmpty ? 'Please Choose Department' : null;
  }

  String? validateEmailAddress(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty || value == null) {
      return 'Email Address cannot be empty';
    }
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email Address';
    } else {
      return null;
    }
  }

  String? validateMobileNo(String? value) {
    if (value!.isEmpty || value == null) {
      return 'Phone number cannot be empty';
    }
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }
}
