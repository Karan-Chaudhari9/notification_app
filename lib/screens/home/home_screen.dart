import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/manager/swiper_manager.dart';

import '../../manager/event_manager.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List events = [];
  List swiper = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: 175,
            child: FutureBuilder(
                future: SwiperManager().getSwiper(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("something went wrong");
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    swiper = snapshot.data;

                    return SwiperView(context, swiper);
                  }
                  return const Center(child: const CircularProgressIndicator());
                }),
          ),
          FutureBuilder(
              future: EventManager().getLatestData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong...");
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  events = snapshot.data as List;
                  return LatestEventView(context, events);
                }
                return const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }),
          FutureBuilder(
              future: EventManager().getPopulerData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                    "Something went wrong",
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  events = snapshot.data as List;
                  return PopulerEventView(context, events);
                }
                return const Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }),

          // FutureBuilder(future: , builder:)
        ]),
      ),
    );
  }
}

Widget SwiperView(BuildContext context, List swipers) {
  return Swiper(
    viewportFraction: 0.8,
    scale: 0.9,
    itemCount: swipers.length,
    autoplay: true,
    itemBuilder: (context, index) => Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        CachedNetworkImage(
          imageUrl: swipers[index]['bannerUrl'],
          placeholder: (context, url) =>
              Image.asset('assets/images/Atmiya_Logo.png'),
        )
      ],
    ),
  );
}

Widget LatestEventView(BuildContext context, List events) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
        child: Text(
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
            return InkWell(
              onTap: () {
                String docId = events[index]['docId'] ?? "doc";
                print("=============");
                print(docId);
                context.push('/eventView', extra: docId);
              },
              child: Container(
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
                              image: NetworkImage(events[index]['bannerUrl'],),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            events[index]['eventTitle'] ?? "",
                            style: const TextStyle(fontSize: 15.0),
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
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black45),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          onPressed: () {},
                          child: const Text("Join"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget PopulerEventView(BuildContext context, List events) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
        child: Text(
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
                            image: NetworkImage(events[index]['bannerUrl']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          events[index]['eventTitle'],
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
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black45),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
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

Widget RecommendedEventView(BuildContext context, List events) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20, top: 15, bottom: 10),
        child: Text(
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
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black45),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
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
