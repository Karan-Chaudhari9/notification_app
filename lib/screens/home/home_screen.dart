import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/bloc/event/event_bloc.dart';


class HomeScreenLayout extends StatefulWidget {
  const HomeScreenLayout({super.key});

  @override
  State<HomeScreenLayout> createState() => _HomeScreenLayoutState();
}

class _HomeScreenLayoutState extends State<HomeScreenLayout> {
  late EventBloc _eventBloc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}





Widget LiveEventView(BuildContext context) {
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
