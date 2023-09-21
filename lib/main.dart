import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePageView(),
    )
  );
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications))
        ],
        title: const Text("Atmiya Event "),
        centerTitle: true,
      ),
      drawer: _buildDrawer(),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 40,),
          Container(
            margin: const EdgeInsets.only(left: 25.0),
            child: const Wrap(
              children: <Widget> [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(

                    'Find the',
                    style: TextStyle(
                        fontSize: 40
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'trending events',
                    style: TextStyle(
                        fontSize: 40
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30.0,),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 10),
            child: Padding(
                padding: const EdgeInsets.all(6.0),
              child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                    hintText: 'Search Events',
                    trailing: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list)
                      ),
                    ],
                  );
                },
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                }
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: const Text(
                      'Popular Events' ,
                      style: TextStyle(
                          fontSize: 24,
                        fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(width: 140.0,),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                          'See all',
                        style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.underline
                        ),
                      )),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30,),

        ],
      )
    );
  }
}

_buildDrawer() {
  const String image = 'https://play-lh.googleusercontent.com/0SAFn-mRhhDjQNYU46ZwA7tz0xmRiQG4ZuZmuwU8lYmqj6zEpnqsee_6QDuhQ4ZofwXj=w240-h480-rw' ;
  return Drawer(
    child: Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.only(left: 16.0 , right: 40.0),
      decoration: const BoxDecoration(
        color: Colors.lightBlueAccent,
        boxShadow: [BoxShadow(color: Colors.black45)],
      ),
      width: 300,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(            children: <Widget>[
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
                  backgroundImage: NetworkImage(image),
                ),
              ),
              const SizedBox(height: 5.0,),
              const Text(
                'Karan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600
                ),
              ),
              const Text(
                'karan9030@gmail.com' ,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600
              ),
              ),
              const SizedBox(height: 30,),
              _buildRow(Icons.home,"Home"),
              _buildDivider(),
              _buildRow(Icons.person_pin,"My Profile"),
              _buildDivider(),
              _buildRow(Icons.message,"Messages"),
              _buildDivider(),
              _buildRow(Icons.notifications,"Notifications"),
              _buildDivider(),
              _buildRow(Icons.settings,"Settings"),
              _buildDivider(),
              _buildRow(Icons.email,"Contact us"),
              _buildDivider(),
              _buildRow(Icons.info_outline,"Help"),
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

Widget _buildRow(IconData icon, String title){
  const TextStyle tStyle = TextStyle(color: Colors.black, fontSize: 16.0);
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
        ),
        const SizedBox(width: 10.0,),
        Text(
          title,
          style: tStyle,
        ),
        const Spacer(),
      ],
    ),
  );
}