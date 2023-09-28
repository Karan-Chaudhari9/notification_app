// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:ffi';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/bloc/auth/auth_bloc.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 30),
            SizedBox(
              height: 175,
              child: SwiperView(context),
            ),
            const SizedBox(height: 25),
            LiveEventView(context),
            PopulerEventView(context),
            RecommendedEventView(context)
          ],
        ),
      ),
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

class Events {
  String? imageUrl;
  String? eventName;

  Events({
    this.imageUrl,
    this.eventName,
  });
}

final List<Events> events = [
  Events(
    imageUrl: 'assets/images/HAC.png',
    eventName: 'Git & GitHub',
  ),
  Events(
    imageUrl: 'assets/images/HAC.png',
    eventName: 'Hackathon',
  ),
  Events(
    imageUrl: 'assets/images/HAC.png',
    eventName: 'Avsar',
  ),
  Events(
    imageUrl: 'assets/images/HAC.png',
    eventName: 'Quiz Competion',
  ),
  Events(
    imageUrl: 'assets/images/HAC.png',
    eventName: 'Workshops',
  ),
];

class LiveEvents {
  String? imageUrl;
  String? eventName;

  LiveEvents({
    this.imageUrl,
    this.eventName,
  });
}

final List<LiveEvents> liveEvents = [
  LiveEvents(
    imageUrl: 'assets/images/HAC.png',
    eventName: 'Git & GitHub',
  ),
  LiveEvents(
    imageUrl: 'assets/images/HAC.png',
    eventName: 'Hackathon',
  ),
  LiveEvents(
    imageUrl: 'assets/images/HAC.png',
    eventName: 'Avsar',
  ),
  LiveEvents(
    imageUrl: 'assets/images/HAC.png',
    eventName: 'Ai/Ml',
  ),
  LiveEvents(
    imageUrl: 'assets/images/HAC.png',
    eventName: 'Workshops',
  ),
];

Widget SwiperView(BuildContext context) {
  return Swiper(
    viewportFraction: 0.8,
    scale: 0.9,
    itemCount: 3,
    autoplay: true,
    itemBuilder: (context, index) => Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blueAccent.withOpacity(0.5),
          ),
          child: const Text(
            'FUTURE EVENTS POSTER',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget LiveEventView(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, bottom: 10),
        child: const Text(
          'Latest Events',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      SizedBox(
        height: 167,
        width: double.infinity,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: events.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 140,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                border: Border.all(color: Colors.black12),
              ),
              child: Stack(
                // Use a Stack to overlay the button
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.5),
                            topRight: Radius.circular(8.5),
                          ),
                          image: DecorationImage(
                            image: AssetImage(events[index].imageUrl!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          events[index].eventName!,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    left: 158,
                    child: SizedBox(
                      height: 29.0,
                      width: 80.0,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black45),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        onPressed: () {},
                        child: const Text("Join"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget PopulerEventView(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, bottom: 10),
        child: const Text(
          'Populer Events',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      SizedBox(
        height: 167,
        width: double.infinity,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: events.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 140,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                border: Border.all(color: Colors.black12),
              ),
              child: Stack(
                // Use a Stack to overlay the button
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.5),
                            topRight: Radius.circular(8.5),
                          ),
                          image: DecorationImage(
                            image: AssetImage(events[index].imageUrl!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          events[index].eventName!,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    left: 158,
                    child: SizedBox(
                      height: 29.0,
                      width: 80.0,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black45),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        onPressed: () {},
                        child: const Text("Join"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget RecommendedEventView(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, bottom: 10),
        child: const Text(
          'Recommended Events',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      SizedBox(
        height: 167,
        width: double.infinity,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: events.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 140,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                border: Border.all(color: Colors.black12),
              ),
              child: Stack(
                // Use a Stack to overlay the button
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.5),
                            topRight: Radius.circular(8.5),
                          ),
                          image: DecorationImage(
                            image: AssetImage(events[index].imageUrl!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          events[index].eventName!,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    left: 158,
                    child: SizedBox(
                      height: 29.0,
                      width: 80.0,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black45),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        onPressed: () {},
                        child: const Text("Join"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
