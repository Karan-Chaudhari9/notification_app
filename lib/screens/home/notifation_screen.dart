import 'package:flutter/material.dart';

class NotifactionScreen extends StatelessWidget {
  const NotifactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NotifactionView();
  }
}

class NotifactionView extends StatefulWidget {
  const NotifactionView({super.key});

  @override
  State<NotifactionView> createState() => _NotifactionViewState();
}

class _NotifactionViewState extends State<NotifactionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
    );
  }
}
