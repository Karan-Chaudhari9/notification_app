import 'package:flutter/material.dart';
import 'package:notification_app/screens/proflie_edit_screen.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<StatefulWidget> createState() => _Profile_Screen();
}

class _Profile_Screen extends State<StatefulWidget> {
  var name = "Kamado Tanjiro";
  var Email = "kamadotanjiro123@gmail.com";
  var Depart = "Computer Enginnering";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Center(
              child: Text(
            "My Profile          ",
            style: TextStyle(color: Colors.black38, fontSize: 20),
          )),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffe6e9f0),
              Color(0xffeef1f5),
            ]),
          ),
          //width: double.infinity,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 190,
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(color: Colors.white70, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.cyan.shade100,
                        blurRadius: 80,
                        spreadRadius: 20,
                      )
                    ]),
                // profile photo
                child: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(95),
                    child: Image.asset("assets/images/ok.jpg"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //Icon for editing profile
              Container(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 270,
                    ),
                    InkWell(
                      //Navigator to Edit Page
                      child: Container(
                          width: 70,
                          child: const Icon(
                            Icons.edit,
                            size: 35,
                            color: Colors.black26,
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditPage()));
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Infomation
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white70,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 305,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 2, color: Colors.cyan))),
                      child: Center(
                          child: Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 30),
                      )),
                      height: 40,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.account_box_outlined,
                            color: Colors.black26,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            name,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            color: Colors.black26,
                          ),
                          Text(
                            Email,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 250,
                      height: 70,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.group,
                            color: Colors.black26,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            Depart,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.account_box_outlined, size: 50),
                  Icon(Icons.account_box_outlined, size: 50),
                  Icon(Icons.account_box_outlined, size: 50),
                  Icon(Icons.account_box_outlined, size: 50),
                  Icon(Icons.account_box_outlined, size: 50),
                ],
              )
            ],
          ),
        ));
  }
}
