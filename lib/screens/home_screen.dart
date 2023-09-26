import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/bloc/auth/auth_bloc.dart';
import 'package:notification_app/bloc/register/register_bloc.dart';

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
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            _authBloc.add(LoggedOut());
          }, icon: Icon(Icons.login_outlined))
        ],
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
            const SizedBox(height: 25),
            const Text(
              'Live Events',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Upcoming Events',
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
              height: 20,
            ),
            const SizedBox(
              height: 25,
            ),
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
            icon: Icon(Icons.bookmark_outline_sharp),
            label: 'Tickets',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Notification',
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

_buildDrawer() {
  return Drawer(
    child: Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
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
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/Atmiya_Logo.png'),
                ),
              ),
              const SizedBox(height: 5.0),
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
              const Divider(
                color: Colors.grey,
              ),
              _buildRow(Icons.home, "Home"),
              _buildRow(Icons.person, "My Profile"),
              _buildRow(Icons.notifications, "Notifications"),
              _buildRow(Icons.email, "Contact us"),
              _buildRow(Icons.info_outline, "Help"),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildRow(IconData icon, String title) {
  return InkWell(
    onTap: () {},
    child: SizedBox(
      height: 50,
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          const SizedBox(width: 10),
          Text(title)
        ],
      ),
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
