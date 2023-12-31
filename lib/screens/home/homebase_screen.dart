// ignore_for_file: prefer_const_constructors, non_constant_identifier_names


import 'package:flutter/material.dart';
import 'package:notification_app/screens/event/create_event_screen.dart';
import 'package:notification_app/screens/home/home_screen.dart';
import 'package:notification_app/screens/home/notifation_screen.dart';
import 'package:notification_app/screens/home/profile_screen.dart';
import 'package:notification_app/screens/home/ticket_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int selectedPageIndex = 0;
  List<Widget> views = [
    HomeLayout(),
    NotifactionLayout(),
    TicketLayout(),
    ProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atmiya Events"),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateEvent()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: views[selectedPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          NavigationDestination(
            icon: Icon(Icons.sticky_note_2_outlined),
            label: 'Tickets',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
