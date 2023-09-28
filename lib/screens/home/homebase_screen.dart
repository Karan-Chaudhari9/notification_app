// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:ffi';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/bloc/auth/auth_bloc.dart';
import 'package:notification_app/screens/home/home_screen.dart';
import 'package:notification_app/screens/home/notifation_screen.dart';
import 'package:notification_app/screens/home/profile_screen.dart';
import 'package:notification_app/screens/home/ticket_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

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
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailchangeController = TextEditingController();

  late AuthBloc _authBloc;

  List<Widget> listWidget = [
    HomeScreenLayout(),
    NotifactionScreen(),
    TicketScreen(),
    Profile_Screen(),
  ];
  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
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
                _authBloc.add(LoggedOut());
              },
              icon: Icon(Icons.login_outlined))
        ],
      ),
      body: listWidget[selectedPageIndex],
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