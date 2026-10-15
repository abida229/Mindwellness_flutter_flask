
import 'package:flutter/material.dart';
import 'package:fyp_code/Dashboard.dart';
import 'package:fyp_code/loginScreen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  double width=0;
  double height=0;

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top rectangle with welcome note
              Container(
                height: 150,
                color: Colors.lightBlue,
                child: Center(
                  child: Text(
                    'Welcome! Create a New Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),
              ),
              SizedBox(height: 10),
              // Username field

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),


              // Email field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),


              // Password field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Register button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: (){

                    debugPrint('${emailController.text}');
                    debugPrint('${passwordController.text}');

                    final auth = FirebaseAuth.instance;

                    auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                    if(auth.currentUser!=null){

                      Get.to(Dashboard(), transition: Transition.leftToRightWithFade);
                    }

                  },
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Login link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Get.to(loginScreen(),transition:Transition.leftToRightWithFade );
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Google sign-in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                  //handleGoogleSignIn
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/google-logo.png',
                            width: 30,
                            height: 30),
                      ),
                      const SizedBox(width: 10),
                      const Text('Sign in with Google'),

                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}





