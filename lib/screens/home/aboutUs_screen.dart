import 'package:flutter/material.dart';
class AboutUs extends StatefulWidget{

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 60),
              const Text("About Us",style: TextStyle(fontSize: 24),),
              const SizedBox(height: 30),
              //Logo
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(color: Colors.white70,width: 3),
                ),
                // profile photo
                child:
                CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(95),
                    child: Image.asset("assets/images/logo.jpeg"),
                  ),
                ),
              ),
              const SizedBox(
                width: 285,
                child: Text(
                  "AU-EventFlow, powered by the dynamic combination of Flutter and Firebase, revolutionizes event management and discovery. It not only simplifies event creation, updates, and attendee communication but also offers a range of unique benefits. Thanks to Flutter's single codebase, AU-EventFlow is available seamlessly on both iOS and Android, eliminating the need for separate development efforts. Its beautiful and responsive user interfaces are easily customizable, enabling pixel-perfect designs that enhance user experiences. The 'hot reload' feature accelerates development, allowing for rapid iterations and quicker updates. Plus, Flutter's performance is top-notch, offering near-native speeds without sacrificing user interface flexibility. These advantages make AU-EventFlow a standout choice in the realm of event management apps, ensuring a smooth and efficient experience for organizers and attendees alike.",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 70,),
            ],
          ),
        )
    );
  }
}
