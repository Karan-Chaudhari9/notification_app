import 'package:flutter/material.dart';

class NotifactionLayout extends StatefulWidget {
  const NotifactionLayout({super.key});

  @override
  State<NotifactionLayout> createState() => _NotifactionLayoutState();
}

class _NotifactionLayoutState extends State<NotifactionLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(),
        ),
      ),
    );
  }
}
