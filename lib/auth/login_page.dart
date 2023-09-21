import 'package:flutter/material.dart';
import 'package:notification_app/auth/sign_up_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      color: Colors.grey.shade300,
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            body: ListView(
              children: [
                SizedBox(
                  width: 100,
                  height: 150,
                  child: Image.asset('assets/images/Atmiya_Logo.png'),
                ),
                const SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child:Column(
                    children: [
                      const Text(
                          'नमस्कारः',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 32
                        ) ,
                      ),
                      const Text(
                        'Sign in your account',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(height: 30.0,),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot your Password?',
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      SizedBox(
                        height: 53,
                        width: 120,
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height:60,
                          onPressed: (){},
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                            fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(width: 10.0,),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => const SignupPage()
                        )
                        );
                      },
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                            color: Color.fromARGB(255, 29, 39, 157),
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
