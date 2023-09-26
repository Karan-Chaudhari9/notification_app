import 'package:flutter/material.dart';
class EditPage extends StatefulWidget {
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var Name = TextEditingController();
  var Email = TextEditingController();
  var PhoneNumber = TextEditingController();
  var Depart = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Edit Profile          ",
          style: TextStyle(color: Colors.black38, fontSize: 20),)),
        elevation: 0,
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 720,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xffe6e9f0),
                  Color(0xffeef1f5),
                ]
            ),
          ),
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                ///profile Picture
                Container(
                  height: 175,
                  width: 175,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.white70, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyan.shade200,
                          blurRadius: 150,
                          spreadRadius: 20,
                        )
                      ]
                  ),
                  // profile photo
                  child:
                  CircleAvatar(
                    radius: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(220),
                        child: Image.asset("assets/images/ok.jpg")
                    ),
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                ///All Text Feilds
                Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///Name
                      Container(
                          width:250,
                          child: TextField(
                            controller: Name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black
                                  )
                              ),
                              label:Text("Name"),
                              prefixIcon: Icon(Icons.account_box_outlined,color: Colors.black26,),
                            ),
                          )
                      ),
                      SizedBox(height: 30,),
                      ///Email
                      Container(
                          width:250,
                          child: TextField(
                            controller: Email,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black
                                  )
                              ),
                              label:Text("E-Mail"),
                              prefixIcon: Icon(Icons.email_outlined,color: Colors.black26,),
                            ),
                          )
                      ),
                      SizedBox(height: 30,),
                      ///Contact
                      Container(
                          width:250,
                          child: TextField(
                            controller: PhoneNumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black
                                  )
                              ),
                              label:Text("Contact Number"),
                              prefixIcon: Icon(Icons.phone_in_talk_outlined,color: Colors.black26,),

                            ),
                          )
                      ),
                      SizedBox(height: 30,),
                      ///Department
                      Container(
                          width:250,
                          child: TextField(
                            controller: Name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black
                                  )
                              ),
                              label:Text("Depatment"),
                              prefixIcon: Icon(Icons.email_outlined,color: Colors.black26,),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ///Save and Cancel button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                          width: 150,
                          height: 50,
                          child: Center(child: Text("Save",style: TextStyle(fontSize: 20),)),
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(15)
                          )
                      ),
                    ),
                    SizedBox(),
                    InkWell(
                      onTap: (){
                      },
                      child: Container(
                          width: 150,
                          height: 50,
                          child: Center(child: Text("Cancel",style: TextStyle(fontSize: 20),)),
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(15)
                          )
                      ),
                    ),
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }
}
