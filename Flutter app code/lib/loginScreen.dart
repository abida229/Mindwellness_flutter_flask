

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_code/SignUp.dart';
import 'package:get/get.dart';
import 'package:fyp_code/Dashboard.dart';

class loginScreen extends StatefulWidget {



  loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  double width=0;

  double height=0;

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
              child: const Center(
                child: Text(
                  'Welcome to the App!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),


            // ElevatedButton(onPressed: (){
            //  Get.changeTheme(ThemeData.light());
            // },
            //
            //     child: Text("Change Theme")),


            SizedBox(height: 20),
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
            // Login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  final auth = FirebaseAuth.instance;
                  auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);

                  if(auth.currentUser!=null){
                    Get.to(Dashboard(), transition: Transition.leftToRightWithFade);
                  }

                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Register link

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Do not have an account?'),
                TextButton(
                  onPressed: () {
                    Get.to(SignUp(),transition:Transition.leftToRightWithFade );
                  },
                  child: Text('Register'),
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
          ], ),
      ),
    );
  }


}

// final auth = FirebaseAuth.instance;
// auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
//
// if(auth.currentUser!=null){
// Get.to(Dashboard(), transition: Transition.leftToRightWithFade);
// }
//
