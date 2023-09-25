import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'create_event_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

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
  int _selectedIndex = 0;

  static const List<Widget> _tabs = [
    Text('Home'),
    Text('Add'),
    Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateEvent()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atmiya Events"),
        centerTitle: true,
      ),
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 175,
              child: Swiper(
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
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Live Events',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
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
                      border: Border.all(color: Colors.black),
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
                            child: ElevatedButton(
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
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Upcoming Events',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 135,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 108,
                    width: 225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Stack(
                      // Use a Stack to overlay the button
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 93,
                              width: 225,
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
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          left: 150,
                          child: SizedBox(
                            height: 20.0,
                            width: 60.0,
                            child: ElevatedButton(
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
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Recommended Events',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 250,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

_buildDrawer() {
  return Drawer(
    child: Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.only(left: 16.0, right: 40.0),
      decoration: const BoxDecoration(
        color: Colors.lightBlueAccent,
        boxShadow: [BoxShadow(color: Colors.black45)],
      ),
      width: 300,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 90,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Colors.lightBlueAccent,
                      Colors.blue
                    ],
                  ),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/Atmiya_Logo.png'),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                'Karan',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                'karan9030@gmail.com',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              _buildRow(Icons.home, "Home"),
              _buildDivider(),
              _buildRow(Icons.person_pin, "My Profile"),
              _buildDivider(),
              _buildRow(Icons.notifications, "Notifications"),
              _buildDivider(),
              _buildRow(Icons.email, "Contact us"),
              _buildDivider(),
              _buildRow(Icons.info_outline, "Help"),
              _buildDivider(),
            ],
          ),
        ),
      ),
    ),
  );
}

Divider _buildDivider() {
  return Divider(
    color: Colors.grey.shade600,
  );
}

Widget _buildRow(IconData icon, String title) {
  const TextStyle tStyle = TextStyle(color: Colors.black, fontSize: 16.0);
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          title,
          style: tStyle,
        ),
        const Spacer(),
      ],
    ),
  );
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
