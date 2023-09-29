import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:notification_app/config/validators.dart';


class NeedHelpScreen extends StatefulWidget {
  const NeedHelpScreen({Key? key}) : super(key: key) ;

  static const routeName = '/needHlep';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const NeedHelpScreen(),
    );
  }
  @override
  State<StatefulWidget> createState() => _NeedHelpScreen();

}

class _NeedHelpScreen extends State<NeedHelpScreen> {

  final TextEditingController fullnameTextController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController problemDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        // title: const Text("Need Help",
        // style: TextStyle(
        //   color: Colors.black
        // ),),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 10,
              ),
              Text("Do You Need Hlep?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),),
              Padding(
                padding: const EdgeInsets.only(right: 50, top: 10),
                child: Lottie.asset(
                  'assets/lottie_animation/need_help.json',
                  height: 250,
                  width: 350,
                  fit: BoxFit.cover,
                  repeat: false,
                  reverse: false,
                  animate: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Let me know if you need help?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
              ),),
              SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  controller: fullnameTextController,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                      labelText: 'Full name',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: problemDescriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      hintText: 'Problem description',
                      border: OutlineInputBorder()),
                ),

              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _onFormSubmitted,
                    child: const Text(
                      "Send",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }

  void _onFormSubmitted() {
    try {
      if (fullnameTextController.text.isEmpty) {
        showSeekError("Enter your name");
      } else if (!Validators.isValidEmail(emailController.text)) {
        showSeekError("Enter valid email");
      } else if (problemDescriptionController.text.isEmpty) {
        showSeekError("Enter Problem Description");
      }else {
        //submit
      }
    } catch (e) {
      showSeekError(e.toString());
    }
  }

  void showSeekError(String error) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(error),
            ],
          ),
        ),
      );
  }
}