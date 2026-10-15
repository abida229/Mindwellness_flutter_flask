import 'package:flutter/material.dart';
import 'package:fyp_code/loginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fyp_code/screens/result.dart';
import 'package:fyp_code/firebase_options.dart';
import 'package:fyp_code/ChatScreen.dart';
import 'package:fyp_code/screens/assessment.dart';




Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const GetMaterialApp(
    home: SplashScreen(),
  ));
}

// void main() {
//   runApp(const GetMaterialApp(
//     home: SplashScreen(),
//   ));
// }

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(

      backgroundColor: Colors.white,
      childWidget: SizedBox(

        width: 200,
        height: 200,
        child: Image.asset("assets/images/mindwellness.jpeg",
          width: 300,
          height: 300,),
      ),
      nextScreen: MyApp(),
      //nextScreen: ChatPage(),
      //nextScreen: HealthAssessmentScreen(),
      //nextScreen: ResultScreen(result: '2',),


    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/mindwellness.jpeg",
                  width: 200,
                  height: 200,),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("MindWellness",
                    style: GoogleFonts.abel(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),)
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: (){
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context)=>LoginScreen() ) );

                    Get.to(loginScreen(),transition:Transition.leftToRightWithFade );
                  },
                  child:  Text("Get Started"),

                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
